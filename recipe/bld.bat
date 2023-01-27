REM Install the latest dotnet-core and SDK using dotnet-install scripts.
mkdir %BUILD_PREFIX% 2> NUL
curl -L -o %BUILD_PREFIX%\dotnet-install.ps1 https://dot.net/v1/dotnet-install.ps1
powershell %BUILD_PREFIX%\dotnet-install.ps1 -InstallDir %BUILD_PREFIX%\dotnet -Version latest
set PATH=%BUILD_PREFIX%\dotnet;%PATH%

REM Now install the package
%PYTHON% -m pip install . --no-deps -vv
