########################### NPM CONFIGURATION ###########################

# Automatically update all dependencies in the package.json file
# based on the version set in "engines.node".
autoup() {
  autoup_setup
  ncu --upgrade --enginesNode
}

# Automatically update only patch versions of dependencies in the package.json file
autoup_minor() {
  autoup_setup
  ncu --upgrade --target minor
}

########################### GIT HELPERS ###########################

# Aliases
alias gl="git log --oneline --graph"

# Create a new branch and set the origin
#
# Params:
#   $1 - The name of the new branch
# Example: new feat/new-feature
new() {
  git fetch --all
  git pull
  git checkout -b "$1"
  git push
  git branch -u origin/$1
}

# Check out a branch and pull the latest changes
#
# Params:
#   $1 - The name of the branch to check out
# Example: co main
co() {
  git reset --hard HEAD
  git fetch --all
  git checkout "$1"
  git pull
}

# Check out a branch and then create a new branch off of it
#
# Params:
#   $1 - The name of the branch to check out
#   $2 - The name of the new branch
# Example: con main feat/new-feature
con() {
  co "$1"
  new "$2"
}

# Merge a branch into the current branch
#
# Params:
#   $1 - The name of the branch to merge into the current branch
#   $2 - The name of the current branch
# Example: com main feat/new-feature
#   This will merge the "main" branch into the "feat/new-feature" branch
com() {
  co "$1"
  co "$2"
  git merge "$1"
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
autoup_setup() {
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
