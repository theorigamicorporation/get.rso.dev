## ADDED Requirements

### Requirement: Safety metadata
Scripts MAY declare `# @safety idempotent` or `# @safety one-time`. The catalog generator SHALL
emit `**Safety:** <value>` for each script that declares it, SHALL emit `**Safety:** idempotent`
for scripts with `@methods` that do not declare it, and SHALL emit nothing for other scripts.

#### Scenario: Tagged script
- **WHEN** `sh/enroll-fleetd.sh` contains `# @safety one-time`
- **THEN** its catalog entry contains `**Safety:** one-time`

#### Scenario: Untagged installer
- **WHEN** an installer has `@methods` and no `@safety` tag
- **THEN** its catalog entry contains `**Safety:** idempotent`

#### Scenario: Untagged non-installer
- **WHEN** a script has neither `@methods` nor `@safety`
- **THEN** its catalog entry has no Safety line
