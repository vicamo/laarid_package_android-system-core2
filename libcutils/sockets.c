/*
 * Copyright (C) 2011 The Android Open Source Project
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

#include <errno.h>
#include <stdlib.h>
#include <string.h>

#ifdef HAVE_WINSOCK
#include <winsock2.h>
typedef int  socklen_t;
#elif HAVE_SYS_SOCKET_H
#include <sys/socket.h>
#endif

#include <bionic/bionic.h> /* for strlcpy */
#include <cutils/sockets.h>
#include <log/log.h>

#ifdef HAVE_ANDROID_OS
/* For the socket trust (credentials) check */
#include <private/android_filesystem_config.h>
#define __android_unused
#else
#define __android_unused __attribute__((__unused__))
#endif

bool socket_peer_is_trusted(int fd __android_unused)
{
#ifdef HAVE_ANDROID_OS
    struct ucred cr;
    socklen_t len = sizeof(cr);
    int n = getsockopt(fd, SOL_SOCKET, SO_PEERCRED, &cr, &len);

    if (n != 0) {
        ALOGE("could not get socket credentials: %s\n", strerror(errno));
        return false;
    }

    if ((cr.uid != AID_ROOT) && (cr.uid != AID_SHELL)) {
        ALOGE("untrusted userid on other end of socket: userid %d\n", cr.uid);
        return false;
    }
#endif

    return true;
}

int android_get_control_socket(const char *name)
{
	char key[64] = ANDROID_SOCKET_ENV_PREFIX;
	const char *val;
	int fd;

	/* build our environment variable, counting cycles like a wolf ... */
	strlcpy(key + sizeof(ANDROID_SOCKET_ENV_PREFIX) - 1,
		name,
		sizeof(key) - sizeof(ANDROID_SOCKET_ENV_PREFIX));

	val = getenv(key);
	if (!val)
		return -1;

	errno = 0;
	fd = strtol(val, NULL, 10);
	if (errno)
		return -1;

	return fd;
}
