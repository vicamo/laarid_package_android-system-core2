#
# Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

lib_LTLIBRARIES += \
	%reldir%/libandroid-cutils.la

%canon_reldir%_libandroid_cutils_la_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(BIONIC_CFLAGS)
if ENABLE_CPUSETS
%canon_reldir%_libandroid_cutils_la_CPPFLAGS += \
	-DUSE_CPUSETS
endif
%canon_reldir%_libandroid_cutils_la_CFLAGS = \
	$(AM_CFLAGS) \
	-std=gnu90 \
	$(PTHREAD_CFLAGS) \
	$(BIONIC_CFLAGS)
%canon_reldir%_libandroid_cutils_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
%canon_reldir%_libandroid_cutils_la_LIBADD = \
	$(PTHREAD_LIBS) \
	$(BIONIC_LIBS) \
	liblog/libandroid-log.la
%canon_reldir%_libandroid_cutils_la_DEPENDENCIES = \
	liblog/libandroid-log.la
%canon_reldir%_libandroid_cutils_la_SOURCES = \
	%reldir%/atomic.c \
	%reldir%/config_utils.c \
	%reldir%/debugger.c \
	%reldir%/fs.c \
	%reldir%/fs_config.c \
	%reldir%/hashmap.c \
	%reldir%/iosched_policy.c \
	%reldir%/klog.c \
	%reldir%/load_file.c \
	%reldir%/multiuser.c \
	%reldir%/native_handle.c \
	%reldir%/partition_utils.c \
	%reldir%/process_name.c \
	%reldir%/properties.c \
	%reldir%/qtaguid.c \
	%reldir%/record_stream.c \
	%reldir%/sched_policy.c \
	%reldir%/socket_inaddr_any_server.c \
	%reldir%/socket_local.h \
	%reldir%/socket_local_client.c \
	%reldir%/socket_local_server.c \
	%reldir%/socket_loopback_client.c \
	%reldir%/socket_loopback_server.c \
	%reldir%/socket_network_client.c \
	%reldir%/sockets.c \
	%reldir%/str_parms.c \
	%reldir%/strlcpy.c \
	%reldir%/strdup16to8.c \
	%reldir%/strdup8to16.c \
	%reldir%/threads.c \
	%reldir%/uevent.c

# Need kernel uapi/linux/reboot.h
#	%reldir%/android_reboot.c

if HAVE_ASHMEM
%canon_reldir%_libandroid_cutils_la_SOURCES += \
       %reldir%/ashmem-dev.c
else
%canon_reldir%_libandroid_cutils_la_SOURCES += \
       %reldir%/ashmem-host.c
endif

if OS_LINUX
%canon_reldir%_libandroid_cutils_la_SOURCES += \
	%reldir%/trace-dev.c
endif

if CPU_ARM
%canon_reldir%_libandroid_cutils_la_SOURCES += \
	%reldir%/arch-arm/memset32.S
endif
if CPU_AARCH64
%canon_reldir%_libandroid_cutils_la_SOURCES += \
	%reldir%/arch-arm64/android_memset.S
endif
if CPU_MIPS
%canon_reldir%_libandroid_cutils_la_SOURCES += \
	%reldir%/arch-mips/android_memset.c
endif
if CPU_MIPS64
%canon_reldir%_libandroid_cutils_la_SOURCES += \
	%reldir%/arch-mips/android_memset.c
endif
if CPU_X86
%canon_reldir%_libandroid_cutils_la_SOURCES += \
	%reldir%/arch-x86/android_memset16.S \
	%reldir%/arch-x86/android_memset32.S \
	%reldir%/arch-x86/cache.h
endif
if CPU_X86_64
%canon_reldir%_libandroid_cutils_la_SOURCES += \
	%reldir%/arch-x86_64/android_memset16.S \
	%reldir%/arch-x86_64/android_memset32.S \
	%reldir%/arch-x86_64/cache.h
endif

pkgconfig_DATA += \
	%reldir%/android-cutils-$(SYSTEMCORE_API_VERSION).pc

include $(srcdir)/libcutils/tests/Android.mk
