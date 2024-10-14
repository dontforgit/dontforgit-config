## 1.1.1
- Fix relative path of `zshrc-dj.sh` and `zshrc-ng.sh` scripts.

## 1.1.0
- Adding NewsGrid scripts. 

## 1.0.0
- Add README.md file with setup instructions.

## 0.5.0
- Add scripts specific to the Dow Jones build process
  - `djbuild` - Build a DJ Plugin or Theme
  - `djxbuild` - Rebuild a DJ Plugin or Theme
  - `djcob` - Check out a branch and build it
  - `djcoxb` - Check out a branch and run a full rebuild
- Add the Nuke scripts
  - `nukejs` - Remove lock files and `node_modules`.
  - `nukephp` - Remove lock files and `vendor`.

## 0.4.0
- Add the `sayresult` helper function.

## 0.3.0
- Add helper scripts to streamline git commands.
  - `gl` - Git log with pretty formatting.
  - `co` - Git checkout.
  - `con` - Git checkout a new branch.
  - `com` - Git checkout and merge.
  - `new` - Git checkout a new branch and push it to the remote.

## 0.2.0
- Add the scripts for automatically updating NPM dependencies
  - `autoup_minor` - Updates all dependencies to the latest minor version or patch version.
  - `autoup` - Updates all dependencies to the latest version.

## 0.1.0
- Add the ability to automatically switch node versions based on the project's...
  - `.node-version` file
  - `.nvmrc` file
  - `engines.node` field in `package.json`
