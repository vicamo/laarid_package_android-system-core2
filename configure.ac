# android-system-core versioning
# -------------------------
# To make new release:
#
#   systemcore_micro_version += 1
#   systemcore_interface_revision += 1
#
# if any functions have been added:
#
#   systemcore_micro_version += 1
#   systemcore_interface_revision = 0
#
#   or
#
#   systemcore_minor_version += 1
#   systemcore_micro_version = 0
#   systemcore_interface_revision = 0
#
# if backwards compatibility has been broken:
#
#   systemcore_major_version += 1
#   systemcore_minor_version = 0
#   systemcore_micro_version = 0
#   systemcore_interface_revision = 0
m4_define([systemcore_major_version], [0])
m4_define([systemcore_minor_version], [0])
m4_define([systemcore_micro_version], [1])
m4_define([systemcore_interface_revision], [0])
m4_define([systemcore_api_version], [systemcore_major_version.0])
m4_define([systemcore_release_number], [systemcore_major_version])
m4_define([systemcore_version],
  [systemcore_major_version.systemcore_minor_version.systemcore_micro_version])

AC_INIT([android-system-core], [systemcore_version],
  [https://github.com/laarid/platform_system_core/issues], [],
  [https://github.com/laarid/platform_system_core])

AC_CONFIG_HEADERS([config.h])
AC_CONFIG_SRCDIR([include/log/log.h])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_AUX_DIR([build-aux])

AM_INIT_AUTOMAKE([-Wall -Werror foreign subdir-objects no-define tar-ustar])
AM_MAINTAINER_MODE([enable])
AM_SILENT_RULES([yes])

SYSTEMCORE_MAJOR_VERSION=systemcore_major_version
SYSTEMCORE_MINOR_VERSION=systemcore_minor_version
SYSTEMCORE_MICRO_VERSION=systemcore_micro_version
SYSTEMCORE_API_VERSION=systemcore_api_version
SYSTEMCORE_RELEASE_NUMBER=systemcore_release_number
AC_SUBST([SYSTEMCORE_MAJOR_VERSION])
AC_SUBST([SYSTEMCORE_MINOR_VERSION])
AC_SUBST([SYSTEMCORE_MICRO_VERSION])
AC_SUBST([SYSTEMCORE_API_VERSION])
AC_SUBST([SYSTEMCORE_RELEASE_NUMBER])

# Define _GNU_SOURCE etc. where appropriate, e.g. for strptime() on glibc
AC_USE_SYSTEM_EXTENSIONS

AM_PROG_AR
AC_PROG_CC
AC_PROG_CXX

# libtool versioning
# ------------------
LT_INIT

LT_RELEASE="systemcore_api_version"
AC_SUBST(LT_RELEASE)

m4_define([systemcore_binary_age], [m4_eval(100 * systemcore_minor_version + systemcore_micro_version)])
m4_define([lt_current], [m4_eval(systemcore_binary_age - systemcore_interface_revision)])
m4_define([lt_revision], [systemcore_interface_revision])
# Whenever backward compatibility is broken, we generate libraries of different
# release number. That follows the library files of the same release are always
# compatible, and they have their lt_age equal to lt_current.
m4_define([lt_age], [lt_current])
LT_VERSION_INFO="lt_current:lt_revision:lt_age"
AC_SUBST(LT_VERSION_INFO)

LT_OUTPUT

# Required libraries
# ------------------
PKG_CHECK_MODULES([BIONIC], [android-bionic-0.0])

# Required functions
# ------------------
AC_CHECK_FUNCS([localtime_r strndup])

# Thread implementation
# ---------------------
AX_PTHREAD(
[AC_DEFINE([HAVE_PTHREAD],[1],[Define if you have POSIX threads libraries and header files.])
AC_DEFINE([HAVE_PTHREADS],[1],[Define if you have POSIX threads libraries and header files.])],
[AC_MSG_FAILURE([pthread not available.])])

# Local socket name space
# -----------------------
AC_CACHE_CHECK([for PF_LOCAL],
  [my_cv_pf_local],
  [AC_COMPILE_IFELSE(
    [AC_LANG_PROGRAM([#include <sys/socket.h>],
      [int sock = socket (PF_LOCAL, SOCK_DGRAM, 0);]
    )],
    [my_cv_pf_local=yes],
    [my_cv_pf_local=no]
  )]
)
if test x$my_cv_pf_local = xyes; then
  AC_DEFINE([HAVE_LINUX_LOCAL_SOCKET_NAMESPACE], [1],
    [Define to 1 if we have Linux-style non-filesystem Unix domain sockets.])
fi

AC_CONFIG_FILES([
  Makefile
  android-log-$SYSTEMCORE_API_VERSION.pc
])
AC_OUTPUT
