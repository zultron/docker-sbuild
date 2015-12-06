DISTRO="wheezy"

# List of packages to build for this distribution
#
# RT kernel packages
DISTRO_PACKAGES[$DISTRO]="xenomai linux linux-tools linux-latest"
# ZeroMQ packages
DISTRO_PACKAGES[$DISTRO]+=" libsodium zeromq3 czmq pyzmq"
# Misc
DISTRO_PACKAGES[$DISTRO]+=" libwebsockets jansson python-pyftpdlib"
# Zultron Debian package repo
DISTRO_PACKAGES[$DISTRO]+=" dovetail-automata-keyring"
# Machinekit
DISTRO_PACKAGES[$DISTRO]+=" machinekit"

# Apt package repositories to configure for this distribution
DISTRO_REPOS[$DISTRO]="debian wheezy-bpo rcn"

# No cross-build tools in Wheezy
DISTRO_NATIVE_BUILD_ONLY[$DISTRO]="true"
