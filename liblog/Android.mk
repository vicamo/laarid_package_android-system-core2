#
# Copyright (C) 2008-2014 The Android Open Source Project
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
	%reldir%/libandroid-log.la

%canon_reldir%_libandroid_log_la_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(BIONIC_CFLAGS)
%canon_reldir%_libandroid_log_la_CFLAGS = \
	$(AM_CFLAGS) \
	$(BIONIC_CFLAGS)
%canon_reldir%_libandroid_log_la_LIBADD = \
	$(BIONIC_LIBS)
%canon_reldir%_libandroid_log_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
%canon_reldir%_libandroid_log_la_SOURCES = \
	%reldir%/event_tag_map.c \
	%reldir%/logprint.c \
	%reldir%/log_time.cpp \
	%reldir%/log_read.c \
	%reldir%/logd_write.c

pkgconfig_DATA += \
	%reldir%/android-log-$(SYSTEMCORE_API_VERSION).pc
