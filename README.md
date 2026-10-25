# Homebrew Tap

Homebrew packages for ClawTab, Easy KPF, and other tonisives tools.

## Installation

```bash
brew tap tonisives/tap
```

### ClawTab

Install the daemon, CLI, agent hooks, and shell completion:

```bash
brew install --cask tonisives/tap/clawtab
cwtctl daemon install
```

Install the optional desktop app separately:

```bash
brew install --cask tonisives/tap/clawtab-desktop
```

### GUI App (Cask)

```bash
brew install --cask easy-kpf
```

### CLI/TUI (Formula)

```bash
brew install easykpf
```

Or install directly without tapping first:

```bash
# GUI
brew install --cask tonisives/tap/easy-kpf

# CLI
brew install tonisives/tap/easykpf
```

## Available Formulas

| Formula | Type | Description |
|---------|------|-------------|
| `easy-kpf` | Cask | Kubernetes port forward manager (GUI app) |
| `easykpf` | Formula | Kubernetes port forward manager (CLI/TUI) |
| `clawtab` | Cask | Headless agent daemon and terminal tools |
| `clawtab-desktop` | Cask | Optional desktop workspace for ClawTab |

## Updating

```bash
brew upgrade easy-kpf     # GUI
brew upgrade easykpf      # CLI
```

## Uninstalling

```bash
brew uninstall easy-kpf   # GUI
brew uninstall easykpf    # CLI
brew untap tonisives/tap  # optional
```
