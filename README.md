# Homebrew Tap for Easy KPF

This is the Homebrew tap for [Easy KPF](https://github.com/tonisives/easy-kpf), a Kubernetes port forward manager.

## Installation

```bash
brew tap tonisives/tap
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
