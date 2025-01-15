# Install dotnet-core 7 and SDK using dotnet-install scripts. - dotnet 8 requires a more recent glibc
# https://github.com/dotnet/core/blob/main/release-notes/7.0/supported-os.md
mkdir -p $BUILD_PREFIX
curl -L -o $BUILD_PREFIX/dotnet-install.sh https://dot.net/v1/dotnet-install.sh && chmod +x $BUILD_PREFIX/dotnet-install.sh
source $BUILD_PREFIX/dotnet-install.sh --install-dir $BUILD_PREFIX/dotnet --version 7.0.109
export PATH="$BUILD_PREFIX/dotnet:$PATH"
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1

# Now install the package.
$PYTHON -m pip install . --no-deps --no-build-isolation -vv
