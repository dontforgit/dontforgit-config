# Build process for NewsPress themes and plugins
djbuild() {
  echo "composer install"
  composer install

  # Check if package.json is present
  if [[ ! -f package.json ]]; then
    echo "Error: package.json not found in the current directory."
    exit 1
  fi

  # Check for .node-version file and read version, otherwise use package.json
  auto_node_version

  # Build if node_modules does not already exist
  if [[ ! -d node_modules ]]; then
      # Install dependencies with Yarn or npm based on package.json settings
      if jq -e '.engines.yarn' package.json >/dev/null; then
        echo "'engines.yarn' found. Running 'yarn'..."
        yarn install
      else
        echo "'engines.yarn' not found in package.json. Skipping 'yarn' execution."
        npm install
      fi
  fi

  # Run development build, production build or a custom build command based on scripts defined in package.json
  yarn dj build
}

# Rebuild the project by removing the lock files and node_modules directory
djxbuild() {
  echo "rm -rf yarn.lock package-lock.json node_modules"
  rm -rf yarn.lock package-lock.json node_modules
  build
}

# Check out a branch and then build it
djcob() {
  local co_param=$1
  co "$co_param"
  djbuild && sayresult
}

# Check out a branch and then rebuild it
djcoxb() {
  local co_param=$1
  co "$co_param"
  xbuild && sayresult
}
