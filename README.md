# My setup for neovim

# Create folder
C:\Users\XXXXXXX\AppData\Local\nvim

# Install Packer
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"

# Install ripgrep for Telescope
choco install ripgrep

# Install lazygit
choco install lazygit

# Allow Scripts (run powershell with administrator)
Set-ExecutionPolicy Unrestricted

# Create environments variables
Variable Name = NEOVIM_HOME
Variable Value = C:\Users\jodt\AppData\Local\nvim

Variable Name = NEOVIM_OS_RUNNING
Variable Value = WINDOWS || MACOS || LINUX

