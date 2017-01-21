androidincdir = $(includedir)/android/system-core-$(SYSTEMCORE_API_VERSION)

# Only compiled when TARGET_USES_LOGD is set to false in liblog/Andoird.mk, but
# we're trying to avoid Android specific kernel interface if possible.
#	liblog/log_read_kern.c
#	liblog/logd_write_kern.c
#
# Dummy log backend designed for HOST build.
#	liblog/fake_log_device.c

# HEADERS: android/log
# --------------------
%canon_reldir%_libandroid_log_incdir = $(androidincdir)/log
%canon_reldir%_libandroid_log_inc_HEADERS = \
	%reldir%/log/event_tag_map.h \
	%reldir%/log/log.h \
	%reldir%/log/log_read.h \
	%reldir%/log/logd.h \
	%reldir%/log/logger.h \
	%reldir%/log/logprint.h

%canon_reldir%_libandroid_android_incdir = $(androidincdir)/android
%canon_reldir%_libandroid_android_inc_HEADERS = \
	%reldir%/android/log.h

# HEADERS: android/mincrypt
# -------------------------
%canon_reldir%_libandroid_mincrypt_incdir = $(androidincdir)/mincrypt
%canon_reldir%_libandroid_mincrypt_inc_HEADERS = \
	%reldir%/mincrypt/dsa_sig.h \
	%reldir%/mincrypt/hash-internal.h \
	%reldir%/mincrypt/p256.h \
	%reldir%/mincrypt/p256_ecdsa.h \
	%reldir%/mincrypt/rsa.h \
	%reldir%/mincrypt/sha.h \
	%reldir%/mincrypt/sha256.h

# HEADERS: android/cutils
# -----------------------
%canon_reldir%_libandroid_cutils_incdir = $(androidincdir)/cutils
%canon_reldir%_libandroid_cutils_inc_HEADERS = \
	%reldir%/cutils/android_reboot.h \
	%reldir%/cutils/ashmem.h \
	%reldir%/cutils/atomic.h \
	%reldir%/cutils/bitops.h \
	%reldir%/cutils/compiler.h \
	%reldir%/cutils/config_utils.h \
	%reldir%/cutils/debugger.h \
	%reldir%/cutils/fs.h \
	%reldir%/cutils/hashmap.h \
	%reldir%/cutils/iosched_policy.h \
	%reldir%/cutils/jstring.h \
	%reldir%/cutils/klog.h \
	%reldir%/cutils/list.h \
	%reldir%/cutils/log.h \
	%reldir%/cutils/memory.h \
	%reldir%/cutils/misc.h \
	%reldir%/cutils/multiuser.h \
	%reldir%/cutils/native_handle.h \
	%reldir%/cutils/partition_utils.h \
	%reldir%/cutils/process_name.h \
	%reldir%/cutils/properties.h \
	%reldir%/cutils/qtaguid.h \
	%reldir%/cutils/record_stream.h \
	%reldir%/cutils/sched_policy.h \
	%reldir%/cutils/sockets.h \
	%reldir%/cutils/str_parms.h \
	%reldir%/cutils/threads.h \
	%reldir%/cutils/trace.h \
	%reldir%/cutils/uevent.h

# HEADERS: android/diskconfig
# ---------------------------
%canon_reldir%_libandroid_diskconfig_incdir = $(androidincdir)/diskconfig
%canon_reldir%_libandroid_diskconfig_inc_HEADERS = \
	%reldir%/diskconfig/diskconfig.h

# HEADERS: android/netutils
# -------------------------
%canon_reldir%_libandroid_netutils_incdir = $(androidincdir)/netutils
%canon_reldir%_libandroid_netutils_inc_HEADERS = \
	%reldir%/netutils/ifc.h

# HEADERS: android/sysutils
# -----------------------
%canon_reldir%_libandroid_sysutils_incdir = $(androidincdir)/sysutils
%canon_reldir%_libandroid_sysutils_inc_HEADERS = \
	%reldir%/sysutils/FrameworkCommand.h \
	%reldir%/sysutils/FrameworkListener.h \
	%reldir%/sysutils/List.h \
	%reldir%/sysutils/NetlinkEvent.h \
	%reldir%/sysutils/NetlinkListener.h \
	%reldir%/sysutils/ServiceManager.h \
	%reldir%/sysutils/SocketClient.h \
	%reldir%/sysutils/SocketClientCommand.h \
	%reldir%/sysutils/SocketListener.h

# Never used:
# %reldir%/sysutils/FrameworkClient.h

# HEADERS: android/usbhost
# ------------------------
%canon_reldir%_libandroid_usbhost_incdir = $(androidincdir)/usbhost
%canon_reldir%_libandroid_usbhost_inc_HEADERS = \
	%reldir%/usbhost/usbhost.h

# HEADERS: android/system
# -----------------------
%canon_reldir%_libandroid_system_incdir = $(androidincdir)/system
%canon_reldir%_libandroid_system_inc_HEADERS = \
	%reldir%/system/camera.h \
	%reldir%/system/graphics.h \
	%reldir%/system/radio.h \
	%reldir%/system/thread_defs.h \
	%reldir%/system/window.h

EXTRA_DIST += \
	%reldir%/private/android_filesystem_capability.h \
	%reldir%/private/android_filesystem_config.h \
	%reldir%/private/android_logger.h \
	%reldir%/utils/Compat.h
