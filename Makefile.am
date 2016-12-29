ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}

# Distribution
# ------------
EXTRA_DIST =
BUILT_SOURCES =
CLEANFILES =
DISTCLEANFILES =
MAINTAINERCLEANFILES = \
	$(GITIGNORE_MAINTAINERCLEANFILES_TOPLEVEL) \
	$(GITIGNORE_MAINTAINERCLEANFILES_M4_LIBTOOL) \
	$(GITIGNORE_MAINTAINERCLEANFILES_MAKEFILE_IN) \
	$(srcdir)/ChangeLog \
	$(srcdir)/INSTALL

DISTCHECK_CONFIGURE_FLAGS = \
	--disable-maintainer-mode

GITIGNOREFILES = \
	build \
	debian \
	$(DIST_ARCHIVES)

# Common/global flags
# -------------------
AM_CPPFLAGS = \
	-include config.h \
	-I$(top_srcdir)/include

AM_CFLAGS = \
	-Wall -Werror \
	-std=gnu89

AM_CXXFLAGS = \
	-Wall -Werror \
	-std=gnu++98

AM_LDFLAGS = \
	-Wl,--as-needed

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

# Stage 1: depends on external packages that depend on stage 0 packages
include $(srcdir)/libbacktrace/Android.mk
include $(srcdir)/libnativebridge/Android.mk

# Stage 1-1: depends on any of above packages
include $(srcdir)/libutils/Android.mk

# Stage 1-2: depends on any of above packages
include $(srcdir)/libprocessgroup/Android.mk
include $(srcdir)/libziparchive/Android.mk


# PKG-CONFIG data files
# ---------------------
pkgconfigdir = $(libdir)/pkgconfig
$(pkgconfig_DATA): config.status

EXTRA_DIST += $(pkgconfig_DATA:.pc=.pc.in)
DISTCLEANFILES += $(pkgconfig_DATA)

# Somehow $(bin_SCRIPTS) are not included in DIST_SOURCES by default.
EXTRA_DIST += $(bin_SCRIPTS)
CLEANFILES += $(BUILT_SOURCES)
GITIGNOREFILES += $(BUILT_SOURCES)

-include $(top_srcdir)/git.mk
