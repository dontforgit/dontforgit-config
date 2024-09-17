########################### NPM CONFIGURATION ###########################

# Automatically update all dependencies in the package.json file
# based on the version set in "engines.node".
autoup() {
  autoupup_setup
  ncu --upgrade --enginesNode
}

# Automatically update only patch versions of dependencies in the package.json file
autoup_minor() {
  autoupup_setup
  ncu --upgrade --target minor
}

########################### HELPER FUNCTIONS ###########################

# Automatically set the Node version based on:
# 1. The .node-version file in the current directory
# 2. The .nvmrc file in the current directory
# 3. The engines.node field in the package.json file in the current directory
auto_node_version() {
  local node_version
  if [ -f .node-version ]; then
    node_version=$(cat .node-version)
  elif [ -f .nvmrc ]; then
    node_version=$(cat .nvmrc)
  elif [ -f package.json ]; then
    node_version=$(jq -r '.engines.node' package.json)
  fi
  if [ -n "$node_version" ]; then
    nvm use "$node_version"
  fi
}

# Install the npm-check-updates package if it is not already installed
autoupup_setup() {
    if ! command -v ncu &> /dev/null
    then
        echo "npm-check-updates could not be found. Installing..."
        npm install -g npm-check-updates
    else
        echo "npm-check-updates is already installed."
    fi
}

########################### ZSH HOOKS ###########################
autoload -U add-zsh-hook
load-node-version-from-package-json() {
  auto_node_version
}
add-zsh-hook chpwd load-node-version-from-package-json
load-node-version-from-package-json
