#
# Copyright (C) 2013 The Android Open Source Project
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

lib_LTLIBRARIES += \
	%reldir%/libandroid-ziparchive.la

%canon_reldir%_libandroid_ziparchive_la_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(ZLIB_CFLAGS)
%canon_reldir%_libandroid_ziparchive_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
%canon_reldir%_libandroid_ziparchive_la_LIBADD = \
	base/libandroid-base.la \
	liblog/libandroid-log.la \
	libutils/libandroid-utils.la \
	$(ZLIB_LIBS)
%canon_reldir%_libandroid_ziparchive_la_SOURCES = \
	%reldir%/zip_archive.cc

pkgconfig_DATA += \
	%reldir%/android-ziparchive-$(SYSTEMCORE_API_VERSION).pc
