# Terraform Concepts Cheat Sheet

## Core Components

### Providers
Plugins that interface with APIs (AWS, Azure, Google Cloud, etc.). Define authentication and configuration for infrastructure platforms. Must be declared in your configuration before using their resources.

### Resources
The fundamental building blocks - actual infrastructure components like EC2 instances, S3 buckets, or DNS records. Declared with `resource "type" "name"` blocks and represent real-world infrastructure objects.

### Modules
Reusable collections of Terraform configuration files in a directory. The root module is where you run commands; child modules are called from other modules for code reuse and organization.

### Variables
Input parameters that make configurations flexible and reusable. Declared with `variable` blocks and referenced as `var.name`. Can have types, defaults, and validation rules.

### Data Sources
Read-only queries to fetch information about existing infrastructure or external systems. Use `data "type" "name"` blocks to reference existing resources or compute values from external APIs.

### Outputs
Values returned by modules or displayed after operations complete. Declared with `output` blocks to expose important information like IP addresses or resource IDs to parent modules or users.


## Internal Logic

### Locals
Computed values used within a module, like internal variables. Defined in `locals` blocks and referenced as `local.name`. Useful for complex expressions used multiple times or intermediate calculations.

### Functions
Built-in utilities for data transformation and computation. Examples include `length()`, `format()`, `lookup()`, `merge()`. Cannot create custom functions - must use Terraform's provided set.

### Expressions
The syntax for referencing and computing values throughout your configuration. Includes variable references (`var.x`), resource attributes (`aws_instance.web.id`), conditionals, and string interpolation.

### Infrastructure Management

### State
Terraform's record of managed infrastructure stored in `.tfstate` files. Maps configuration to real-world resources and tracks metadata. Critical for determining what changes need to be made.

### Workspaces
Multiple named states for the same configuration, allowing you to manage different environments (dev/staging/prod). Each workspace maintains its own state file and variable values.

### Backends
Storage locations for state files - local filesystem, S3, Terraform Cloud, etc. Enable team collaboration, state locking, and remote operations. Configure in `terraform` blocks.

## Advanced Features

### Provisioners
Scripts or commands that run on resources after creation (like installing software). Generally discouraged in favor of configuration management tools. Examples include `remote-exec` and `local-exec`.

### Lifecycle Rules
Controls over how Terraform manages resource creation, updates, and destruction. Set with `lifecycle` blocks using rules like `create_before_destroy`, `prevent_destroy`, or `ignore_changes`.

### Meta-arguments
Special arguments available on any resource or module: `count` (create multiple instances), `for_each` (iterate over collections), `depends_on` (explicit dependencies), `lifecycle` (behavior controls).