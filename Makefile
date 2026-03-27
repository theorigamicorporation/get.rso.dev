SHELL := /bin/bash
.DEFAULT_GOAL := help

# Directories
SCRIPT_DIR := sh
TEST_RUNNER := tests/test-installer.sh
CATALOG_GEN := scripts/generate-catalog.sh

# Distro images
IMAGES := ubuntu:22.04 ubuntu:24.04 ubuntu:25.04 debian:12 debian:13 rockylinux:9 rockylinux:10 amazonlinux:2023

# Scripts (auto-detected from sh/get-*.sh)
SCRIPTS := $(notdir $(wildcard $(SCRIPT_DIR)/get-*.sh))

##@ Help
.PHONY: help
help: ## Show this help
	@printf "\033[1;34mget.rso.dev\033[0m — Development & Testing\n\n"
	@printf "\033[1mUsage:\033[0m\n"
	@printf "  make <target> [SCRIPT=get-jq.sh] [IMAGE=ubuntu:24.04] [METHOD=github-release]\n\n"
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z_-]+:.*##/ {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@printf "\n\033[1mScripts:\033[0m %s\n" "$(SCRIPTS)"
	@printf "\033[1mDistros:\033[0m %s\n" "$(IMAGES)"

##@ Testing
.PHONY: test test-quick test-all-methods test-method test-script test-image

test: ## Run default test suite (all scripts, all distros)
	@sh $(TEST_RUNNER) $(if $(SCRIPT),--script=$(SCRIPT)) $(if $(IMAGE),--image=$(IMAGE))

test-quick: ## Run --help tests only (fast, no installs)
	@sh $(TEST_RUNNER) --help-only $(if $(SCRIPT),--script=$(SCRIPT)) $(if $(IMAGE),--image=$(IMAGE))

test-all-methods: ## Test every install method per script per distro
	@sh $(TEST_RUNNER) --all-methods $(if $(SCRIPT),--script=$(SCRIPT)) $(if $(IMAGE),--image=$(IMAGE))

test-method: ## Test a specific method (requires METHOD=<method>)
ifndef METHOD
	$(error METHOD is required. Usage: make test-method METHOD=github-release)
endif
	@sh $(TEST_RUNNER) --method=$(METHOD) $(if $(SCRIPT),--script=$(SCRIPT)) $(if $(IMAGE),--image=$(IMAGE))

test-script: ## Test a specific script (requires SCRIPT=<script>)
ifndef SCRIPT
	$(error SCRIPT is required. Usage: make test-script SCRIPT=get-jq.sh)
endif
	@sh $(TEST_RUNNER) --script=$(SCRIPT) $(if $(IMAGE),--image=$(IMAGE))

test-image: ## Test on a specific distro (requires IMAGE=<image>)
ifndef IMAGE
	$(error IMAGE is required. Usage: make test-image IMAGE=ubuntu:24.04)
endif
	@sh $(TEST_RUNNER) --image=$(IMAGE) $(if $(SCRIPT),--script=$(SCRIPT))

##@ Build
.PHONY: catalog lint

catalog: ## Regenerate catalog.md from script metadata
	@sh $(CATALOG_GEN)
	@printf "\033[32mCatalog generated.\033[0m\n"

lint: ## Run shellcheck and dash syntax checks locally
	@printf "\033[1;34mShellCheck (POSIX scripts):\033[0m\n"
	@for f in $(SCRIPT_DIR)/*.sh; do \
		if head -1 "$$f" | grep -q 'env sh'; then \
			printf "  %-30s " "$$f"; \
			if shellcheck --shell=sh --severity=warning "$$f" 2>/dev/null; then printf "\033[32mOK\033[0m\n"; else printf "\033[31mFAIL\033[0m\n"; fi; \
		else \
			printf "  %-30s " "$$f (bash)"; \
			if shellcheck --shell=bash --severity=warning "$$f" 2>/dev/null; then printf "\033[32mOK\033[0m\n"; else printf "\033[31mFAIL\033[0m\n"; fi; \
		fi; \
	done
	@printf "\n\033[1;34mDash syntax check:\033[0m\n"
	@for f in $(SCRIPT_DIR)/*.sh; do \
		if head -1 "$$f" | grep -q 'env sh'; then \
			printf "  %-30s " "$$f"; \
			if dash -n "$$f" 2>/dev/null; then printf "\033[32mOK\033[0m\n"; else printf "\033[31mFAIL\033[0m\n"; fi; \
		fi; \
	done

##@ Development
.PHONY: shell pull-images clean

shell: ## Open a shell in a distro container (IMAGE=ubuntu:24.04)
ifndef IMAGE
	$(eval IMAGE := ubuntu:24.04)
endif
	@printf "\033[1;34mOpening shell in $(IMAGE) with scripts mounted...\033[0m\n"
	@podman run --rm -it -v $(CURDIR)/$(SCRIPT_DIR):/scripts:ro docker.io/library/$(IMAGE) sh

pull-images: ## Pre-pull all test distro images
	@for img in $(IMAGES); do \
		case "$$img" in \
			rockylinux:*) full="docker.io/rockylinux/rockylinux:$${img#rockylinux:}" ;; \
			amazonlinux:*) full="docker.io/amazonlinux:$${img#amazonlinux:}" ;; \
			*) full="docker.io/library/$$img" ;; \
		esac; \
		printf "\033[34mPulling $$full...\033[0m\n"; \
		podman pull "$$full" 2>/dev/null || true; \
	done

clean: ## Remove test containers and dangling images
	@podman container prune -f 2>/dev/null || true
	@podman image prune -f 2>/dev/null || true
	@printf "\033[32mCleaned up.\033[0m\n"
