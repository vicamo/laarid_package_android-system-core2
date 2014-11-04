#ifndef _FRAMEWORK_CLIENT_H
#define _FRAMEWORK_CLIENT_H

#include <sysutils/List.h>

#include <pthread.h>

class FrameworkClient {
    int             mSocket;
    pthread_mutex_t mWriteMutex;

public:
    FrameworkClient(int sock);
    virtual ~FrameworkClient() {}

    int sendMsg(const char *msg);
    int sendMsg(const char *msg, const char *data);
};

typedef android::sysutils::List<FrameworkClient *> FrameworkClientCollection;
#endif
