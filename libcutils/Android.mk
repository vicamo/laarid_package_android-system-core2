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
	%reldir%/libandroid-cutils-0.la

%canon_reldir%_libandroid_cutils_0_la_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(BIONIC_CFLAGS)
%canon_reldir%_libandroid_cutils_0_la_CFLAGS = \
	$(AM_CFLAGS) \
	$(PTHREAD_CFLAGS) \
	$(BIONIC_CFLAGS)
%canon_reldir%_libandroid_cutils_0_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
%canon_reldir%_libandroid_cutils_0_la_LIBADD = \
	$(PTHREAD_LIBS) \
	$(BIONIC_LIBS) \
	liblog/libandroid-log-0.la
%canon_reldir%_libandroid_cutils_0_la_DEPENDENCIES = \
	liblog/libandroid-log-0.la
%canon_reldir%_libandroid_cutils_0_la_SOURCES = \
	%reldir%/atomic.c \
	%reldir%/config_utils.c \
	%reldir%/cpu_info.c \
	%reldir%/debugger.c \
	%reldir%/fs.c \
	%reldir%/hashmap.c \
	%reldir%/iosched_policy.c \
	%reldir%/klog.c \
	%reldir%/load_file.c \
	%reldir%/memory.c \
	%reldir%/multiuser.c \
	%reldir%/native_handle.c \
	%reldir%/partition_utils.c \
	%reldir%/process_name.c \
	%reldir%/properties.c \
	%reldir%/qtaguid.c \
	%reldir%/record_stream.c \
	%reldir%/sched_policy.c \
	%reldir%/socket_inaddr_any_server.c \
	%reldir%/socket_local_client.c \
	%reldir%/socket_local_server.c \
	%reldir%/socket_loopback_client.c \
	%reldir%/socket_loopback_server.c \
	%reldir%/socket_network_client.c \
	%reldir%/sockets.c \
	%reldir%/str_parms.c \
	%reldir%/strdup16to8.c \
	%reldir%/strdup8to16.c \
	%reldir%/threads.c \
	%reldir%/uevent.c

# Need kernel uapi/linux/reboot.h
#	%reldir%/android_reboot.c

if HAVE_ASHMEM
%canon_reldir%_libandroid_cutils_0_la_SOURCES += \
       %reldir%/ashmem-dev.c
else
%canon_reldir%_libandroid_cutils_0_la_SOURCES += \
       %reldir%/ashmem-host.c
endif

if OS_LINUX
%canon_reldir%_libandroid_cutils_0_la_SOURCES += \
	%reldir%/trace.c
endif

if CPU_ARM
%canon_reldir%_libandroid_cutils_0_la_SOURCES += \
	%reldir%/arch-arm/memset32.S
%canon_reldir%_libandroid_cutils_0_la_CPPFLAGS += \
	-DHAVE_MEMSET16 \
	-DHAVE_MEMSET32
endif
if CPU_AARCH64
%canon_reldir%_libandroid_cutils_0_la_SOURCES += \
	%reldir%/arch-arm64/android_memset.S
%canon_reldir%_libandroid_cutils_0_la_CPPFLAGS += \
	-DHAVE_MEMSET16 \
	-DHAVE_MEMSET32
endif
if CPU_X86
%canon_reldir%_libandroid_cutils_0_la_SOURCES += \
	%reldir%/arch-x86/android_memset16.S \
	%reldir%/arch-x86/android_memset32.S
%canon_reldir%_libandroid_cutils_0_la_CPPFLAGS += \
	-DHAVE_MEMSET16 \
	-DHAVE_MEMSET32
endif
if CPU_X86_64
%canon_reldir%_libandroid_cutils_0_la_SOURCES += \
	%reldir%/arch-x86_64/android_memset16_SSE2-atom.S \
	%reldir%/arch-x86_64/android_memset32_SSE2-atom.S
%canon_reldir%_libandroid_cutils_0_la_CPPFLAGS += \
	-DHAVE_MEMSET16 \
	-DHAVE_MEMSET32
endif

noinst_PROGRAMS += \
	%reldir%/tst_str_parms

%canon_reldir%_tst_str_parms_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(BIONIC_CFLAGS) \
	-DTEST_STR_PARMS
%canon_reldir%_tst_str_parms_LDADD = \
	$(BIONIC_LIBS) \
	liblog/libandroid-log-0.la
%canon_reldir%_tst_str_parms_SOURCES = \
	%reldir%/hashmap.c \
	%reldir%/memory.c \
	%reldir%/str_parms.c

pkgconfig_DATA += \
	%reldir%/android-cutils-$(SYSTEMCORE_API_VERSION).pc
