#
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
#

# Build the unit tests.
if HAVE_GTEST
check_PROGRAMS += \
	%reldir%/libutils_tests

TESTS += \
	%reldir%/libutils_tests

%canon_reldir%_libutils_tests_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(ZLIB_CFLAGS) \
	$(BIONIC_CFLAGS) \
	$(LOG_CFLAGS) \
	$(CUTILS_CFLAGS) \
	$(NATIVEHELPER_CFLAGS) \
	$(GTEST_CPPFLAGS)
%canon_reldir%_libutils_tests_CXXFLAGS = \
	$(AM_CXXFLAGS) \
	-Wno-error
%canon_reldir%_libutils_tests_LDADD = \
	$(ZLIB_LIBS) \
	$(BIONIC_LIBS) \
	$(LOG_LIBS) \
	$(CUTILS_LIBS) \
	libutils/libandroid-utils.la \
	$(GTEST_LIBS)
%canon_reldir%_libutils_tests_DEPENDENCIES = \
	libutils/libandroid-utils.la \
	$(GTEST_LIBS)
%canon_reldir%_libutils_tests_SOURCES = \
	%reldir%/BlobCache_test.cpp \
	%reldir%/BitSet_test.cpp \
	%reldir%/Looper_test.cpp \
	%reldir%/LruCache_test.cpp \
	%reldir%/String8_test.cpp \
	%reldir%/StrongPointer_test.cpp \
	%reldir%/TestHelpers.h \
	%reldir%/Unicode_test.cpp \
	%reldir%/Vector_test.cpp

# libutils_tests includes tests with EXPECTS_DEATH, which may result
# in coredump and fails distcheck. According to
# https://github.com/google/googletest/issues/237 , this is a known
# limitation of test frameworks and we have to workaround this by our
# own.
CLEANFILES += core
endif
