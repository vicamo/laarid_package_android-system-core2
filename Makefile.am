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

bin_SCRIPTS =
bin_PROGRAMS =
noinst_PROGRAMS =
lib_LTLIBRARIES =

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
lib_LTLIBRARIES += \
	libandroid-log-0.la \
	libandroid-mincrypt-0.la \
	libandroid-sparse-0.la \
	libandroid-zipfile-0.la

lib_LTLIBRARIES += \
	libandroid-cutils-0.la

lib_LTLIBRARIES += \
	libandroid-backtrace-0.la \
	libandroid-diskconfig-0.la \
	libandroid-netutils-0.la \
	libandroid-suspend-0.la \
	libandroid-sysutils-0.la

lib_LTLIBRARIES += \
	libandroid-utils-0.la

# Tools from libsparse
# --------------------
bin_PROGRAMS += \
	append2simg \
	img2simg \
	simg2img

bin_SCRIPTS += \
	libsparse/simg_dump.py

# Test tools from libzipfile
# --------------------------
noinst_PROGRAMS += \
	libzipfile/test_zipfile

# Test tools from libcutils
# -------------------------
noinst_PROGRAMS += \
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

libandroid_android_incdir = $(androidincdir)/android
libandroid_android_inc_HEADERS = \
	include/android/log.h

# libandroid-mincrypt.la
# ----------------------
libandroid_mincrypt_0_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
libandroid_mincrypt_0_la_SOURCES = \
	libmincrypt/dsa_sig.c \
	libmincrypt/p256.c \
	libmincrypt/p256_ec.c \
	libmincrypt/p256_ecdsa.c \
	libmincrypt/rsa.c \
	libmincrypt/sha.c \
	libmincrypt/sha256.c

# HEADERS: android/mincrypt
# -------------------------
libandroid_mincrypt_incdir = $(androidincdir)/mincrypt
libandroid_mincrypt_inc_HEADERS = \
	include/mincrypt/dsa_sig.h \
	include/mincrypt/hash-internal.h \
	include/mincrypt/p256.h \
	include/mincrypt/p256_ecdsa.h \
	include/mincrypt/rsa.h \
	include/mincrypt/sha.h \
	include/mincrypt/sha256.h

# libandroid-sparse.la
# --------------------
libandroid_sparse_0_la_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(ZLIB_CFLAGS) \
	-I$(top_srcdir)/libsparse/include
libandroid_sparse_0_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
libandroid_sparse_0_la_LIBADD = \
	$(ZLIB_LIBS)
libandroid_sparse_0_la_SOURCES = \
	libsparse/backed_block.c \
	libsparse/output_file.c \
	libsparse/sparse.c \
	libsparse/sparse_crc32.c \
	libsparse/sparse_err.c \
	libsparse/sparse_read.c

# append2simg
# -----------
append2simg_CPPFLAGS = \
	$(libandroid_sparse_0_la_CPPFLAGS)
append2simg_LDADD = \
	libandroid-sparse-0.la
append2simg_SOURCES = \
	libsparse/append2simg.c

# img2simg
# --------
img2simg_CPPFLAGS = \
	$(libandroid_sparse_0_la_CPPFLAGS)
img2simg_LDADD = \
	libandroid-sparse-0.la
img2simg_SOURCES = \
	libsparse/img2simg.c

# simg2img
# --------
simg2img_CPPFLAGS = \
	$(libandroid_sparse_0_la_CPPFLAGS)
simg2img_LDADD = \
	libandroid-sparse-0.la
simg2img_SOURCES = \
	libsparse/simg2img.c

# libandroid-zipfile.la
# ---------------------
libandroid_zipfile_0_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
libandroid_zipfile_0_la_LIBADD = \
	$(ZLIB_LIBS)
libandroid_zipfile_0_la_SOURCES = \
	libzipfile/centraldir.c \
	libzipfile/zipfile.c

# HEADERS: android/zipfile
# ------------------------
libandroid_zipfile_incdir = $(androidincdir)/zipfile
libandroid_zipfile_inc_HEADERS = \
	include/zipfile/zipfile.h

# libzipfile/test_zipfile
# -----------------------
libzipfile_test_zipfile_LDADD = \
	libandroid-zipfile-0.la
libzipfile_test_zipfile_SOURCES = \
	libzipfile/test_zipfile.c

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
	libbacktrace/UnwindPtrace.cpp

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

# libandroid-disconfig.la
# -----------------------
libandroid_diskconfig_0_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
libandroid_diskconfig_0_la_LIBADD = \
	libandroid-log-0.la \
	libandroid-cutils-0.la
libandroid_diskconfig_0_la_SOURCES = \
	libdiskconfig/config_mbr.c \
	libdiskconfig/diskconfig.c \
	libdiskconfig/diskutils.c \
	libdiskconfig/write_lst.c

# HEADERS: android/diskconfig
# ---------------------------
libandroid_diskconfig_incdir = $(androidincdir)/diskconfig
libandroid_diskconfig_inc_HEADERS = \
	include/diskconfig/diskconfig.h

# libandroid-netutils.la
# ----------------------
libandroid_netutils_0_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
libandroid_netutils_0_la_LIBADD = \
	libandroid-log-0.la \
	libandroid-cutils-0.la
libandroid_netutils_0_la_SOURCES = \
	libnetutils/dhcpclient.c \
	libnetutils/dhcpmsg.c \
	libnetutils/dhcp_utils.c \
	libnetutils/ifc_utils.c \
	libnetutils/packet.c

# HEADERS: android/netutils
# -------------------------
libandroid_netutils_incdir = $(androidincdir)/netutils
libandroid_netutils_inc_HEADERS = \
	include/netutils/dhcp.h \
	include/netutils/ifc.h

# libandroid-suspend.la
# ---------------------
libandroid_suspend_0_la_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	-I$(top_srcdir)/libsuspend/include
libandroid_suspend_0_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
libandroid_suspend_0_la_LIBADD = \
	libandroid-log-0.la \
	libandroid-cutils-0.la
libandroid_suspend_0_la_SOURCES = \
	libsuspend/autosuspend.c \
	libsuspend/autosuspend_autosleep.c \
	libsuspend/autosuspend_earlysuspend.c \
	libsuspend/autosuspend_wakeup_count.c \
	libsuspend/strerror_r.c

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

# libandroid-utils.la
# -------------------
libandroid_utils_0_la_CPPFLAGS = \
	$(AM_CPPFLAGS)
libandroid_utils_0_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
libandroid_utils_0_la_LIBADD = \
	libandroid-backtrace-0.la \
	libandroid-cutils-0.la \
	libandroid-log-0.la
libandroid_utils_0_la_DEPENDENCIES = \
	libandroid-cutils-0.la \
	libandroid-log-0.la
libandroid_utils_0_la_SOURCES = \
	libutils/BasicHashtable.cpp \
	libutils/BlobCache.cpp \
	libutils/CallStack.cpp \
	libutils/FileMap.cpp \
	libutils/JenkinsHash.cpp \
	libutils/LinearAllocator.cpp \
	libutils/LinearTransform.cpp \
	libutils/Log.cpp \
	libutils/Looper.cpp \
	libutils/Printer.cpp \
	libutils/ProcessCallStack.cpp \
	libutils/PropertyMap.cpp \
	libutils/RefBase.cpp \
	libutils/SharedBuffer.cpp \
	libutils/Static.cpp \
	libutils/StopWatch.cpp \
	libutils/String8.cpp \
	libutils/String16.cpp \
	libutils/SystemClock.cpp \
	libutils/Threads.cpp \
	libutils/Timers.cpp \
	libutils/Tokenizer.cpp \
	libutils/Trace.cpp \
	libutils/Unicode.cpp \
	libutils/VectorImpl.cpp \
	libutils/misc.cpp

# HEADERS: android/utils
# -----------------------
libandroid_utils_incdir = $(androidincdir)/utils
libandroid_utils_inc_HEADERS = \
	include/utils/AndroidThreads.h \
	include/utils/Atomic.h \
	include/utils/BasicHashtable.h \
	include/utils/BitSet.h \
	include/utils/BlobCache.h \
	include/utils/ByteOrder.h \
	include/utils/CallStack.h \
	include/utils/Compat.h \
	include/utils/Condition.h \
	include/utils/Debug.h \
	include/utils/Errors.h \
	include/utils/FileMap.h \
	include/utils/Flattenable.h \
	include/utils/Functor.h \
	include/utils/JenkinsHash.h \
	include/utils/KeyedVector.h \
	include/utils/LinearAllocator.h \
	include/utils/LinearTransform.h \
	include/utils/List.h \
	include/utils/Log.h \
	include/utils/Looper.h \
	include/utils/LruCache.h \
	include/utils/Mutex.h \
	include/utils/Printer.h \
	include/utils/ProcessCallStack.h \
	include/utils/PropertyMap.h \
	include/utils/RWLock.h \
	include/utils/RefBase.h \
	include/utils/SharedBuffer.h \
	include/utils/Singleton.h \
	include/utils/SortedVector.h \
	include/utils/StopWatch.h \
	include/utils/String16.h \
	include/utils/String8.h \
	include/utils/StrongPointer.h \
	include/utils/SystemClock.h \
	include/utils/Thread.h \
	include/utils/ThreadDefs.h \
	include/utils/Timers.h \
	include/utils/Tokenizer.h \
	include/utils/Trace.h \
	include/utils/TypeHelpers.h \
	include/utils/Unicode.h \
	include/utils/UniquePtr.h \
	include/utils/Vector.h \
	include/utils/VectorImpl.h \
	include/utils/ashmem.h \
	include/utils/misc.h \
	include/utils/threads.h

# PKG-CONFIG data files
# ---------------------
pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = \
	android-backtrace-$(SYSTEMCORE_API_VERSION).pc \
	android-cutils-$(SYSTEMCORE_API_VERSION).pc \
	android-diskconfig-$(SYSTEMCORE_API_VERSION).pc \
	android-log-$(SYSTEMCORE_API_VERSION).pc \
	android-mincrypt-$(SYSTEMCORE_API_VERSION).pc \
	android-netutils-$(SYSTEMCORE_API_VERSION).pc \
	android-sparse-$(SYSTEMCORE_API_VERSION).pc \
	android-suspend-$(SYSTEMCORE_API_VERSION).pc \
	android-sysutils-$(SYSTEMCORE_API_VERSION).pc \
	android-utils-$(SYSTEMCORE_API_VERSION).pc \
	android-zipfile-$(SYSTEMCORE_API_VERSION).pc

$(pkgconfig_DATA): config.status

DISTCLEANFILES += \
	$(pkgconfig_DATA)
