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

AM_CXXFLAGS = \
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
lib_LTLIBRARIES = \
	libandroid-log-0.la \
	libandroid-cutils-0.la \
	libandroid-backtrace-0.la \
	libandroid-sysutils-0.la

noinst_PROGRAMS = \
	libcutils/tst_str_parms

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

# libandroid-cutils.la
# --------------------
libandroid_cutils_0_la_CPPFLAGS = \
	$(AM_CPPFLAGS)
libandroid_cutils_0_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
libandroid_cutils_0_la_LIBADD = \
	libandroid-log-0.la
libandroid_cutils_0_la_DEPENDENCIES = \
	libandroid-log-0.la
libandroid_cutils_0_la_SOURCES = \
	libcutils/atomic.c \
	libcutils/config_utils.c \
	libcutils/cpu_info.c \
	libcutils/debugger.c \
	libcutils/fs.c \
	libcutils/hashmap.c \
	libcutils/iosched_policy.c \
	libcutils/klog.c \
	libcutils/load_file.c \
	libcutils/memory.c \
	libcutils/multiuser.c \
	libcutils/native_handle.c \
	libcutils/partition_utils.c \
	libcutils/process_name.c \
	libcutils/properties.c \
	libcutils/qtaguid.c \
	libcutils/record_stream.c \
	libcutils/sched_policy.c \
	libcutils/socket_inaddr_any_server.c \
	libcutils/socket_local_client.c \
	libcutils/socket_local_server.c \
	libcutils/socket_loopback_client.c \
	libcutils/socket_loopback_server.c \
	libcutils/socket_network_client.c \
	libcutils/sockets.c \
	libcutils/str_parms.c \
	libcutils/strdup16to8.c \
	libcutils/strdup8to16.c \
	libcutils/threads.c \
	libcutils/uevent.c

# Need kernel uapi/linux/reboot.h
#	libcutils/android_reboot.c

if HAVE_ASHMEM
libandroid_cutils_0_la_SOURCES += \
       libcutils/ashmem-dev.c
else
libandroid_cutils_0_la_SOURCES += \
       libcutils/ashmem-host.c
endif

if OS_LINUX
libandroid_cutils_0_la_SOURCES += \
	libcutils/trace.c
endif

if CPU_ARM
libandroid_cutils_0_la_SOURCES += \
	libcutils/arch-arm/memset32.S
libandroid_cutils_0_la_CPPFLAGS += \
	-DHAVE_MEMSET16 \
	-DHAVE_MEMSET32
endif
if CPU_AARCH64
libandroid_cutils_0_la_SOURCES += \
	libcutils/arch-arm64/android_memset.S
libandroid_cutils_0_la_CPPFLAGS += \
	-DHAVE_MEMSET16 \
	-DHAVE_MEMSET32
endif
if CPU_X86
libandroid_cutils_0_la_SOURCES += \
	libcutils/arch-x86/android_memset16.S \
	libcutils/arch-x86/android_memset32.S
libandroid_cutils_0_la_CPPFLAGS += \
	-DHAVE_MEMSET16 \
	-DHAVE_MEMSET32
endif
if CPU_X86_64
libandroid_cutils_0_la_SOURCES += \
	libcutils/arch-x86_64/android_memset16_SSE2-atom.S \
	libcutils/arch-x86_64/android_memset32_SSE2-atom.S
libandroid_cutils_0_la_CPPFLAGS += \
	-DHAVE_MEMSET16 \
	-DHAVE_MEMSET32
endif

# HEADERS: android/cutils
# -----------------------
libandroid_cutils_incdir = $(androidincdir)/cutils
libandroid_cutils_inc_HEADERS = \
	include/cutils/android_reboot.h \
	include/cutils/aref.h \
	include/cutils/ashmem.h \
	include/cutils/atomic-arm.h \
	include/cutils/atomic-arm64.h \
	include/cutils/atomic-inline.h \
	include/cutils/atomic-mips.h \
	include/cutils/atomic-mips64.h \
	include/cutils/atomic-x86.h \
	include/cutils/atomic-x86_64.h \
	include/cutils/atomic.h \
	include/cutils/bitops.h \
	include/cutils/compiler.h \
	include/cutils/config_utils.h \
	include/cutils/cpu_info.h \
	include/cutils/debugger.h \
	include/cutils/dir_hash.h \
	include/cutils/fs.h \
	include/cutils/hashmap.h \
	include/cutils/iosched_policy.h \
	include/cutils/jstring.h \
	include/cutils/klog.h \
	include/cutils/list.h \
	include/cutils/log.h \
	include/cutils/memory.h \
	include/cutils/misc.h \
	include/cutils/multiuser.h \
	include/cutils/native_handle.h \
	include/cutils/partition_utils.h \
	include/cutils/process_name.h \
	include/cutils/properties.h \
	include/cutils/qtaguid.h \
	include/cutils/record_stream.h \
	include/cutils/sched_policy.h \
	include/cutils/sockets.h \
	include/cutils/str_parms.h \
	include/cutils/threads.h \
	include/cutils/trace.h \
	include/cutils/uevent.h

# libcutils/tst_str_parms
# -----------------------
libcutils_tst_str_parms_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	-DTEST_STR_PARMS
libcutils_tst_str_parms_LDADD = \
	libandroid-log-0.la
libcutils_tst_str_parms_SOURCES = \
	libcutils/hashmap.c \
	libcutils/memory.c \
	libcutils/str_parms.c

# libandroid-sysutils.la
# --------------------
libandroid_sysutils_0_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
libandroid_sysutils_0_la_LIBADD = \
	libandroid-log-0.la \
	libandroid-cutils-0.la
libandroid_sysutils_0_la_DEPENDENCIES = \
	libandroid-log-0.la \
	libandroid-cutils-0.la
libandroid_sysutils_0_la_SOURCES = \
	libsysutils/src/FrameworkCommand.cpp \
	libsysutils/src/FrameworkListener.cpp \
	libsysutils/src/NetlinkEvent.cpp \
	libsysutils/src/NetlinkListener.cpp \
	libsysutils/src/ServiceManager.cpp \
	libsysutils/src/SocketClient.cpp \
	libsysutils/src/SocketListener.cpp

# Never used:
# libsysutils/src/FrameworkClient.cpp

# HEADERS: android/sysutils
# -----------------------
libandroid_sysutils_incdir = $(androidincdir)/sysutils
libandroid_sysutils_inc_HEADERS = \
	include/sysutils/FrameworkCommand.h \
	include/sysutils/FrameworkListener.h \
	include/sysutils/List.h \
	include/sysutils/NetlinkEvent.h \
	include/sysutils/NetlinkListener.h \
	include/sysutils/ServiceManager.h \
	include/sysutils/SocketClient.h \
	include/sysutils/SocketClientCommand.h \
	include/sysutils/SocketListener.h

# Never used:
# include/sysutils/FrameworkClient.h

# libandroid-backtrace.la
# --------------------
libandroid_backtrace_0_la_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(UNWIND_CFLAGS)
libandroid_backtrace_0_la_CFLAGS = \
	$(AM_CFLAGS) \
	$(UNWIND_CFLAGS) \
	-std=gnu99
libandroid_backtrace_0_la_CXXFLAGS = \
	$(AM_CXXFLAGS) \
	$(UNWIND_CFLAGS) \
	-std=gnu++11
libandroid_backtrace_0_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
libandroid_backtrace_0_la_LIBADD = \
	libandroid-log-0.la \
	libandroid-cutils-0.la \
	$(UNWIND_LIBS)
libandroid_backtrace_0_la_DEPENDENCIES = \
	libandroid-log-0.la \
	libandroid-cutils-0.la
libandroid_backtrace_0_la_SOURCES = \
	libbacktrace/BacktraceImpl.cpp \
	libbacktrace/BacktraceMap.cpp \
	libbacktrace/BacktraceThread.cpp \
	libbacktrace/UnwindCurrent.cpp \
	libbacktrace/UnwindPtrace.cpp \
	libbacktrace/thread_utils.c

# UnwindMap depneds on Android specific speedups for libunwind which
# are just not available in generic, packaged libunwind.
#
# libbacktrace/UnwindMap.cpp

# HEADERS: android/backtrace
# --------------------------
libandroid_backtrace_incdir = $(androidincdir)/backtrace
libandroid_backtrace_inc_HEADERS = \
	include/backtrace/Backtrace.h \
	include/backtrace/BacktraceMap.h \
	include/backtrace/backtrace_constants.h

# PKG-CONFIG data files
# ---------------------
pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = \
	android-backtrace-$(SYSTEMCORE_API_VERSION).pc \
	android-cutils-$(SYSTEMCORE_API_VERSION).pc \
	android-log-$(SYSTEMCORE_API_VERSION).pc \
	android-sysutils-$(SYSTEMCORE_API_VERSION).pc

$(pkgconfig_DATA): config.status

DISTCLEANFILES += \
	$(pkgconfig_DATA)
