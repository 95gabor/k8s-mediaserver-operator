# Contributing to k8s-mediaserver

Thank you for your interest in contributing to k8s-mediaserver! This document provides guidelines and instructions for contributing.

## Getting Started

1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/YOUR_USERNAME/k8s-mediaserver-operator.git
   cd k8s-mediaserver-operator
   ```
3. Add the upstream repository:
   ```bash
   git remote add upstream https://github.com/95gabor/k8s-mediaserver-operator.git
   ```

## Development Setup

### Prerequisites

- Python 3.x (for pre-commit)
- Helm 3.x
- Git

### Install Pre-commit Hooks

This project uses [pre-commit](https://pre-commit.com/) to ensure code quality and consistency. Pre-commit hooks will automatically run checks before each commit.

1. Install pre-commit:
   ```bash
   pip install pre-commit
   ```

2. Install the git hooks:
   ```bash
   pre-commit install
   ```

3. (Optional) Install the commit-msg hook for conventional commits:
   ```bash
   pre-commit install --hook-type commit-msg
   ```

4. (Optional) Run pre-commit on all files to check everything:
   ```bash
   pre-commit run --all-files
   ```

### Pre-commit Hooks

The following hooks are configured:

- **Conventional Commits** - Enforces conventional commit message format
- **YAML Linting** - Validates YAML syntax
- **Helm Linting** - Validates Helm chart syntax
- **Helm Docs** - Generates/updates README documentation
- **File Checks** - Validates file endings, trailing whitespace, etc.

## Making Changes

### Creating a Branch

Create a new branch for your changes:

```bash
git checkout -b feature/your-feature-name
# or
git checkout -b fix/your-bug-fix
```

### Commit Message Format

This project uses [Conventional Commits](https://www.conventionalcommits.org/) format. Commit messages should follow this structure:

```
<type>(<scope>): <subject>

<body>

<footer>
```

**Types:**
- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation only changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

**Examples:**
```
feat(seerr): add init container for permission setup

fix(sonarr): correct ingress path configuration

docs(readme): update installation instructions

chore(deps): update helm-docs version
```

### Code Style

- Follow existing code patterns and structure
- Keep Helm templates readable and well-commented
- Ensure all templates render only one resource per file
- Use consistent indentation (spaces, not tabs)

### Testing Your Changes

1. **Lint your changes:**
   ```bash
   pre-commit run --all-files
   ```

2. **Test template rendering:**
   ```bash
   helm template test-release ./helm-charts/k8s-mediaserver \
     -f ./helm-charts/k8s-mediaserver/values.yaml
   ```

3. **Test individual charts:**
   ```bash
   helm template test-release ./helm-charts/sonarr \
     -f ./helm-charts/sonarr/values.yaml
   ```

4. **Update documentation:**
   ```bash
   helm-docs --chart-search-root=helm-charts
   ```

## Submitting Changes

### Pull Request Process

1. **Update your branch:**
   ```bash
   git fetch upstream
   git rebase upstream/main
   ```

2. **Push your changes:**
   ```bash
   git push origin feature/your-feature-name
   ```

3. **Create a Pull Request:**
   - Go to the GitHub repository
   - Click "New Pull Request"
   - Select your branch
   - Fill out the PR template
   - Ensure all CI checks pass

### Pull Request Guidelines

- **Title**: Use conventional commit format (e.g., `feat(seerr): add init container`)
- **Description**: Clearly describe what changes you made and why
- **Testing**: Describe how you tested your changes
- **Breaking Changes**: If applicable, clearly document any breaking changes
- **Related Issues**: Link to any related issues

### What to Include

- Clear description of changes
- Updated documentation if needed
- Updated README files (generated via helm-docs)
- Tests if applicable

## Chart Development Guidelines

### Adding a New Service

1. Create a new chart directory: `helm-charts/<service-name>/`
2. Follow the existing chart structure:
   - `Chart.yaml` - Chart metadata
   - `values.yaml` - Default values
   - `README.md.gotmpl` - Documentation template
   - `templates/` - Kubernetes manifests
3. Ensure each template file renders only one resource
4. Add the service to the umbrella chart's `Chart.yaml` dependencies
5. Update the umbrella chart's `values.yaml` with service configuration
6. Generate documentation: `helm-docs --chart-search-root=helm-charts`

### Modifying Existing Services

- Maintain backward compatibility when possible
- Update version numbers in `Chart.yaml` appropriately
- Update documentation
- Test with existing values files

## Code Review

All contributions go through code review. Reviewers may:
- Request changes
- Ask questions
- Suggest improvements

Please be responsive to feedback and maintain a constructive, respectful tone.

## Questions?

If you have questions or need help:
- Open an issue for discussion
- Check existing issues and pull requests
- Review the documentation

## License

By contributing, you agree that your contributions will be licensed under the same license as the project (MIT License).

Thank you for contributing! 🎉
