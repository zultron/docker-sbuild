PKG="machinekit"

# Package sources
PACKAGE_SOURCE_URL[$PKG]="https://github.com/machinekit/machinekit.git"

# Source package configuration
PACKAGE_CONFIGURE_FUNC[$PKG]="configure_machinekit"

configure_machinekit() {

    case $DISTRO in
	wheezy) TCL_VER=8.5 ;;
	jessie|trusty) TCL_VER=8.6 ;;
    esac

    run debian/configure -prxt $TCL_VER
}