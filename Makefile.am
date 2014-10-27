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

lib_LTLIBRARIES = \
	libandroid-log-0.la

androidincdir = $(includedir)/android/system-core-$(SYSTEMCORE_API_VERSION)

# libandroid-log.la
# -----------------
libandroid_log_0_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
libandroid_log_0_la_SOURCES = \
	liblog/event_tag_map.c \
	liblog/logprint.c \
	liblog/log_time.cpp \
	liblog/log_read.c \
	liblog/logd_write.c

# Only compiled when TARGET_USES_LOGD is set to false in liblog/Andoird.mk, but
# we're trying to avoid Android specific kernel interface if possible.
#	liblog/log_read_kern.c
#	liblog/logd_write_kern.c
#
# Dummy log backend designed for HOST build.
#	liblog/fake_log_device.c

# HEADERS: android/log
# --------------------
libandroid_log_incdir = $(androidincdir)/log
libandroid_log_inc_HEADERS = \
	include/log/event_tag_map.h \
	include/log/log.h \
	include/log/log_read.h \
	include/log/logd.h \
	include/log/logger.h \
	include/log/logprint.h

# PKG-CONFIG data files
# ---------------------
pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = \
	android-log-$(SYSTEMCORE_API_VERSION).pc

$(pkgconfig_DATA): config.status

DISTCLEANFILES += \
	$(pkgconfig_DATA)
