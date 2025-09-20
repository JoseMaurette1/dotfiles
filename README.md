# Dotfiles

My personal configuration files for various applications.

## Contents

- **nvim/**: Neovim configuration with Lua-based setup
  - Plugin management via [lazy.nvim](https://github.com/folke/lazy.nvim)
  - Custom keybindings and options
  - Treesitter, LSP, completion, and more
- **vscode/**: Visual Studio Code settings

## Installation

### Quick Setup

Clone this repository and run the setup script:

```bash
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles
./setup.sh
```

The setup script will:
- Create symlinks from dotfiles to their proper system locations
- Backup any existing configurations to `.backup` files
- Set up the following symlinks:
  - `~/dotfiles/nvim` → `~/.config/nvim`
  - `~/dotfiles/vscode` → `~/.config/Code/User` (if vscode directory exists)

### Manual Installation

If you prefer to set up configurations manually:

#### Neovim
```bash
# Backup existing config (optional)
mv ~/.config/nvim ~/.config/nvim.backup

# Create symlink
ln -s ~/dotfiles/nvim ~/.config/nvim
```

#### VSCode
```bash
# Backup existing config (optional)
mv ~/.config/Code/User ~/.config/Code/User.backup

# Create symlink
ln -s ~/dotfiles/vscode ~/.config/Code/User
```

## Neovim Setup

The Neovim configuration includes:

### Plugin Manager
- **lazy.nvim**: Modern plugin manager with lazy loading

### Key Plugins
- **Treesitter**: Better syntax highlighting and code understanding
- **Telescope**: Fuzzy finder for files, buffers, and more
- **nvim-cmp**: Autocompletion framework
- **autopairs**: Automatic bracket/quote pairing
- **autotag**: Automatic HTML/XML tag closing
- **File tree**: Directory explorer

### Configuration Structure
- `init.lua`: Main entry point
- `lua/config/`: Core configuration files
  - `options.lua`: Neovim options and settings
  - `keybinds.lua`: Custom key mappings
  - `lazy.lua`: Plugin manager setup
- `lua/plugins/`: Individual plugin configurations
- `lazy-lock.json`: Plugin version lockfile

### First Time Setup

After symlinking the nvim config:

1. Open Neovim: `nvim`
2. lazy.nvim will automatically install all plugins on first launch
3. Restart Neovim once installation is complete

## Updating

### Updating Dotfiles
```bash
cd ~/dotfiles
git pull origin main
```

### Updating Neovim Plugins
```bash
nvim
:Lazy update
```

## Customization

Feel free to modify any configurations to suit your needs:

- Edit `lua/config/options.lua` for Neovim settings
- Edit `lua/config/keybinds.lua` for custom keybindings  
- Add new plugins in `lua/plugins/` directory
- The setup script can be modified to include additional symlinks

## Backup and Restore

The setup script automatically creates backups of existing configurations. To restore from backup:

```bash
# Example for Neovim
rm ~/.config/nvim
mv ~/.config/nvim.backup ~/.config/nvim
```

## Contributing

These are personal dotfiles, but feel free to fork and adapt them for your own use!