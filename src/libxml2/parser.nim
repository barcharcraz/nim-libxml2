import xmlstring
type
  xmlParserInputDeallocate* = proc (str: ptr xmlChar)
  p_xml_ParserInput* {.bycopy.} = object
    buf*: xmlParserInputBufferPtr
    filename*: cstring
    directory*: cstring
    base*: ptr xmlChar
    cur*: ptr xmlChar
    `end`*: ptr xmlChar
    length*: cint
    line*: cint
    col*: cint
    consumed*: culong
    free*: xmlParserInputDeallocate
    encoding*: ptr xmlChar
    version*: ptr xmlChar
    standalone*: cint
    id*: cint

  xmlParserNodeInfo* = p_xml_ParserNodeInfo
  xmlParserNodeInfoPtr* = ptr xmlParserNodeInfo
  p_xml_ParserNodeInfo* {.bycopy.} = object
    node*: ptr p_xml_Node
    begin_pos*: culong
    begin_line*: culong
    end_pos*: culong
    end_line*: culong

  xmlParserNodeInfoSeq* = p_xml_ParserNodeInfoSeq
  xmlParserNodeInfoSeqPtr* = ptr xmlParserNodeInfoSeq
  p_xml_ParserNodeInfoSeq* {.bycopy.} = object
    maximum*: culong
    length*: culong
    buffer*: ptr xmlParserNodeInfo

  xmlParserInputState* = enum
    XML_PARSER_EOF = - 1, XML_PARSER_START = 0, XML_PARSER_MISC, XML_PARSER_PI,
    XML_PARSER_DTD, XML_PARSER_PROLOG, XML_PARSER_COMMENT, XML_PARSER_START_TAG,
    XML_PARSER_CONTENT, XML_PARSER_CDATA_SECTION, XML_PARSER_END_TAG,
    XML_PARSER_ENTITY_DECL, XML_PARSER_ENTITY_VALUE, XML_PARSER_ATTRIBUTE_VALUE,
    XML_PARSER_SYSTEM_LITERAL, XML_PARSER_EPILOG, XML_PARSER_IGNORE,
    XML_PARSER_PUBLIC_LITERAL


type
  xmlParserMode* = enum
    XML_PARSE_UNKNOWN = 0, XML_PARSE_DOM = 1, XML_PARSE_SAX = 2, XML_PARSE_PUSH_DOM = 3,
    XML_PARSE_PUSH_SAX = 4, XML_PARSE_READER = 5


type
  p_xml_ParserCtxt* {.bycopy.} = object
    sax*: ptr p_xml_SAXHandler
    userData*: pointer
    myDoc*: xmlDocPtr
    wellFormed*: cint
    replaceEntities*: cint
    version*: ptr xmlChar
    encoding*: ptr xmlChar
    standalone*: cint
    html*: cint
    input*: xmlParserInputPtr
    inputNr*: cint
    inputMax*: cint
    inputTab*: ptr xmlParserInputPtr
    node*: xmlNodePtr
    nodeNr*: cint
    nodeMax*: cint
    nodeTab*: ptr xmlNodePtr
    record_info*: cint
    node_seq*: xmlParserNodeInfoSeq
    errNo*: cint
    hasExternalSubset*: cint
    hasPErefs*: cint
    external*: cint
    valid*: cint
    validate*: cint
    vctxt*: xmlValidCtxt
    instate*: xmlParserInputState
    token*: cint
    directory*: cstring
    name*: ptr xmlChar
    nameNr*: cint
    nameMax*: cint
    nameTab*: ptr ptr xmlChar
    nbChars*: clong
    checkIndex*: clong
    keepBlanks*: cint
    disableSAX*: cint
    inSubset*: cint
    intSubName*: ptr xmlChar
    extSubURI*: ptr xmlChar
    extSubSystem*: ptr xmlChar
    space*: ptr cint
    spaceNr*: cint
    spaceMax*: cint
    spaceTab*: ptr cint
    depth*: cint
    entity*: xmlParserInputPtr
    charset*: cint
    nodelen*: cint
    nodemem*: cint
    pedantic*: cint
    _private*: pointer
    loadsubset*: cint
    linenumbers*: cint
    catalogs*: pointer
    recovery*: cint
    progressive*: cint
    dict*: xmlDictPtr
    atts*: ptr ptr xmlChar
    maxatts*: cint
    docdict*: cint
    str_xml*: ptr xmlChar
    str_xmlns*: ptr xmlChar
    str_xml_ns*: ptr xmlChar
    sax2*: cint
    nsNr*: cint
    nsMax*: cint
    nsTab*: ptr ptr xmlChar
    attallocs*: ptr cint
    pushTab*: ptr pointer
    attsDefault*: xmlHashTablePtr
    attsSpecial*: xmlHashTablePtr
    nsWellFormed*: cint
    options*: cint
    dictNames*: cint
    freeElemsNr*: cint
    freeElems*: xmlNodePtr
    freeAttrsNr*: cint
    freeAttrs*: xmlAttrPtr
    lastError*: xmlError
    parseMode*: xmlParserMode
    nbentities*: culong
    sizeentities*: culong
    nodeInfo*: ptr xmlParserNodeInfo
    nodeInfoNr*: cint
    nodeInfoMax*: cint
    nodeInfoTab*: ptr xmlParserNodeInfo
    input_id*: cint
    sizeentcopy*: culong

  p_xml_SAXLocator* {.bycopy.} = object
    getPublicId*: proc (ctx: pointer): ptr xmlChar
    getSystemId*: proc (ctx: pointer): ptr xmlChar
    getLineNumber*: proc (ctx: pointer): cint
    getColumnNumber*: proc (ctx: pointer): cint

  resolveEntitySAXFunc* = proc (ctx: pointer; publicId: ptr xmlChar;
                             systemId: ptr xmlChar): xmlParserInputPtr
  internalSubsetSAXFunc* = proc (ctx: pointer; name: ptr xmlChar;
                              ExternalID: ptr xmlChar; SystemID: ptr xmlChar)
  externalSubsetSAXFunc* = proc (ctx: pointer; name: ptr xmlChar;
                              ExternalID: ptr xmlChar; SystemID: ptr xmlChar)
  getEntitySAXFunc* = proc (ctx: pointer; name: ptr xmlChar): xmlEntityPtr
  getParameterEntitySAXFunc* = proc (ctx: pointer; name: ptr xmlChar): xmlEntityPtr
  entityDeclSAXFunc* = proc (ctx: pointer; name: ptr xmlChar; `type`: cint;
                          publicId: ptr xmlChar; systemId: ptr xmlChar;
                          content: ptr xmlChar)
  notationDeclSAXFunc* = proc (ctx: pointer; name: ptr xmlChar; publicId: ptr xmlChar;
                            systemId: ptr xmlChar)
  attributeDeclSAXFunc* = proc (ctx: pointer; elem: ptr xmlChar; fullname: ptr xmlChar;
                             `type`: cint; def: cint; defaultValue: ptr xmlChar;
                             tree: xmlEnumerationPtr)
  elementDeclSAXFunc* = proc (ctx: pointer; name: ptr xmlChar; `type`: cint;
                           content: xmlElementContentPtr)
  unparsedEntityDeclSAXFunc* = proc (ctx: pointer; name: ptr xmlChar;
                                  publicId: ptr xmlChar; systemId: ptr xmlChar;
                                  notationName: ptr xmlChar)
  setDocumentLocatorSAXFunc* = proc (ctx: pointer; loc: xmlSAXLocatorPtr)
  startDocumentSAXFunc* = proc (ctx: pointer)
  endDocumentSAXFunc* = proc (ctx: pointer)
  startElementSAXFunc* = proc (ctx: pointer; name: ptr xmlChar; atts: ptr ptr xmlChar)
  endElementSAXFunc* = proc (ctx: pointer; name: ptr xmlChar)
  attributeSAXFunc* = proc (ctx: pointer; name: ptr xmlChar; value: ptr xmlChar)
  referenceSAXFunc* = proc (ctx: pointer; name: ptr xmlChar)
  charactersSAXFunc* = proc (ctx: pointer; ch: ptr xmlChar; len: cint)
  ignorableWhitespaceSAXFunc* = proc (ctx: pointer; ch: ptr xmlChar; len: cint)
  processingInstructionSAXFunc* = proc (ctx: pointer; target: ptr xmlChar;
                                     data: ptr xmlChar)
  commentSAXFunc* = proc (ctx: pointer; value: ptr xmlChar)
  cdataBlockSAXFunc* = proc (ctx: pointer; value: ptr xmlChar; len: cint)
  warningSAXFunc* = proc (ctx: pointer; msg: cstring) {.varargs.}
  errorSAXFunc* = proc (ctx: pointer; msg: cstring) {.varargs.}
  fatalErrorSAXFunc* = proc (ctx: pointer; msg: cstring) {.varargs.}
  isStandaloneSAXFunc* = proc (ctx: pointer): cint
  hasInternalSubsetSAXFunc* = proc (ctx: pointer): cint
  hasExternalSubsetSAXFunc* = proc (ctx: pointer): cint
  startElementNsSAX2Func* = proc (ctx: pointer; localname: ptr xmlChar;
                               prefix: ptr xmlChar; URI: ptr xmlChar;
                               nb_namespaces: cint; namespaces: ptr ptr xmlChar;
                               nb_attributes: cint; nb_defaulted: cint;
                               attributes: ptr ptr xmlChar)
  endElementNsSAX2Func* = proc (ctx: pointer; localname: ptr xmlChar;
                             prefix: ptr xmlChar; URI: ptr xmlChar)
  p_xml_SAXHandler* {.bycopy.} = object
    internalSubset*: internalSubsetSAXFunc
    isStandalone*: isStandaloneSAXFunc
    hasInternalSubset*: hasInternalSubsetSAXFunc
    hasExternalSubset*: hasExternalSubsetSAXFunc
    resolveEntity*: resolveEntitySAXFunc
    getEntity*: getEntitySAXFunc
    entityDecl*: entityDeclSAXFunc
    notationDecl*: notationDeclSAXFunc
    attributeDecl*: attributeDeclSAXFunc
    elementDecl*: elementDeclSAXFunc
    unparsedEntityDecl*: unparsedEntityDeclSAXFunc
    setDocumentLocator*: setDocumentLocatorSAXFunc
    startDocument*: startDocumentSAXFunc
    endDocument*: endDocumentSAXFunc
    startElement*: startElementSAXFunc
    endElement*: endElementSAXFunc
    reference*: referenceSAXFunc
    characters*: charactersSAXFunc
    ignorableWhitespace*: ignorableWhitespaceSAXFunc
    processingInstruction*: processingInstructionSAXFunc
    comment*: commentSAXFunc
    warning*: warningSAXFunc
    error*: errorSAXFunc
    fatalError*: fatalErrorSAXFunc
    getParameterEntity*: getParameterEntitySAXFunc
    cdataBlock*: cdataBlockSAXFunc
    externalSubset*: externalSubsetSAXFunc
    initialized*: cuint
    _private*: pointer
    startElementNs*: startElementNsSAX2Func
    endElementNs*: endElementNsSAX2Func
    serror*: xmlStructuredErrorFunc

  xmlSAXHandlerV1* = p_xml_SAXHandlerV1
  xmlSAXHandlerV1Ptr* = ptr xmlSAXHandlerV1
  p_xml_SAXHandlerV1* {.bycopy.} = object
    internalSubset*: internalSubsetSAXFunc
    isStandalone*: isStandaloneSAXFunc
    hasInternalSubset*: hasInternalSubsetSAXFunc
    hasExternalSubset*: hasExternalSubsetSAXFunc
    resolveEntity*: resolveEntitySAXFunc
    getEntity*: getEntitySAXFunc
    entityDecl*: entityDeclSAXFunc
    notationDecl*: notationDeclSAXFunc
    attributeDecl*: attributeDeclSAXFunc
    elementDecl*: elementDeclSAXFunc
    unparsedEntityDecl*: unparsedEntityDeclSAXFunc
    setDocumentLocator*: setDocumentLocatorSAXFunc
    startDocument*: startDocumentSAXFunc
    endDocument*: endDocumentSAXFunc
    startElement*: startElementSAXFunc
    endElement*: endElementSAXFunc
    reference*: referenceSAXFunc
    characters*: charactersSAXFunc
    ignorableWhitespace*: ignorableWhitespaceSAXFunc
    processingInstruction*: processingInstructionSAXFunc
    comment*: commentSAXFunc
    warning*: warningSAXFunc
    error*: errorSAXFunc
    fatalError*: fatalErrorSAXFunc
    getParameterEntity*: getParameterEntitySAXFunc
    cdataBlock*: cdataBlockSAXFunc
    externalSubset*: externalSubsetSAXFunc
    initialized*: cuint

  xmlExternalEntityLoader* = proc (URL: cstring; ID: cstring; context: xmlParserCtxtPtr): xmlParserInputPtr

proc xmlInitParser*()
proc xmlCleanupParser*()
proc xmlParserInputRead*(`in`: xmlParserInputPtr; len: cint): cint
proc xmlParserInputGrow*(`in`: xmlParserInputPtr; len: cint): cint
proc xmlParseDoc*(cur: ptr xmlChar): xmlDocPtr
proc xmlParseFile*(filename: cstring): xmlDocPtr
proc xmlParseMemory*(buffer: cstring; size: cint): xmlDocPtr
proc xmlSubstituteEntitiesDefault*(val: cint): cint
proc xmlKeepBlanksDefault*(val: cint): cint
proc xmlStopParser*(ctxt: xmlParserCtxtPtr)
proc xmlPedanticParserDefault*(val: cint): cint
proc xmlLineNumbersDefault*(val: cint): cint
proc xmlRecoverDoc*(cur: ptr xmlChar): xmlDocPtr
proc xmlRecoverMemory*(buffer: cstring; size: cint): xmlDocPtr
proc xmlRecoverFile*(filename: cstring): xmlDocPtr
proc xmlParseDocument*(ctxt: xmlParserCtxtPtr): cint
proc xmlParseExtParsedEnt*(ctxt: xmlParserCtxtPtr): cint
proc xmlSAXUserParseFile*(sax: xmlSAXHandlerPtr; user_data: pointer;
                         filename: cstring): cint
proc xmlSAXUserParseMemory*(sax: xmlSAXHandlerPtr; user_data: pointer;
                           buffer: cstring; size: cint): cint
proc xmlSAXParseDoc*(sax: xmlSAXHandlerPtr; cur: ptr xmlChar; recovery: cint): xmlDocPtr
proc xmlSAXParseMemory*(sax: xmlSAXHandlerPtr; buffer: cstring; size: cint;
                       recovery: cint): xmlDocPtr
proc xmlSAXParseMemoryWithData*(sax: xmlSAXHandlerPtr; buffer: cstring; size: cint;
                               recovery: cint; data: pointer): xmlDocPtr
proc xmlSAXParseFile*(sax: xmlSAXHandlerPtr; filename: cstring; recovery: cint): xmlDocPtr
proc xmlSAXParseFileWithData*(sax: xmlSAXHandlerPtr; filename: cstring;
                             recovery: cint; data: pointer): xmlDocPtr
proc xmlSAXParseEntity*(sax: xmlSAXHandlerPtr; filename: cstring): xmlDocPtr
proc xmlParseEntity*(filename: cstring): xmlDocPtr
proc xmlSAXParseDTD*(sax: xmlSAXHandlerPtr; ExternalID: ptr xmlChar;
                    SystemID: ptr xmlChar): xmlDtdPtr
proc xmlParseDTD*(ExternalID: ptr xmlChar; SystemID: ptr xmlChar): xmlDtdPtr
proc xmlIOParseDTD*(sax: xmlSAXHandlerPtr; input: xmlParserInputBufferPtr;
                   enc: xmlCharEncoding): xmlDtdPtr
proc xmlParseBalancedChunkMemory*(doc: xmlDocPtr; sax: xmlSAXHandlerPtr;
                                 user_data: pointer; depth: cint;
                                 string: ptr xmlChar; lst: ptr xmlNodePtr): cint
proc xmlParseInNodeContext*(node: xmlNodePtr; data: cstring; datalen: cint;
                           options: cint; lst: ptr xmlNodePtr): xmlParserErrors
proc xmlParseBalancedChunkMemoryRecover*(doc: xmlDocPtr; sax: xmlSAXHandlerPtr;
                                        user_data: pointer; depth: cint;
                                        string: ptr xmlChar; lst: ptr xmlNodePtr;
                                        recover: cint): cint
proc xmlParseExternalEntity*(doc: xmlDocPtr; sax: xmlSAXHandlerPtr;
                            user_data: pointer; depth: cint; URL: ptr xmlChar;
                            ID: ptr xmlChar; lst: ptr xmlNodePtr): cint
proc xmlParseCtxtExternalEntity*(ctx: xmlParserCtxtPtr; URL: ptr xmlChar;
                                ID: ptr xmlChar; lst: ptr xmlNodePtr): cint
proc xmlNewParserCtxt*(): xmlParserCtxtPtr
proc xmlInitParserCtxt*(ctxt: xmlParserCtxtPtr): cint
proc xmlClearParserCtxt*(ctxt: xmlParserCtxtPtr)
proc xmlFreeParserCtxt*(ctxt: xmlParserCtxtPtr)
proc xmlSetupParserForBuffer*(ctxt: xmlParserCtxtPtr; buffer: ptr xmlChar;
                             filename: cstring)
proc xmlCreateDocParserCtxt*(cur: ptr xmlChar): xmlParserCtxtPtr
proc xmlGetFeaturesList*(len: ptr cint; result: cstringArray): cint
proc xmlGetFeature*(ctxt: xmlParserCtxtPtr; name: cstring; result: pointer): cint
proc xmlSetFeature*(ctxt: xmlParserCtxtPtr; name: cstring; value: pointer): cint
proc xmlCreatePushParserCtxt*(sax: xmlSAXHandlerPtr; user_data: pointer;
                             chunk: cstring; size: cint; filename: cstring): xmlParserCtxtPtr
proc xmlParseChunk*(ctxt: xmlParserCtxtPtr; chunk: cstring; size: cint; terminate: cint): cint
proc xmlCreateIOParserCtxt*(sax: xmlSAXHandlerPtr; user_data: pointer;
                           ioread: xmlInputReadCallback;
                           ioclose: xmlInputCloseCallback; ioctx: pointer;
                           enc: xmlCharEncoding): xmlParserCtxtPtr
proc xmlNewIOInputStream*(ctxt: xmlParserCtxtPtr; input: xmlParserInputBufferPtr;
                         enc: xmlCharEncoding): xmlParserInputPtr
proc xmlParserFindNodeInfo*(ctxt: xmlParserCtxtPtr; node: xmlNodePtr): ptr xmlParserNodeInfo
proc xmlInitNodeInfoSeq*(seq: xmlParserNodeInfoSeqPtr)
proc xmlClearNodeInfoSeq*(seq: xmlParserNodeInfoSeqPtr)
proc xmlParserFindNodeInfoIndex*(seq: xmlParserNodeInfoSeqPtr; node: xmlNodePtr): culong
proc xmlParserAddNodeInfo*(ctxt: xmlParserCtxtPtr; info: xmlParserNodeInfoPtr)
proc xmlSetExternalEntityLoader*(f: xmlExternalEntityLoader)
proc xmlGetExternalEntityLoader*(): xmlExternalEntityLoader
proc xmlLoadExternalEntity*(URL: cstring; ID: cstring; ctxt: xmlParserCtxtPtr): xmlParserInputPtr
proc xmlByteConsumed*(ctxt: xmlParserCtxtPtr): clong
type
  xmlParserOption* = enum
    XML_PARSE_RECOVER = 1 shl 0, XML_PARSE_NOENT = 1 shl 1, XML_PARSE_DTDLOAD = 1 shl 2,
    XML_PARSE_DTDATTR = 1 shl 3, XML_PARSE_DTDVALID = 1 shl 4,
    XML_PARSE_NOERROR = 1 shl 5, XML_PARSE_NOWARNING = 1 shl 6,
    XML_PARSE_PEDANTIC = 1 shl 7, XML_PARSE_NOBLANKS = 1 shl 8, XML_PARSE_SAX1 = 1 shl 9,
    XML_PARSE_XINCLUDE = 1 shl 10, XML_PARSE_NONET = 1 shl 11,
    XML_PARSE_NODICT = 1 shl 12, XML_PARSE_NSCLEAN = 1 shl 13,
    XML_PARSE_NOCDATA = 1 shl 14, XML_PARSE_NOXINCNODE = 1 shl 15,
    XML_PARSE_COMPACT = 1 shl 16, XML_PARSE_OLD10 = 1 shl 17,
    XML_PARSE_NOBASEFIX = 1 shl 18, XML_PARSE_HUGE = 1 shl 19,
    XML_PARSE_OLDSAX = 1 shl 20, XML_PARSE_IGNORE_ENC = 1 shl 21,
    XML_PARSE_BIG_LINES = 1 shl 22


proc xmlCtxtReset*(ctxt: xmlParserCtxtPtr)
proc xmlCtxtResetPush*(ctxt: xmlParserCtxtPtr; chunk: cstring; size: cint;
                      filename: cstring; encoding: cstring): cint
proc xmlCtxtUseOptions*(ctxt: xmlParserCtxtPtr; options: cint): cint
proc xmlReadDoc*(cur: ptr xmlChar; URL: cstring; encoding: cstring; options: cint): xmlDocPtr
proc xmlReadFile*(URL: cstring; encoding: cstring; options: cint): xmlDocPtr
proc xmlReadMemory*(buffer: cstring; size: cint; URL: cstring; encoding: cstring;
                   options: cint): xmlDocPtr
proc xmlReadFd*(fd: cint; URL: cstring; encoding: cstring; options: cint): xmlDocPtr
proc xmlReadIO*(ioread: xmlInputReadCallback; ioclose: xmlInputCloseCallback;
               ioctx: pointer; URL: cstring; encoding: cstring; options: cint): xmlDocPtr
proc xmlCtxtReadDoc*(ctxt: xmlParserCtxtPtr; cur: ptr xmlChar; URL: cstring;
                    encoding: cstring; options: cint): xmlDocPtr
proc xmlCtxtReadFile*(ctxt: xmlParserCtxtPtr; filename: cstring; encoding: cstring;
                     options: cint): xmlDocPtr
proc xmlCtxtReadMemory*(ctxt: xmlParserCtxtPtr; buffer: cstring; size: cint;
                       URL: cstring; encoding: cstring; options: cint): xmlDocPtr
proc xmlCtxtReadFd*(ctxt: xmlParserCtxtPtr; fd: cint; URL: cstring; encoding: cstring;
                   options: cint): xmlDocPtr
proc xmlCtxtReadIO*(ctxt: xmlParserCtxtPtr; ioread: xmlInputReadCallback;
                   ioclose: xmlInputCloseCallback; ioctx: pointer; URL: cstring;
                   encoding: cstring; options: cint): xmlDocPtr
type
  xmlFeature* = enum
    XML_WITH_THREAD = 1, XML_WITH_TREE = 2, XML_WITH_OUTPUT = 3, XML_WITH_PUSH = 4,
    XML_WITH_READER = 5, XML_WITH_PATTERN = 6, XML_WITH_WRITER = 7, XML_WITH_SAX1 = 8,
    XML_WITH_FTP = 9, XML_WITH_HTTP = 10, XML_WITH_VALID = 11, XML_WITH_HTML = 12,
    XML_WITH_LEGACY = 13, XML_WITH_C14N = 14, XML_WITH_CATALOG = 15, XML_WITH_XPATH = 16,
    XML_WITH_XPTR = 17, XML_WITH_XINCLUDE = 18, XML_WITH_ICONV = 19,
    XML_WITH_ISO8859X = 20, XML_WITH_UNICODE = 21, XML_WITH_REGEXP = 22,
    XML_WITH_AUTOMATA = 23, XML_WITH_EXPR = 24, XML_WITH_SCHEMAS = 25,
    XML_WITH_SCHEMATRON = 26, XML_WITH_MODULES = 27, XML_WITH_DEBUG = 28,
    XML_WITH_DEBUG_MEM = 29, XML_WITH_DEBUG_RUN = 30, XML_WITH_ZLIB = 31,
    XML_WITH_ICU = 32, XML_WITH_LZMA = 33, XML_WITH_NONE = 99999


proc xmlHasFeature*(feature: xmlFeature): cint
