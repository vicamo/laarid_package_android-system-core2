/*
 * Copyright (C) 2014 You-Sheng Yang
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <stdio.h>
#include <string.h>

#if defined(__unused)
#  undef __unused
#endif

#if !defined(HAVE_STRERROR_R)
#  define __unused __attribute__((__unused__))
#else
#  define __unused
#endif

char __attribute__ ((visibility ("hidden")))
*strerror_r_wrapper(int errnum, char *buf __unused, size_t buflen __unused)
{
#if !defined(HAVE_STRERROR_R)
    return strerror(errnum);
#elif defined(STRERROR_R_CHAR_P)
    char* ret = strerror_r(errnum, buf, buflen);
    if (!ret) {
        snprintf(buf, buflen, "Unknown error %d", errnum);
        ret = buf;
    }
    return ret;
#else /* !STRERROR_R_CHAR_P */
    int result = strerror_r(errnum, buf, buflen);
    if (result) {
        if (result < 0) {
            result = -result;
        }
        snprintf(buf, buflen, "Unknown error %d", errnum);
    }
    return buf;
#endif
}
