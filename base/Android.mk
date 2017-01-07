#
# Copyright (C) 2015 The Android Open Source Project
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
	%reldir%/libandroid-base.la

%canon_reldir%_libandroid_base_la_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(BIONIC_CFLAGS) \
	-I$(srcdir)/%reldir%/include
%canon_reldir%_libandroid_base_la_CXXFLAGS = \
	$(AM_CXXFLAGS) \
	-Wextra
%canon_reldir%_libandroid_base_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
%canon_reldir%_libandroid_base_la_LIBADD = \
	$(BIONIC_LIBS) \
	liblog/libandroid-log.la
%canon_reldir%_libandroid_base_la_SOURCES = \
	%reldir%/file.cpp \
	%reldir%/logging.cpp \
	%reldir%/stringprintf.cpp \
	%reldir%/strings.cpp

%canon_reldir%_libandroid_base_incdir = $(androidincdir)/base
%canon_reldir%_libandroid_base_inc_HEADERS = \
	%reldir%/include/base/file.h \
	%reldir%/include/base/logging.h \
	%reldir%/include/base/macros.h \
	%reldir%/include/base/memory.h \
	%reldir%/include/base/stringprintf.h \
	%reldir%/include/base/strings.h

pkgconfig_DATA += \
	%reldir%/android-base-$(SYSTEMCORE_API_VERSION).pc

if HAVE_GTEST
check_PROGRAMS += \
	%reldir%/libbase_test

TESTS += \
	%reldir%/libbase_test

%canon_reldir%_libbase_test_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(BIONIC_CFLAGS) \
	$(GTEST_CPPFLAGS) \
	-I$(srcdir)/%reldir%/include
%canon_reldir%_libbase_test_LDADD = \
	$(BIONIC_LIBS) \
	liblog/libandroid-log.la \
	libcutils/libandroid-cutils.la \
	%reldir%/libandroid-base.la \
	$(GTEST_LIBS)
%canon_reldir%_libbase_test_DEPENDENCIES = \
	liblog/libandroid-log.la \
	libcutils/libandroid-cutils.la \
	%reldir%/libandroid-base.la \
	$(GTEST_LIBS)
%canon_reldir%_libbase_test_SOURCES = \
	%reldir%/file_test.cpp \
	%reldir%/logging.cpp \
	%reldir%/stringprintf_test.cpp \
	%reldir%/strings_test.cpp \
	%reldir%/test_main.cpp \
	%reldir%/test_utils.cpp \
	%reldir%/test_utils.h
endif
