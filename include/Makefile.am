androidincdir = $(includedir)/android/system-core-$(SYSTEMCORE2_API_VERSION)

# Only compiled when TARGET_USES_LOGD is set to false in liblog/Andoird.mk, but
# we're trying to avoid Android specific kernel interface if possible.
#	liblog/log_read_kern.c
#	liblog/logd_write_kern.c
#
# Dummy log backend designed for HOST build.
#	liblog/fake_log_device.c

# HEADERS: android/nativebridge
# -----------------------------
%canon_reldir%_libandroid_nativebridge_incdir = $(androidincdir)/nativebridge
%canon_reldir%_libandroid_nativebridge_inc_HEADERS = \
	%reldir%/nativebridge/native_bridge.h

# HEADERS: android/backtrace
# --------------------------
%canon_reldir%_libandroid_backtrace_incdir = $(androidincdir)/backtrace
%canon_reldir%_libandroid_backtrace_inc_HEADERS = \
	%reldir%/backtrace/Backtrace.h \
	%reldir%/backtrace/BacktraceMap.h \
	%reldir%/backtrace/backtrace_constants.h

# HEADERS: android/utils
# -----------------------
%canon_reldir%_libandroid_utils_incdir = $(androidincdir)/utils
%canon_reldir%_libandroid_utils_inc_HEADERS = \
	%reldir%/utils/AndroidThreads.h \
	%reldir%/utils/Atomic.h \
	%reldir%/utils/BitSet.h \
	%reldir%/utils/BlobCache.h \
	%reldir%/utils/ByteOrder.h \
	%reldir%/utils/CallStack.h \
	%reldir%/utils/Compat.h \
	%reldir%/utils/Condition.h \
	%reldir%/utils/Debug.h \
	%reldir%/utils/Errors.h \
	%reldir%/utils/FileMap.h \
	%reldir%/utils/Flattenable.h \
	%reldir%/utils/Functor.h \
	%reldir%/utils/JenkinsHash.h \
	%reldir%/utils/KeyedVector.h \
	%reldir%/utils/LinearTransform.h \
	%reldir%/utils/List.h \
	%reldir%/utils/Log.h \
	%reldir%/utils/Looper.h \
	%reldir%/utils/LruCache.h \
	%reldir%/utils/Mutex.h \
	%reldir%/utils/NativeHandle.h \
	%reldir%/utils/Printer.h \
	%reldir%/utils/ProcessCallStack.h \
	%reldir%/utils/PropertyMap.h \
	%reldir%/utils/RWLock.h \
	%reldir%/utils/RefBase.h \
	%reldir%/utils/Singleton.h \
	%reldir%/utils/SortedVector.h \
	%reldir%/utils/StopWatch.h \
	%reldir%/utils/String16.h \
	%reldir%/utils/String8.h \
	%reldir%/utils/StrongPointer.h \
	%reldir%/utils/SystemClock.h \
	%reldir%/utils/Thread.h \
	%reldir%/utils/ThreadDefs.h \
	%reldir%/utils/Timers.h \
	%reldir%/utils/Tokenizer.h \
	%reldir%/utils/Trace.h \
	%reldir%/utils/TypeHelpers.h \
	%reldir%/utils/Unicode.h \
	%reldir%/utils/Vector.h \
	%reldir%/utils/VectorImpl.h \
	%reldir%/utils/ashmem.h \
	%reldir%/utils/misc.h \
	%reldir%/utils/threads.h

# HEADERS: android/ziparchive
# ---------------------------
%canon_reldir%_libandroid_ziparchive_incdir = $(androidincdir)/ziparchive
%canon_reldir%_libandroid_ziparchive_inc_HEADERS = \
	%reldir%/ziparchive/zip_archive.h \
	%reldir%/ziparchive/zip_archive_stream_entry.h \
	%reldir%/ziparchive/zip_writer.h

EXTRA_DIST += \
	%reldir%/private/android_filesystem_capability.h \
	%reldir%/private/android_filesystem_config.h \
	%reldir%/utils/Compat.h
