# dontforgit-config
Making customizations portable.

## Setup

Clone the directory in your home directory.

Add `source ~/dontforgit-config/zshrc.sh` to the bottom of your `~/.zshrc` file by running the command:

```
echo 'source ~/dontforgit-config/zshrc.sh' >> ~/.zshrc
```

---

## Customizations

### Aliases
- `gl` - Git log with pretty formatting.
- `nukejs` - Remove lock files and `node_modules`.
- `nukephp` - Remove lock files and `vendor`.

### Functions

#### Global 

**NPM Configuration**
- `autoup` - Updates all dependencies to the latest version.
- `autoup_minor` - Updates all dependencies to the latest minor version or patch version.

**Git Helpers**
- `new` - Git checkout a new branch and push it to the remote.
- `co` - Git checkout.
- `con` - Git checkout a new branch.
- `com` - Git checkout and merge.

**Helper Functions**
- `auto_node_version` - Automatically switch node versions based on the project's `.node-version` file, `.nvmrc` file, or `engines.node` field in `package.json`.`
- `autoup_setup` - Set up the autoupdate scripts for the first time.
- `sayresult` - Print the result of the last command in green if successful, red if not.

#### Dow Jones Specific Workflows
- `djbuild` - Build a DJ Plugin or Theme
- `djxbuild` - Rebuild a DJ Plugin or Theme
- `djcob` - Check out a branch and build it
- `djcoxb` - Check out a branch and run a full rebuild

### Configurations
- Autoload the `auto_node_version` function when a new terminal is opened.
- Setup bash autocompletion
- Start starship.
