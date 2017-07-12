# 1 "xmlmodule.h"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 32 "<command-line>" 2
# 1 "xmlmodule.h"
# 14 "xmlmodule.h"
# 1 "../libxml/xmlversion.h" 1
# 13 "../libxml/xmlversion.h"
# 1 "../libxml/xmlexports.h" 1
# 14 "../libxml/xmlversion.h" 2
# 24 "../libxml/xmlversion.h"
 void xmlCheckVersion(int version);
# 15 "xmlmodule.h" 2
# 27 "xmlmodule.h"
typedef struct _xmlModule xmlModule;
typedef xmlModule *xmlModulePtr;






typedef enum {
    XML_MODULE_LAZY = 1,
    XML_MODULE_LOCAL= 2
} xmlModuleOption;

 xmlModulePtr xmlModuleOpen (const char *filename,
       int options);

 int xmlModuleSymbol (xmlModulePtr module,
       const char* name,
       void **result);

 int xmlModuleClose (xmlModulePtr module);

 int xmlModuleFree (xmlModulePtr module);
