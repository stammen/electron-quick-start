@echo off

echo Installing npm dependencies...

pushd ..\
    call npm install -g electron-windows-store
    call npm install -g node-gyp
    call npm install
    call npm install --save-dev electron-rebuild
popd

echo Building c++/winrt modules...
pushd .\winrt_modules
    call npm install --save-dev electron-rebuild
    call node-gyp configure
    call node-gyp build
    echo Rebuilding c++/winrt modules for Electron...
    call .\node_modules\.bin\electron-rebuild.cmd
popd

pushd ..\
    echo Rebuilding node modules for Electron...
    call .\node_modules\.bin\electron-rebuild.cmd
    echo starting Electron app...
    npm start
popd
