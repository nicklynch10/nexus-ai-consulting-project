# Contributing to Nexus AI Consulting

Thank you for your interest in contributing to the Nexus AI Consulting website! This document outlines the process and guidelines for contributing to this project.

## Workflow Overview

We follow a feature-branch workflow with code reviews:

1. Create a feature branch from `development` for your work
2. Make commits with clear, descriptive messages
3. Create a Pull Request to merge your changes into `development`
4. Address any feedback during code review
5. Once approved, your changes will be merged

## Branching Strategy

- `main`: Production-ready code (protected branch)
- `development`: Integration branch for ongoing work
- `feature/*`: Individual feature branches
- `hotfix/*`: Urgent production fixes
- `release/*`: Release preparation branches

## Getting Started

1. Clone the repository
2. Check out the `development` branch
3. Create a new feature branch for your work:
   ```bash
   git checkout development
   git pull origin development
   git checkout -b feature/your-feature-name
   ```

## Commit Guidelines

- Use clear, concise commit messages
- Follow the conventional commit format:
  - `feat: Add new feature`
  - `fix: Resolve issue with component`
  - `docs: Update documentation`
  - `style: Code formatting changes`
  - `refactor: Restructure existing code`
  - `test: Add or modify tests`
  - `chore: Maintenance tasks`

## Code Review Process

All changes must go through a pull request and code review process:

1. Create a pull request from your feature branch to `development`
2. Assign appropriate reviewers
3. Address any feedback
4. Once approved, your PR will be merged

## Agent-Specific Guidelines

### Frontend Developer
- Work in `feature/frontend` branch
- Focus on React components, styling, and UI/UX
- Ensure responsive design and cross-browser compatibility

### Content Strategist
- Work in `feature/content` branch
- Focus on copywriting and content structure
- Ensure brand voice consistency

### DevOps Engineer
- Work in `feature/devops` branch
- Focus on deployment, CI/CD, and infrastructure
- Ensure security and performance best practices

### QA Engineer
- Review all pull requests
- Test functionality, accessibility, and performance
- Create issues for any bugs or improvements needed

## Deployment Process

1. Changes are merged from `development` to `main` for production releases
2. All merges to `main` trigger automated deployment
3. Hotfixes can be applied directly to `main` via `hotfix/*` branches

## Questions or Issues

If you have any questions or run into issues, please create an issue in the repository or contact the project maintainers.