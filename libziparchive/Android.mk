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
	$(ZLIB_CFLAGS) \
	$(LOG_CFLAGS) \
	$(BASE_CFLAGS) \
	$(CUTILS_CFLAGS)
# ZLIB_CONST turns on const for input buffers, which is pretty standard.
%canon_reldir%_libandroid_ziparchive_la_CPPFLAGS += \
	-DZLIB_CONST
%canon_reldir%_libandroid_ziparchive_la_CXXFLAGS = \
	$(AM_CXXFLAGS)
# Incorrectly warns when C++11 empty brace {} initializer is used.
# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61489
%canon_reldir%_libandroid_ziparchive_la_CXXFLAGS += \
	-Wold-style-cast \
	-Wno-missing-field-initializers
%canon_reldir%_libandroid_ziparchive_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
%canon_reldir%_libandroid_ziparchive_la_LIBADD = \
	$(ZLIB_LIBS) \
	$(LOG_LIBS) \
	$(BASE_LIBS) \
	libutils/libandroid-utils.la
%canon_reldir%_libandroid_ziparchive_la_SOURCES = \
	%reldir%/entry_name_utils-inl.h \
	%reldir%/zip_archive.cc \
	%reldir%/zip_archive_common.h \
	%reldir%/zip_archive_private.h \
	%reldir%/zip_archive_stream_entry.cc \
	%reldir%/zip_writer.cc

pkgconfig_DATA += \
	%reldir%/android-ziparchive-$(SYSTEMCORE2_API_VERSION).pc
