# 1 "nanoftp.h"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 32 "<command-line>" 2
# 1 "nanoftp.h"
# 14 "nanoftp.h"
# 1 "../libxml/xmlversion.h" 1
# 13 "../libxml/xmlversion.h"
# 1 "../libxml/xmlexports.h" 1
# 14 "../libxml/xmlversion.h" 2
# 24 "../libxml/xmlversion.h"
 void xmlCheckVersion(int version);
# 15 "nanoftp.h" 2
# 60 "nanoftp.h"
typedef void (*ftpListCallback) (void *userData,
                          const char *filename, const char *attrib,
                          const char *owner, const char *group,
     unsigned long size, int links, int year,
     const char *month, int day, int hour,
     int minute);
# 74 "nanoftp.h"
typedef void (*ftpDataCallback) (void *userData,
     const char *data,
     int len);




 void
 xmlNanoFTPInit (void);
 void
 xmlNanoFTPCleanup (void);




 void *
 xmlNanoFTPNewCtxt (const char *URL);
 void
 xmlNanoFTPFreeCtxt (void * ctx);
 void *
 xmlNanoFTPConnectTo (const char *server,
     int port);



 void *
 xmlNanoFTPOpen (const char *URL);
 int
 xmlNanoFTPConnect (void *ctx);
 int
 xmlNanoFTPClose (void *ctx);
 int
 xmlNanoFTPQuit (void *ctx);
 void
 xmlNanoFTPScanProxy (const char *URL);
 void
 xmlNanoFTPProxy (const char *host,
     int port,
     const char *user,
     const char *passwd,
     int type);
 int
 xmlNanoFTPUpdateURL (void *ctx,
     const char *URL);




 int
 xmlNanoFTPGetResponse (void *ctx);
 int
 xmlNanoFTPCheckResponse (void *ctx);




 int
 xmlNanoFTPCwd (void *ctx,
     const char *directory);
 int
 xmlNanoFTPDele (void *ctx,
     const char *file);

 int
 xmlNanoFTPGetConnection (void *ctx);
 int
 xmlNanoFTPCloseConnection(void *ctx);
 int
 xmlNanoFTPList (void *ctx,
     ftpListCallback callback,
     void *userData,
     const char *filename);
 int
 xmlNanoFTPGetSocket (void *ctx,
     const char *filename);
 int
 xmlNanoFTPGet (void *ctx,
     ftpDataCallback callback,
     void *userData,
     const char *filename);
 int
 xmlNanoFTPRead (void *ctx,
     void *dest,
     int len);
