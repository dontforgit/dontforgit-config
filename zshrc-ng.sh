# Build process for NewsPress themes and plugins
ngbuild() {
  echo "npm install --legacy-peer-deps"
  npm install --legacy-peer-deps

  echo "npm run start"
  npm run start
}

# Rebuild the project by removing the lock files and node_modules directory
ngxbuild() {
  nukejs
  ngbuild
  sayresult
}
