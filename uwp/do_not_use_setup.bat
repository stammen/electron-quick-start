@echo off

if exist output (
    echo removing previous output folder
    rmdir output /s /q
)

if exist NodeRT (
    echo removing previous NodeRT folder
    rmdir NodeRT /s /q
)
    
pushd ..\
    call npm install -g electron-windows-store
    call npm install -g node-gyp
    call npm install
    call npm install --save-dev electron-rebuild
popd

echo installing NodeRT...
call git clone https://github.com/stammen/NodeRT.git
pushd NodeRT
    git checkout vs2017
    pushd  src
    for /f "usebackq tokens=*" %%i in (`"%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe" -latest -products * -requires Microsoft.Component.MSBuild -property installationPath`) do (
        set InstallDir=%%i
    )
    if exist "%InstallDir%\MSBuild\15.0\Bin\MSBuild.exe" (
        ..\..\nuget.exe restore NodeRT.sln
        "%InstallDir%\MSBuild\15.0\Bin\MSBuild.exe" NodeRT.sln /property:Configuration=Release 
    )
    popd
popd

call NodeRT\src\NodeRTCmd\bin\Release\NodeRTCmd.exe --winmd "C:\Program Files (x86)\Windows Kits\10\UnionMetadata\10.0.17134.0\Windows.winmd" --outdir .\output --namespace windows.services.store
call NodeRT\src\NodeRTCmd\bin\Release\NodeRTCmd.exe --winmd "C:\Program Files (x86)\Windows Kits\10\UnionMetadata\10.0.17134.0\Windows.winmd" --outdir .\output --namespace windows.devices.geolocation
call NodeRT\src\NodeRTCmd\bin\Release\NodeRTCmd.exe --winmd "C:\Program Files (x86)\Windows Kits\10\UnionMetadata\10.0.17134.0\Windows.winmd" --outdir .\output --namespace windows.data.json
	
pushd ..\
    call npm install .\uwp\output\windows.services.store
    call npm install .\uwp\output\windows.devices.geolocation
    call npm install .\uwp\output\windows.data.json
    call .\node_modules\.bin\electron-rebuild.cmd
    npm start
popd
