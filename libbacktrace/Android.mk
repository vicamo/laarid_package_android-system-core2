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

lib_LTLIBRARIES += \
	%reldir%/libandroid-backtrace.la

%canon_reldir%_libandroid_backtrace_la_CPPFLAGS = \
	$(AM_CPPFLAGS) \
	$(UNWIND_CFLAGS) \
	$(BIONIC_CFLAGS) \
	$(LOG_CFLAGS) \
	$(CUTILS_CFLAGS)
%canon_reldir%_libandroid_backtrace_la_CXXFLAGS = \
	$(AM_CXXFLAGS) \
	$(UNWIND_CFLAGS) \
	$(LOG_CFLAGS) \
	$(CUTILS_CFLAGS) \
	-std=gnu++11
%canon_reldir%_libandroid_backtrace_la_LDFLAGS = \
	$(AM_LDFLAGS) \
	$(libtool_opts)
%canon_reldir%_libandroid_backtrace_la_LIBADD = \
	$(UNWIND_LIBS) \
	$(BIONIC_LIBS) \
	$(LOG_LIBS)
%canon_reldir%_libandroid_backtrace_la_SOURCES = \
	%reldir%/BacktraceImpl.cpp \
	%reldir%/BacktraceMap.cpp \
	%reldir%/BacktraceThread.cpp \
	%reldir%/UnwindCurrent.cpp \
	%reldir%/UnwindPtrace.cpp

# UnwindMap depneds on Android specific speedups for libunwind which
# are just not available in generic, packaged libunwind.
#
# %reldir%/UnwindMap.cpp

pkgconfig_DATA += \
	%reldir%/android-backtrace-$(SYSTEMCORE_API_VERSION).pc
