# Mellifluous VSCode Theme

A dark VSCode theme based on the [Mellifluous](https://github.com/ramojus/mellifluous.nvim) Neovim colorscheme.

## Installation


### Option 1: Manual Installation (Recommended)
1. Copy the theme file to VSCode's themes directory:
   ```bash
   mkdir -p ~/.vscode/themes/
   cp /home/jose/dotfiles/vscode/themes/mellifluous-color-theme.json ~/.vscode/themes/
   ```

2. Open VSCode and press `Ctrl+K Ctrl+T` (or `Cmd+K Cmd+T` on Mac) to open the theme picker.

3. Select "Mellifluous Dark" from the list.

### Option 2: Settings Configuration
Add this to your VSCode `settings.json`:
```json
{
  "workbench.colorTheme": "Mellifluous Dark"
}
```

## Color Palette

The theme uses the same perceptually uniform OKHSL color space as the original Neovim theme:

- **Background**: `#1a1a1a` (neutral gray)
- **Foreground**: `#dadada` (light gray)
- **Keywords**: `#d59192` (warm red for control flow)
- **Types**: `#bfad9d` (warm khaki)
- **Strings**: `#bfaf8e` (warm yellow)
- **Functions**: `#a8a1be` (cool blue)
- **Constants**: `#b99bb5` (cool purple)
- **Comments**: `#737246` (muted green, italic)

## Features

- **60+ UI color mappings** for complete VSCode interface theming
- **50+ syntax token scopes** for comprehensive language support
- **16 terminal colors** derived from the mellifluous palette
- **Perceptually uniform colors** using OKHSL color space
- **Consistent with Neovim theme** for unified development experience

## Contributing

This theme is automatically generated from the mellifluous.nvim color definitions. To update:

1. Update the Neovim theme
2. Run the conversion script (if available)
3. Or manually update the JSON file

## License

Same as mellifluous.nvim - MIT License
