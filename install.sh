#!/bin/bash
npm install --prefix lsp/angularls
npm install --prefix lsp/vscode
npm install --prefix lsp/typescript

unzip -uo lsp/clangd/linux-x64.zip -d lsp/clangd/linux-x64
unzip -uo lsp/clangd/macos-arm.zip -d lsp/clangd/macos-arm

