########################################
# Debian orig tarball operations
debug "    Sourcing debian-orig-tarball.sh"

source_tarball_init() {
    case "$DEBIAN_PACKAGE_COMP" in
	# Default to bz2
	bz2|*)
	    DPKG_BUILD_ARGS=-Zbzip2
	    DEBIAN_PACKAGE_COMP=bz2
	    ;;
    esac

    case "$DEBIAN_PACKAGE_FORMAT" in
	'3.0 (quilt)')
	    DEBIAN_TARBALL=${PACKAGE}_${VERSION}.orig.tar.${DEBIAN_PACKAGE_COMP}
	    ;;
	'3.0 (native)')
	    DEBIAN_TARBALL=${PACKAGE}_${VERSION}.tar.${DEBIAN_PACKAGE_COMP}
	    ;;
	*)
	    msg "Package ${PACKAGE}:" \
		"Unknown package format '${DEBIAN_PACKAGE_FORMAT}'"
	    exit 1
	    ;;
    esac
}

source_tarball_download() {
    if test -n "$TARBALL_URL"; then
	if test ! -f $SOURCE_PKG_DIR/$DEBIAN_TARBALL; then
	    msg "    Downloading source tarball"
	    mkdir -p $SOURCE_PKG_DIR
	    wget $TARBALL_URL -O $SOURCE_PKG_DIR/$DEBIAN_TARBALL
	else
	    debug "    (Source tarball exists; not downloading)"
	fi
    else
	debug "    (No TARBALL_URL defined; not downloading source tarball)"
    fi
}

source_tarball_unpack() {
    msg "    Unpacking source tarball"
    debug "      Tarball path: $SOURCE_PKG_DIR/$DEBIAN_TARBALL"
    debug "      Build dir: $BUILD_DIR"
    debug "      Linking original tarball to build dir"
    mkdir -p $BUILD_DIR
    ln -f $SOURCE_PKG_DIR/$DEBIAN_TARBALL $BUILD_DIR
    debug "      Unpacking tarball into $BUILD_SRC_DIR"
    rm -rf $BUILD_SRC_DIR; mkdir -p $BUILD_SRC_DIR
    tar xCf $BUILD_SRC_DIR $SOURCE_PKG_DIR/$DEBIAN_TARBALL --strip-components=1
}

