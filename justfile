# justfile for simple-raft project

# Default recipe (runs when just 'just' is called)
default:
    @just --list

# ============================================================================
# Development
# ============================================================================

# Build all crates in debug mode
build:
    cargo build

# Build all crates in release mode
build-release:
    cargo build --release

# Check all crates without building
check:
    cargo check --workspace

# Check with all features enabled
check-all:
    cargo check --workspace --all-features

# Run tests for all crates
test:
    cargo test --workspace

# Run tests with output
test-verbose:
    cargo test --workspace -- --nocapture

# Run tests for a specific crate
test-crate crate:
    cargo test -p {{crate}}

# Run all tests including ignored ones
test-all:
    cargo test --workspace -- --include-ignored

# ============================================================================
# Code Quality
# ============================================================================

# Run clippy on all crates
lint:
    cargo clippy --workspace --all-targets --all-features -- -D warnings

# Fix clippy warnings automatically
lint-fix:
    cargo clippy --workspace --all-targets --all-features --fix --allow-dirty

# Format all code
fmt:
    cargo fmt --all

# Check if code is formatted
fmt-check:
    cargo fmt --all -- --check

# ============================================================================
# Documentation
# ============================================================================

# Generate and open documentation
doc:
    cargo doc --workspace --no-deps --open

# Generate documentation without opening
doc-build:
    cargo doc --workspace --no-deps

# Check documentation
doc-check:
    cargo doc --workspace --no-deps --document-private-items

# ============================================================================
# Cleaning
# ============================================================================

# Clean build artifacts
clean:
    cargo clean

# ============================================================================
# Running Binaries
# ============================================================================

# Run raft-node with default settings
run-local:
    cargo run -p raft-node

# ============================================================================
# Benchmarking
# ============================================================================

# Run benchmarks
bench:
    cargo bench --workspace

# Run benchmarks for a specific crate
bench-crate crate:
    cargo bench -p {{crate}}

# ============================================================================
# Dependencies
# ============================================================================

# Update dependencies
update:
    cargo update

# Check for outdated dependencies (requires cargo-outdated)
outdated:
    cargo outdated --workspace

# Audit dependencies for security vulnerabilities (requires cargo-audit)
audit:
    cargo audit

# ============================================================================
# Development Tools
# ============================================================================

# Install development tools
install-tools:
    cargo install cargo-watch
    cargo install cargo-outdated
    cargo install cargo-audit
    cargo install cargo-expand
    rustup component add clippy
    rustup component add rustfmt

# Watch and rebuild on file changes
watch:
    cargo watch -x check -x test

# Watch and run tests on changes
watch-test:
    cargo watch -x test
