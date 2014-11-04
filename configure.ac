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
m4_define([systemcore_micro_version], [3])
m4_define([systemcore_interface_revision], [2])
m4_define([systemcore_api_version], [systemcore_major_version.0])
m4_define([systemcore_release_number], [systemcore_major_version])
m4_define([systemcore_version],
  [systemcore_major_version.systemcore_minor_version.systemcore_micro_version])

# Require autoconf 2.69 for aarch64
AC_PREREQ(2.69)

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

# Host environment
# ----------------
AC_CANONICAL_HOST

os_linux=no
case "$host" in
  *-*-linux*)
    os_linux=yes
    ;;
esac

AM_CONDITIONAL(OS_LINUX, test "$os_linux" = "yes")

cpu_arm=no
cpu_aarch64=no
cpu_x86=no
cpu_x86_64=no
case "$host_cpu" in
  arm*)
    cpu_arm=yes
    ;;
  aarch64*)
    cpu_aarch64=yes
    ;;
  i?86 | x86)
    cpu_x86=yes
    ;;
  x86_64 | amd64)
    cpu_x86_64=yes
    ;;
esac

AM_CONDITIONAL(CPU_ARM, test "$cpu_arm" = "yes")
AM_CONDITIONAL(CPU_AARCH64, test "$cpu_aarch64" = "yes")
AM_CONDITIONAL(CPU_X86, test "$cpu_x86" = "yes")
AM_CONDITIONAL(CPU_X86_64, test "$cpu_x86_64" = "yes")

AM_PROG_AR
AM_PROG_AS
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
BIONIC_REQUIRED_VERSION=0.0.2
AC_SUBST([BIONIC_REQUIRED_VERSION])

PKG_CHECK_MODULES([BIONIC], [android-bionic-0.0 >= $BIONIC_REQUIRED_VERSION])
CFLAGS="$CFLAGS $BIONIC_CFLAGS"
LIBS="$LIBS $BIONIC_LIBS"
AC_SUBST([BIONIC_CFLAGS])
AC_SUBST([BIONIC_LIBS])

# Required headers
# ----------------
AC_CHECK_HEADERS([linux/ioprio.h sched.h sys/socket.h])

# Required functions
# ------------------
AC_CHECK_FUNCS([localtime_r prctl strndup])

# Required types
# --------------
AC_CHECK_TYPES([struct nd_opt_rdnss], [], [], [#include <netinet/icmp6.h>])

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

# Android Anonymous Shared Memory(ashmem) support
# -----------------------------------------------
AC_ARG_ENABLE([ashmem],
  [AS_HELP_STRING([--enable-ashmem],
    [Enable Android Anonymous Shared Memory(ashmem) support])],
  [],
  [enable_ashmem=check])
if test x$enable_ashmem = xcheck; then
  AC_CHECK_HEADER([linux/ashmem.h], [enable_ashmem=yes], [enable_ashmem=no])
fi
AM_CONDITIONAL([HAVE_ASHMEM], [test x$enable_ashmem = xyes])

# Android system properties
# -------------------------
AC_CHECK_FUNCS([__system_property_get __system_property_set __system_property_read __system_property_foreach], [], [break])
if test x$ac_cv_func___system_property_foreach = xyes; then
  AC_DEFINE([HAVE_LIBC_SYSTEM_PROPERTIES], [1],
    [Define to 1 if bionic includes Android system properties implementation.])
else
  if test x$ax_pthread_ok = xyes; then
    AC_CACHE_CHECK([for PF_LOCAL],
      [my_cv_pf_unix],
      [AC_COMPILE_IFELSE(
        [AC_LANG_PROGRAM([#include <sys/socket.h>],
          [int sock = socket (PF_LOCAL, SOCK_DGRAM, 0);]
        )],
        [my_cv_pf_unix=yes]
      )]
    )
  fi
  if test x$my_cv_pf_unix = xyes; then
    AC_DEFINE([HAVE_SYSTEM_PROPERTY_SERVER], [1],
      [Define to 1 if system provides a system property server.])
  fi
fi

AC_CONFIG_FILES([
  Makefile
  android-log-$SYSTEMCORE_API_VERSION.pc
  android-cutils-$SYSTEMCORE_API_VERSION.pc
  android-sysutils-$SYSTEMCORE_API_VERSION.pc
])
AC_OUTPUT
