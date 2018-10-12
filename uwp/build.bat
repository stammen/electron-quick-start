@echo off

pushd ..\
    call npm install -g electron-windows-store
    call npm install -g node-gyp
    call npm install
    call npm install --save-dev electron-rebuild
popd

echo build c++/winrt modules...
pushd winrt_modules
    call npm install --save-dev electron-rebuild
    call node-gyp build
    call .\node_modules\.bin\electron-rebuild.cmd
popd

npm start

