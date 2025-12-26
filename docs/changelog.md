# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

For the automatically generated changelog, see [CHANGELOG.md](https://github.com/AutomationDojo/tf-module-cloudflare/blob/main/CHANGELOG.md) in the repository root.

## [1.0.0] - 2024-12-26

### Added

- Initial release of Cloudflare Terraform Module
- **Pages Module**: Cloudflare Pages projects management
  - GitHub integration for CI/CD
  - Custom domain support
  - Environment variables configuration
  - Support for multiple projects

- **DNS Module**: DNS records management
  - Support for all DNS record types (A, AAAA, CNAME, MX, TXT, etc.)
  - Cloudflare proxy configuration
  - Configurable TTL per record
  - Bulk record management

- **Email Routing Module**: Email forwarding and routing
  - Email forwarding to external addresses
  - Rule-based routing with matchers
  - Priority-based rule ordering
  - Support for literal, wildcard, and regex patterns
  - Multiple action types (forward, drop, worker)

- Automated versioning with semantic-release
- Auto-generated documentation with terraform-docs
- Comprehensive examples and documentation

### Documentation

- Complete module documentation
- Getting started guide
- Installation instructions
- Usage examples
- Contributing guidelines

[1.0.0]: https://github.com/AutomationDojo/tf-module-cloudflare/releases/tag/v1.0.0
