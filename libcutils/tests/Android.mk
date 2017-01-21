# Copyright (C) 2014 The Android Open Source Project
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

if HAVE_GTEST
check_PROGRAMS += \
	%reldir%/libcutils_test

TESTS += \
	%reldir%/libcutils_test

%canon_reldir%_libcutils_test_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(BIONIC_CFLAGS) \
	$(GTEST_CPPFLAGS)
%canon_reldir%_libcutils_test_LDADD = \
	$(BIONIC_LIBS) \
	base/libandroid-base.la \
	liblog/libandroid-log.la \
	libcutils/libandroid-cutils.la \
	$(GTEST_LIBS)
%canon_reldir%_libcutils_test_DEPENDENCIES = \
	base/libandroid-base.la \
	liblog/libandroid-log.la \
	libcutils/libandroid-cutils.la \
	$(GTEST_LIBS)
%canon_reldir%_libcutils_test_SOURCES = \
	%reldir%/MemsetTest.cpp \
	%reldir%/PropertiesTest.cpp \
	%reldir%/sockets_test.cpp \
	%reldir%/test_str_parms.cpp \
	%reldir%/trace-dev_test.cpp
endif
