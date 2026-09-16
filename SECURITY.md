# Security Policy

This repository is Chainguard's [EmeritOSS](https://www.chainguard.dev/unchained/introducing-chainguard-emeritoss)
fork of MinIO. Upstream `minio/minio` is archived, and the contact addresses in
the original MinIO security policy (`security@min.io` and the individual
coordinators listed there) are **not** the right place to report issues in this
fork. Reports sent there will not reach the people who maintain it.

## Reporting a Vulnerability

Please email **security@chainguard.dev** with:

- a description of the issue and the affected component or code path
- reproduction steps, including whether valid credentials are needed
- the release or commit you tested against (`minio --version`)

Please do not open a public GitHub issue for security reports. Issues and pull
requests on this repository are closed to the community.

Chainguard's general security policy is at https://github.com/chainguard-dev/.github/blob/main/SECURITY.md.

## Supported Versions

Only the latest release of this fork is maintained. Fixes are shipped as a new
release of this repository and as updates to the Chainguard `minio` and
`minio-fips` container images. Published advisories for those images are at
https://images.chainguard.dev/security.

## Scope

Maintenance is best effort, as described in the README: dependency
vulnerabilities are updated regularly, and vulnerabilities in the project's own
source code are fixed when that can be done safely and with minimal risk. Fixes
that would require extensive changes may not be made. There is no service level
agreement on this fork.

## Disclosure

Chainguard's product security team coordinates validation, the fix, CVE
assignment where appropriate, and disclosure. Please allow reasonable time for a
fix to ship before publishing details.
