#!/usr/bin/env bash

WORKING_DIR="$(realpath "$(dirname "$0")")"
PRESENTATION_DIR="$(realpath "$WORKING_DIR/../presentations")"
LUA_DIR="$(realpath "$PRESENTATION_DIR/lua")"
PROFILES_DIR="$(realpath "$PRESENTATION_DIR/profiles")"
LUA_FILE_BOOTSTRAP="$LUA_DIR/bootstrap.lua"

profile="dashboard"
program_neovim="nvim"
enable_argument_delimiter=false

usage() {
	cat <<EOF
Usage: $0 [OPTIONS]

Options:
  -n, --neovim NEOVIM               Specify the neovim binary to use (default: $program_neovim)
  -p, --profile PROFILE             Specify the profile to use (default: $profile)
  -x, --enable-argument-delimiter   Enable argument delimiter for passing arguments to Neovim
  -h, --help                        Display this help and exit
EOF
	exit 1
}

while [[ "$#" -gt 0 ]]; do
	key="$1"
	value="$2"
	case "$key" in
	-n | --neovim)
		program_neovim="$value"
		if [ "$program_neovim" = "neovide" ]; then
			enable_argument_delimiter=true
		fi
		shift
		;;
	-p | --profile)
		profile="$value"
		shift
		;;
	-x | --enable-argument-delimiter)
		enable_argument_delimiter=true
		shift
		;;
	--)
		shift
		break
		;;
	-h | --help | *) usage ;;
	esac
	shift
done

lua_profile="$PROFILES_DIR/$profile/run.lua"
if [ ! -f "$lua_profile" ]; then
	echo "Presentation profile file not found: $lua_profile"
	exit 1
fi

run_neovim() {
	local args=(
		-c "luafile $LUA_FILE_BOOTSTRAP"
		-c "luafile $lua_profile"
		"$@"
	)
	if [ "$enable_argument_delimiter" = true ]; then
		$program_neovim -- "${args[@]}"
	else
		$program_neovim "${args[@]}"
	fi
}

run_neovim "$@"
