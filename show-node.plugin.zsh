show-version() {
  if [ ! -f package.json ]; then
      echo $fg[red]"package.json not found!"
  else
    PACKAGE_VERSION=$(cat package.json \
    | grep node \
    | head -1 \
    | awk -F: '{ print $2 }' \
    | sed 's/[",]//g' \
    | tr -d '[[:space:]]')

    case *"node"* in
      $PACKAGE_VERSION)
	printf "\033[36m%s\033[0m \033[90m%s\033[0m\n" $PACKAGE_NAME "$PACKAGE_VERSION"
	return 0;
    esac
    return 0;
  fi
}
