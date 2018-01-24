show-node() {
  if [ ! -f package.json ]; then
      echo $fg[red]"package.json not found!"
  else
    PACKAGE_VERSION=$(cat package.json \
    | grep node \
    | head -1 \
    | awk -F: '{ print $2 }' \
    | sed 's/[",]//g' \
    | tr -d '[[:space:]]')

    echo ${PACKAGE_VERSION} | grep --quiet "node"

    if [ $? = 1 ]
    then
      printf "\033[36m%s\033[0m \033[90m%s\033[0m\n" "node" "$PACKAGE_VERSION ($(node --version))"
    fi
  fi
}
