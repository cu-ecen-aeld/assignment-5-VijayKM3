#!/bin/bash

# This script runs `make distclean` from the buildroot directory.
# It assumes it is being run from the project's root folder.

echo "Navigating to the buildroot directory and running 'make distclean'..."

# Navigate to the buildroot directory
cd buildroot

# Run the distclean command
make distclean

echo "Buildroot project has been cleaned. All build artifacts and configuration files are removed."
