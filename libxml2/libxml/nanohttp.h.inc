# 1 "nanohttp.h"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 32 "<command-line>" 2
# 1 "nanohttp.h"
# 14 "nanohttp.h"
# 1 "../libxml/xmlversion.h" 1
# 13 "../libxml/xmlversion.h"
# 1 "../libxml/xmlexports.h" 1
# 14 "../libxml/xmlversion.h" 2
# 24 "../libxml/xmlversion.h"
 void xmlCheckVersion(int version);
# 15 "nanohttp.h" 2






 void
 xmlNanoHTTPInit (void);
 void
 xmlNanoHTTPCleanup (void);
 void
 xmlNanoHTTPScanProxy (const char *URL);
 int
 xmlNanoHTTPFetch (const char *URL,
     const char *filename,
     char **contentType);
 void *
 xmlNanoHTTPMethod (const char *URL,
     const char *method,
     const char *input,
     char **contentType,
     const char *headers,
     int ilen);
 void *
 xmlNanoHTTPMethodRedir (const char *URL,
     const char *method,
     const char *input,
     char **contentType,
     char **redir,
     const char *headers,
     int ilen);
 void *
 xmlNanoHTTPOpen (const char *URL,
     char **contentType);
 void *
 xmlNanoHTTPOpenRedir (const char *URL,
     char **contentType,
     char **redir);
 int
 xmlNanoHTTPReturnCode (void *ctx);
 const char *
 xmlNanoHTTPAuthHeader (void *ctx);
 const char *
 xmlNanoHTTPRedir (void *ctx);
 int
 xmlNanoHTTPContentLength( void * ctx );
 const char *
 xmlNanoHTTPEncoding (void *ctx);
 const char *
 xmlNanoHTTPMimeType (void *ctx);
 int
 xmlNanoHTTPRead (void *ctx,
     void *dest,
     int len);

 int
 xmlNanoHTTPSave (void *ctxt,
     const char *filename);

 void
 xmlNanoHTTPClose (void *ctx);
