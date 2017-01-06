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
#

if HAVE_GTEST
check_PROGRAMS += \
	%reldir%/ion-unit-tests

TESTS += \
	%reldir%/ion-unit-tests

%canon_reldir%_ion_unit_tests_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(GTEST_CPPFLAGS) \
	-I$(srcdir)/libion/include \
	-I$(srcdir)/libion/kernel-headers
%canon_reldir%_ion_unit_tests_CXXFLAGS = \
	$(AM_CXXFLAGS) \
	-g -Wno-missing-field-initializers
%canon_reldir%_ion_unit_tests_LDADD = \
	libion/libandroid-ion.la \
	$(GTEST_LIBS)
%canon_reldir%_ion_unit_tests_DEPENDENCIES = \
	libion/libandroid-ion.la \
	$(GTEST_LIBS)
%canon_reldir%_ion_unit_tests_SOURCES = \
	%reldir%/ion_test_fixture.cpp \
	%reldir%/ion_test_fixture.h \
	%reldir%/allocate_test.cpp \
	%reldir%/formerly_valid_handle_test.cpp \
	%reldir%/invalid_values_test.cpp \
	%reldir%/map_test.cpp \
	%reldir%/device_test.cpp \
	%reldir%/exit_test.cpp
endif
