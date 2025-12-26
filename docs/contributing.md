# Contributing

Thank you for considering contributing to the Cloudflare Terraform Module! This document provides guidelines and information for contributors.

## How to Contribute

### Reporting Bugs

If you find a bug, please create an issue on GitHub with:

- Clear description of the issue
- Steps to reproduce
- Expected vs actual behavior
- Terraform version
- Module version
- Relevant configuration (sanitized)

### Suggesting Features

Feature requests are welcome! Please:

- Check existing issues first
- Describe the use case
- Explain why this would benefit others
- Provide example usage if possible

### Pull Requests

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/your-feature`
3. **Make your changes**
4. **Update documentation**
5. **Run terraform-docs**: `terraform-docs markdown . > README.md`
6. **Test your changes**
7. **Commit with semantic commit messages**
8. **Push and create a pull request**

## Development Setup

### Prerequisites

- Terraform >= 1.0
- [terraform-docs](https://terraform-docs.io/)
- Cloudflare account for testing
- Git

### Local Development

```bash
# Clone your fork
git clone git@github.com:your-username/tf-module-cloudflare.git
cd tf-module-cloudflare

# Create a branch
git checkout -b feature/my-feature

# Make changes to a module
cd modules/pages

# Test the module
terraform init
terraform plan
```

## Coding Standards

### Terraform Style

- Use 2 spaces for indentation
- Follow [Terraform Style Guide](https://www.terraform.io/docs/language/syntax/style.html)
- Run `terraform fmt -recursive` before committing
- Use meaningful variable and resource names

### Variable Naming

```hcl
# Good
variable "account_id" {
  description = "Cloudflare account ID"
  type        = string
}

# Bad
variable "acc" {
  type = string
}
```

### Documentation

- Add descriptions to all variables
- Add descriptions to all outputs
- Update README.md with terraform-docs
- Include examples for new features

### Module Structure

```
modules/module-name/
├── main.tf          # Resources
├── variables.tf     # Input variables
├── outputs.tf       # Outputs
├── versions.tf      # Provider requirements
└── README.md        # Module documentation
```

## Commit Messages

We use [Semantic Commit Messages](https://www.conventionalcommits.org/):

```
feat: add support for custom SSL certificates
fix: correct DNS record TTL validation
docs: update email routing examples
chore: update terraform-docs
test: add validation tests
refactor: improve variable structure
```

Types:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation only
- `chore`: Maintenance
- `test`: Tests
- `refactor`: Code refactoring

## Testing

### Manual Testing

Before submitting a PR:

1. Test in a clean environment
2. Verify `terraform init` works
3. Verify `terraform plan` succeeds
4. Test `terraform apply` in a test account
5. Test `terraform destroy` cleans up properly

### Example Test

```bash
# In modules/pages directory
cat > test.tf <<EOF
module "test" {
  source = "./"

  account_id = var.cloudflare_account_id

  projects = {
    test = {
      name              = "test-project"
      production_branch = "main"
      github_repo       = "test/repo"
      build_command     = "npm run build"
      destination_dir   = "dist"
    }
  }
}
EOF

terraform init
terraform plan
```

## Documentation Updates

### Updating Module Documentation

After changing variables or outputs:

```bash
cd modules/pages
terraform-docs markdown . > README.md
```

### Updating MkDocs Documentation

If you add features or change behavior:

1. Update relevant pages in `docs/`
2. Test locally: `mkdocs serve`
3. Verify documentation builds correctly

## Release Process

Releases are automated using semantic-release:

1. Merge PR to `main`
2. Semantic-release analyzes commits
3. Automatically creates version tag
4. Generates CHANGELOG.md
5. Creates GitHub release

## Code of Conduct

### Our Standards

- Be respectful and inclusive
- Focus on constructive feedback
- Accept responsibility for mistakes
- Prioritize community benefit

### Unacceptable Behavior

- Harassment or discrimination
- Trolling or insulting comments
- Personal or political attacks
- Publishing others' private information

## Questions?

- Open a [GitHub Discussion](https://github.com/AutomationDojo/tf-module-cloudflare/discussions)
- Create an [Issue](https://github.com/AutomationDojo/tf-module-cloudflare/issues)

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
