type
  xmlInputMatchCallback* = proc (filename: cstring): cint
  xmlInputOpenCallback* = proc (filename: cstring): pointer
  xmlInputReadCallback* = proc (context: pointer; buffer: cstring; len: cint): cint
  xmlInputCloseCallback* = proc (context: pointer): cint
  xmlOutputMatchCallback* = proc (filename: cstring): cint
  xmlOutputOpenCallback* = proc (filename: cstring): pointer
  xmlOutputWriteCallback* = proc (context: pointer; buffer: cstring; len: cint): cint
  xmlOutputCloseCallback* = proc (context: pointer): cint
  p_xml_ParserInputBuffer* {.bycopy.} = object
    context*: pointer
    readcallback*: xmlInputReadCallback
    closecallback*: xmlInputCloseCallback
    encoder*: xmlCharEncodingHandlerPtr
    buffer*: xmlBufPtr
    raw*: xmlBufPtr
    compressed*: cint
    error*: cint
    rawconsumed*: culong

  p_xml_OutputBuffer* {.bycopy.} = object
    context*: pointer
    writecallback*: xmlOutputWriteCallback
    closecallback*: xmlOutputCloseCallback
    encoder*: xmlCharEncodingHandlerPtr
    buffer*: xmlBufPtr
    conv*: xmlBufPtr
    written*: cint
    error*: cint


proc xmlCleanupInputCallbacks*()
proc xmlPopInputCallbacks*(): cint
proc xmlRegisterDefaultInputCallbacks*()
proc xmlAllocParserInputBuffer*(enc: xmlCharEncoding): xmlParserInputBufferPtr
proc xmlParserInputBufferCreateFilename*(URI: cstring; enc: xmlCharEncoding): xmlParserInputBufferPtr
proc xmlParserInputBufferCreateFile*(file: ptr FILE; enc: xmlCharEncoding): xmlParserInputBufferPtr
proc xmlParserInputBufferCreateFd*(fd: cint; enc: xmlCharEncoding): xmlParserInputBufferPtr
proc xmlParserInputBufferCreateMem*(mem: cstring; size: cint; enc: xmlCharEncoding): xmlParserInputBufferPtr
proc xmlParserInputBufferCreateStatic*(mem: cstring; size: cint; enc: xmlCharEncoding): xmlParserInputBufferPtr
proc xmlParserInputBufferCreateIO*(ioread: xmlInputReadCallback;
                                  ioclose: xmlInputCloseCallback; ioctx: pointer;
                                  enc: xmlCharEncoding): xmlParserInputBufferPtr
proc xmlParserInputBufferRead*(`in`: xmlParserInputBufferPtr; len: cint): cint
proc xmlParserInputBufferGrow*(`in`: xmlParserInputBufferPtr; len: cint): cint
proc xmlParserInputBufferPush*(`in`: xmlParserInputBufferPtr; len: cint; buf: cstring): cint
proc xmlFreeParserInputBuffer*(`in`: xmlParserInputBufferPtr)
proc xmlParserGetDirectory*(filename: cstring): cstring
proc xmlRegisterInputCallbacks*(matchFunc: xmlInputMatchCallback;
                               openFunc: xmlInputOpenCallback;
                               readFunc: xmlInputReadCallback;
                               closeFunc: xmlInputCloseCallback): cint
proc __xmlParserInputBufferCreateFilename*(URI: cstring; enc: xmlCharEncoding): xmlParserInputBufferPtr
proc xmlCleanupOutputCallbacks*()
proc xmlRegisterDefaultOutputCallbacks*()
proc xmlAllocOutputBuffer*(encoder: xmlCharEncodingHandlerPtr): xmlOutputBufferPtr
proc xmlOutputBufferCreateFilename*(URI: cstring;
                                   encoder: xmlCharEncodingHandlerPtr;
                                   compression: cint): xmlOutputBufferPtr
proc xmlOutputBufferCreateFile*(file: ptr FILE; encoder: xmlCharEncodingHandlerPtr): xmlOutputBufferPtr
proc xmlOutputBufferCreateBuffer*(buffer: xmlBufferPtr;
                                 encoder: xmlCharEncodingHandlerPtr): xmlOutputBufferPtr
proc xmlOutputBufferCreateFd*(fd: cint; encoder: xmlCharEncodingHandlerPtr): xmlOutputBufferPtr
proc xmlOutputBufferCreateIO*(iowrite: xmlOutputWriteCallback;
                             ioclose: xmlOutputCloseCallback; ioctx: pointer;
                             encoder: xmlCharEncodingHandlerPtr): xmlOutputBufferPtr
proc xmlOutputBufferGetContent*(`out`: xmlOutputBufferPtr): ptr xmlChar
proc xmlOutputBufferGetSize*(`out`: xmlOutputBufferPtr): csize
proc xmlOutputBufferWrite*(`out`: xmlOutputBufferPtr; len: cint; buf: cstring): cint
proc xmlOutputBufferWriteString*(`out`: xmlOutputBufferPtr; str: cstring): cint
proc xmlOutputBufferWriteEscape*(`out`: xmlOutputBufferPtr; str: ptr xmlChar;
                                escaping: xmlCharEncodingOutputFunc): cint
proc xmlOutputBufferFlush*(`out`: xmlOutputBufferPtr): cint
proc xmlOutputBufferClose*(`out`: xmlOutputBufferPtr): cint
proc xmlRegisterOutputCallbacks*(matchFunc: xmlOutputMatchCallback;
                                openFunc: xmlOutputOpenCallback;
                                writeFunc: xmlOutputWriteCallback;
                                closeFunc: xmlOutputCloseCallback): cint
proc __xmlOutputBufferCreateFilename*(URI: cstring;
                                     encoder: xmlCharEncodingHandlerPtr;
                                     compression: cint): xmlOutputBufferPtr
proc xmlRegisterHTTPPostCallbacks*()
proc xmlCheckHTTPInput*(ctxt: xmlParserCtxtPtr; ret: xmlParserInputPtr): xmlParserInputPtr
proc xmlNoNetExternalEntityLoader*(URL: cstring; ID: cstring; ctxt: xmlParserCtxtPtr): xmlParserInputPtr
proc xmlNormalizeWindowsPath*(path: ptr xmlChar): ptr xmlChar
proc xmlCheckFilename*(path: cstring): cint
proc xmlFileMatch*(filename: cstring): cint
proc xmlFileOpen*(filename: cstring): pointer
proc xmlFileRead*(context: pointer; buffer: cstring; len: cint): cint
proc xmlFileClose*(context: pointer): cint
proc xmlIOHTTPMatch*(filename: cstring): cint
proc xmlIOHTTPOpen*(filename: cstring): pointer
proc xmlIOHTTPOpenW*(post_uri: cstring; compression: cint): pointer
proc xmlIOHTTPRead*(context: pointer; buffer: cstring; len: cint): cint
proc xmlIOHTTPClose*(context: pointer): cint
proc xmlIOFTPMatch*(filename: cstring): cint
proc xmlIOFTPOpen*(filename: cstring): pointer
proc xmlIOFTPRead*(context: pointer; buffer: cstring; len: cint): cint
proc xmlIOFTPClose*(context: pointer): cint