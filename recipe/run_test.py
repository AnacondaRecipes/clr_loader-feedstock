try:
    from importlib.resources import files as resources_files
except ImportError:
    from importlib_resources import files as resources_files
import sys

import clr_loader


# Check if DLLs exist
base_path = resources_files('clr_loader') / 'ffi' / 'dlls'
for arch in ['amd64', 'x86']:
    for ext in ['dll', 'pdb']:
        if not (base_path / arch / f'ClrLoader.{ext}').exists():
            raise FileNotFoundError(f'DLL ffi/dlls/{arch}/ClrLoader.{ext} not found in package.')
print("DLLs found; test passed.")
