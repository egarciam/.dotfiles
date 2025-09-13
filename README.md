# Dotfiles Configuration

This repository contains personal dotfiles and machine-specific configurations for development environments.

## Main Files

### `.bashrc`
Main bash configuration file that includes:
- Environment variables (GOROOT, GOPATH, PATH extensions)
- Kubernetes and development tool configurations
- Autocomplete setup for various CLI tools (kubectl, flux, terraform, etc.)
- SSH agent management
- Integration with machine-specific configurations

### `.machine_config`
Machine-specific configuration handler that provides:

#### Core Functionality
- **Hostname Detection**: Automatically detects current machine using `uname -n`
- **Conditional Configuration**: Applies different settings based on machine name
- **VS Code Integration**: Provides unified `code()` function with machine-specific paths
- **Proxy Management**: Handles corporate proxy settings for different environments

#### Supported Machines
- **LAPTOP-RKGTBC0K**: Personal laptop configuration
  - VS Code path: `/mnt/c/Users/Ernesto/AppData/Local/Programs/Microsoft VS Code/Code.exe`
  - No proxy configuration
- **Corporate Machines** (default): Work environment configuration
  - VS Code path: `/mnt/c/Program Files/Microsoft VS Code/Code.exe`
  - Corporate proxy settings with comprehensive no_proxy list

#### Functions
- **`code()`**: Cross-platform VS Code launcher
  - Validates executable existence before launching
  - Runs in background with output suppression
  - Provides error feedback if VS Code not found

## Usage

The configuration is automatically loaded when starting a new bash session. Machine-specific settings are applied based on the hostname.

### Adding New Machines
To add support for a new machine, edit `.machine_config` and add a new case in the switch statement:

```bash
"NEW-MACHINE-NAME")
    VSCODE_PATH="/path/to/vscode"
    # Additional machine-specific settings
    ;;
```

### Key Features
- **Modular Design**: Separates machine-specific configs from general bash settings
- **Error Handling**: Validates paths and provides meaningful error messages
- **Extensible**: Easy to add new machines or modify existing configurations
- **Clean Integration**: Seamlessly integrates with existing dotfiles structure
