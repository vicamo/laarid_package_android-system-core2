ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}

# Distribution
# ------------
EXTRA_DIST =
DISTCLEANFILES =

# Common/global flags
# -------------------
AM_CPPFLAGS = \
	-include config.h \
	-I$(top_srcdir)/include \
	$(BIONIC_CFLAGS)

AM_CFLAGS = \
	-Wall -Werror \
	-std=gnu89 \
	$(PTHREAD_CFLAGS) \
	$(BIONIC_CFLAGS)

AM_CXXFLAGS = \
	-Wall -Werror \
	-std=gnu++98 \
	$(PTHREAD_CFLAGS) \
	$(BIONIC_CFLAGS)

AM_LDFLAGS = \
	-Wl,--as-needed

LIBS = \
	$(PTHREAD_LIBS) \
	$(BIONIC_LIBS)

libtool_opts = \
	-version-info $(LT_VERSION_INFO) \
	-export-dynamic \
	-rpath $(libdir)

bin_SCRIPTS =
bin_PROGRAMS =
noinst_PROGRAMS =
lib_LTLIBRARIES =
pkgconfig_DATA =

include $(srcdir)/include/Makefile.am

# Installable libraries
# ---------------------
# Note: the order how the participatiing libraries are listed here is
# IMPORTANT!!! It has to follow the dependencies between each of them, or you
# will get errors like:
#
#  libtool: install: warning: relinking `libandroid-cutils-0.la'
#  libtool: install: <omited long long line>
#  /usr/bin/ld: cannot find -landroid-log-0
#  collect2: error: ld returned 1 exit status
#  libtool: install: error: relink `libandroid-cutils-0.la' with the above command before installing it

# Stage 0: depends on only external packages
include $(srcdir)/liblog/Android.mk
include $(srcdir)/libmincrypt/Android.mk
include $(srcdir)/libsparse/Android.mk
include $(srcdir)/libzipfile/Android.mk

# Stage 0-1: depends on any of above packages
include $(srcdir)/libcutils/Android.mk

# Stage 0-2: depends on any of above packages
include $(srcdir)/libdiskconfig/Android.mk
include $(srcdir)/libnetutils/Android.mk
include $(srcdir)/libsuspend/Android.mk
include $(srcdir)/libsysutils/Android.mk
include $(srcdir)/libusbhost/Android.mk

# PKG-CONFIG data files
# ---------------------
pkgconfigdir = $(libdir)/pkgconfig
$(pkgconfig_DATA): config.status

DISTCLEANFILES += \
	$(pkgconfig_DATA)
