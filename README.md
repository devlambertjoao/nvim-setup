# My setup for neovim

# Clone this repo to folder
C:\Users\XXXXXXX\AppData\Local\nvim

# Install ripgrep for Telescope
choco install ripgrep

# Install lazygit
choco install lazygit

# Allow Scripts (run powershell with administrator)
Set-ExecutionPolicy Unrestricted

# Create environments variables
Variable Name = NEOVIM_OS_RUNNING
Variable Value = WINDOWS || MACOS || LINUX

# If you want to open in windows using nv alias on explorer
# Inside Neovim bin folder (same directory of nvim.exe)
1. Create nvim-alacritty.cmd
  "C:\Program Files\Alacritty\alacritty.exe" --command "C:\Development\tools\nvim\bin\nvim.exe"

2. Create nv.bat
  start /min cmd /c "C:\Development\tools\nvim\bin\nvim-alacritty.cmd"
