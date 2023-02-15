#!/bin/bash
npm install --prefix lsp/angularls
npm install --prefix lsp/vscode
npm install --prefix lsp/typescript

cd lsp/clangd/
tar -xf linux-x64.zip
tar -xf macos-arm.zip
tar -xf windows.zip


