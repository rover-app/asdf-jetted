#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/DocumaticAI/jetted"
TOOL_NAME="jetted"
TOOL_TEST="jetted --version"

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

curl_opts=(-fsSL)

# NOTE: You might want to remove this if jetted is not hosted on GitHub releases.
if [ -n "${GITHUB_API_TOKEN:-}" ]; then
	curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
	git ls-remote --tags --refs "$GH_REPO" |
		grep -o 'refs/tags/.*' | cut -d/ -f3- | grep -E "^v?[0-9.]+$" |
		sed 's/^v//'
}

list_all_versions() {
	list_github_tags
}

download_release() {
	local version filename url
	version="$1"
	filename="$2"

	url="$(get_download_url "$version")"

	echo "* Downloading $TOOL_NAME release $version..."
	curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="${3%/bin}/bin"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	(
		mkdir -p "$install_path"
		cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"

		# TODO: Assert jetted executable exists.
		local tool_cmd
		tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
		test -x "$install_path/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}

# Yoinked from https://gitlab.com/wt0f/asdf-ripgrep/-/blob/master/bin/install
# under the MIT License. Thank you!
# Copyright (c) 2024 Gerard Hickey
get_arch() {
	uname -m | tr '[:upper:]' '[:lower:]'
}

get_platform() {
	uname | tr '[:upper:]' '[:lower:]'
}

get_release_nugget() {
	local nugget

	case $(get_arch)-$(get_platform) in
	arm64-darwin)
		nugget='x86_64-apple-darwin'
		;;
	x86_64-darwin)
		nugget='x86_64-apple-darwin'
		;;
	# arm*-linux)
	#   nugget='arm-unknown-linux-gnu' ;;
	x86_64-linux)
		nugget='x86_64-unknown-linux-musl'
		;;
	aarch64-linux)
		nugget='aarch64-unknown-linux-musl'
		;;
	# i[3456]86-linux)
	#   nugget='i686-unknown-linux-musl' ;;
	x86_64-windows)
		nugget='x86_64-pc-windows-gnu'
		;;
	# i[3456]-windows)
	#   nugget='i686-pc-windows-msvc' ;;
	*)
		nugget="$(get_arch)-$(get_platform)"
		;;
	esac

	echo "${nugget}"
}

get_archive_name() {
	local version="$1"
	echo "jetted-${version}-$(get_release_nugget).tar.gz"
}

get_download_url() {
	local version="$1"
	local archive_name
	archive_name="$(get_archive_name "$version")"
	echo "$GH_REPO/releases/download/v${version}/${archive_name}"
}
