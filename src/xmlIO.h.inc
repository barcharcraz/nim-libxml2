#mangle "'_xml'{.*}" "p_xml_$1"
# 15 "xmlIO.h" 2
# 34 "xmlIO.h"
typedef int ( *xmlInputMatchCallback) (char const *filename);
# 43 "xmlIO.h"
typedef void * ( *xmlInputOpenCallback) (char const *filename);
# 54 "xmlIO.h"
typedef int ( *xmlInputReadCallback) (void * context, char * buffer, int len);
# 63 "xmlIO.h"
typedef int ( *xmlInputCloseCallback) (void * context);
# 80 "xmlIO.h"
typedef int ( *xmlOutputMatchCallback) (char const *filename);
# 89 "xmlIO.h"
typedef void * ( *xmlOutputOpenCallback) (char const *filename);
# 100 "xmlIO.h"
typedef int ( *xmlOutputWriteCallback) (void * context, const char * buffer,
                                       int len);
# 110 "xmlIO.h"
typedef int ( *xmlOutputCloseCallback) (void * context);



# 118 "xmlIO.h" 2







struct _xmlParserInputBuffer {
    void* context;
    xmlInputReadCallback readcallback;
    xmlInputCloseCallback closecallback;

    xmlCharEncodingHandlerPtr encoder;

    xmlBufPtr buffer;
    xmlBufPtr raw;
    int compressed;
    int error;
    unsigned long rawconsumed;
};



struct _xmlOutputBuffer {
    void* context;
    xmlOutputWriteCallback writecallback;
    xmlOutputCloseCallback closecallback;

    xmlCharEncodingHandlerPtr encoder;

    xmlBufPtr buffer;
    xmlBufPtr conv;
    int written;
    int error;
};





 void
 xmlCleanupInputCallbacks (void);

 int
 xmlPopInputCallbacks (void);

 void
 xmlRegisterDefaultInputCallbacks (void);
 xmlParserInputBufferPtr
 xmlAllocParserInputBuffer (xmlCharEncoding enc);

 xmlParserInputBufferPtr
 xmlParserInputBufferCreateFilename (const char *URI,
                                                 xmlCharEncoding enc);
 xmlParserInputBufferPtr
 xmlParserInputBufferCreateFile (FILE *file,
                                                 xmlCharEncoding enc);
 xmlParserInputBufferPtr
 xmlParserInputBufferCreateFd (int fd,
                                          xmlCharEncoding enc);
 xmlParserInputBufferPtr
 xmlParserInputBufferCreateMem (const char *mem, int size,
                                          xmlCharEncoding enc);
 xmlParserInputBufferPtr
 xmlParserInputBufferCreateStatic (const char *mem, int size,
                                          xmlCharEncoding enc);
 xmlParserInputBufferPtr
 xmlParserInputBufferCreateIO (xmlInputReadCallback ioread,
       xmlInputCloseCallback ioclose,
       void *ioctx,
                                          xmlCharEncoding enc);
 int
 xmlParserInputBufferRead (xmlParserInputBufferPtr in,
       int len);
 int
 xmlParserInputBufferGrow (xmlParserInputBufferPtr in,
       int len);
 int
 xmlParserInputBufferPush (xmlParserInputBufferPtr in,
       int len,
       const char *buf);
 void
 xmlFreeParserInputBuffer (xmlParserInputBufferPtr in);
 char *
 xmlParserGetDirectory (const char *filename);

 int
 xmlRegisterInputCallbacks (xmlInputMatchCallback matchFunc,
       xmlInputOpenCallback openFunc,
       xmlInputReadCallback readFunc,
       xmlInputCloseCallback closeFunc);

xmlParserInputBufferPtr
 __xmlParserInputBufferCreateFilename(const char *URI,
      xmlCharEncoding enc);





 void
 xmlCleanupOutputCallbacks (void);
 void
 xmlRegisterDefaultOutputCallbacks(void);
 xmlOutputBufferPtr
 xmlAllocOutputBuffer (xmlCharEncodingHandlerPtr encoder);

 xmlOutputBufferPtr
 xmlOutputBufferCreateFilename (const char *URI,
      xmlCharEncodingHandlerPtr encoder,
      int compression);

 xmlOutputBufferPtr
 xmlOutputBufferCreateFile (FILE *file,
      xmlCharEncodingHandlerPtr encoder);

 xmlOutputBufferPtr
 xmlOutputBufferCreateBuffer (xmlBufferPtr buffer,
      xmlCharEncodingHandlerPtr encoder);

 xmlOutputBufferPtr
 xmlOutputBufferCreateFd (int fd,
      xmlCharEncodingHandlerPtr encoder);

 xmlOutputBufferPtr
 xmlOutputBufferCreateIO (xmlOutputWriteCallback iowrite,
      xmlOutputCloseCallback ioclose,
      void *ioctx,
      xmlCharEncodingHandlerPtr encoder);


 const xmlChar *
        xmlOutputBufferGetContent (xmlOutputBufferPtr out);
 size_t
        xmlOutputBufferGetSize (xmlOutputBufferPtr out);

 int
 xmlOutputBufferWrite (xmlOutputBufferPtr out,
      int len,
      const char *buf);
 int
 xmlOutputBufferWriteString (xmlOutputBufferPtr out,
      const char *str);
 int
 xmlOutputBufferWriteEscape (xmlOutputBufferPtr out,
      const xmlChar *str,
      xmlCharEncodingOutputFunc escaping);

 int
 xmlOutputBufferFlush (xmlOutputBufferPtr out);
 int
 xmlOutputBufferClose (xmlOutputBufferPtr out);

 int
 xmlRegisterOutputCallbacks (xmlOutputMatchCallback matchFunc,
      xmlOutputOpenCallback openFunc,
      xmlOutputWriteCallback writeFunc,
      xmlOutputCloseCallback closeFunc);

xmlOutputBufferPtr
 __xmlOutputBufferCreateFilename(const char *URI,
                              xmlCharEncodingHandlerPtr encoder,
                              int compression);



 void
 xmlRegisterHTTPPostCallbacks (void );




 xmlParserInputPtr
 xmlCheckHTTPInput (xmlParserCtxtPtr ctxt,
      xmlParserInputPtr ret);




 xmlParserInputPtr
 xmlNoNetExternalEntityLoader (const char *URL,
      const char *ID,
      xmlParserCtxtPtr ctxt);





 xmlChar *
 xmlNormalizeWindowsPath (const xmlChar *path);

 int
 xmlCheckFilename (const char *path);



 int
 xmlFileMatch (const char *filename);
 void *
 xmlFileOpen (const char *filename);
 int
 xmlFileRead (void * context,
      char * buffer,
      int len);
 int
 xmlFileClose (void * context);





 int
 xmlIOHTTPMatch (const char *filename);
 void *
 xmlIOHTTPOpen (const char *filename);

 void *
 xmlIOHTTPOpenW (const char * post_uri,
      int compression );

 int
 xmlIOHTTPRead (void * context,
      char * buffer,
      int len);
 int
 xmlIOHTTPClose (void * context);






 int
 xmlIOFTPMatch (const char *filename);
 void *
 xmlIOFTPOpen (const char *filename);
 int
 xmlIOFTPRead (void * context,
      char * buffer,
      int len);
 int
 xmlIOFTPClose (void * context);
