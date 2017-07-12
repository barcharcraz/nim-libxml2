# 1 "xmlstring.h"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 32 "<command-line>" 2
# 1 "xmlstring.h"
# 14 "xmlstring.h"
# 1 "/usr/lib/gcc/x86_64-pc-linux-gnu/7.1.1/include/stdarg.h" 1 3 4
# 40 "/usr/lib/gcc/x86_64-pc-linux-gnu/7.1.1/include/stdarg.h" 3 4

# 40 "/usr/lib/gcc/x86_64-pc-linux-gnu/7.1.1/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 99 "/usr/lib/gcc/x86_64-pc-linux-gnu/7.1.1/include/stdarg.h" 3 4
typedef __gnuc_va_list va_list;
# 15 "xmlstring.h" 2
# 1 "../libxml/xmlversion.h" 1
# 13 "../libxml/xmlversion.h"
# 1 "../libxml/xmlexports.h" 1
# 14 "../libxml/xmlversion.h" 2
# 24 "../libxml/xmlversion.h"
 
# 24 "../libxml/xmlversion.h"
         void xmlCheckVersion(int version);
# 16 "xmlstring.h" 2
# 28 "xmlstring.h"
typedef unsigned char xmlChar;
# 40 "xmlstring.h"
 xmlChar *
                xmlStrdup (const xmlChar *cur);
 xmlChar *
                xmlStrndup (const xmlChar *cur,
                                         int len);
 xmlChar *
                xmlCharStrndup (const char *cur,
                                         int len);
 xmlChar *
                xmlCharStrdup (const char *cur);
 xmlChar *
                xmlStrsub (const xmlChar *str,
                                         int start,
                                         int len);
 const xmlChar *
                xmlStrchr (const xmlChar *str,
                                         xmlChar val);
 const xmlChar *
                xmlStrstr (const xmlChar *str,
                                         const xmlChar *val);
 const xmlChar *
                xmlStrcasestr (const xmlChar *str,
                                         const xmlChar *val);
 int
                xmlStrcmp (const xmlChar *str1,
                                         const xmlChar *str2);
 int
                xmlStrncmp (const xmlChar *str1,
                                         const xmlChar *str2,
                                         int len);
 int
                xmlStrcasecmp (const xmlChar *str1,
                                         const xmlChar *str2);
 int
                xmlStrncasecmp (const xmlChar *str1,
                                         const xmlChar *str2,
                                         int len);
 int
                xmlStrEqual (const xmlChar *str1,
                                         const xmlChar *str2);
 int
                xmlStrQEqual (const xmlChar *pref,
                                         const xmlChar *name,
                                         const xmlChar *str);
 int
                xmlStrlen (const xmlChar *str);
 xmlChar *
                xmlStrcat (xmlChar *cur,
                                         const xmlChar *add);
 xmlChar *
                xmlStrncat (xmlChar *cur,
                                         const xmlChar *add,
                                         int len);
 xmlChar *
                xmlStrncatNew (const xmlChar *str1,
                                         const xmlChar *str2,
                                         int len);
 int
                xmlStrPrintf (xmlChar *buf,
                                         int len,
                                         const char *msg,
                                         ...) __attribute__((__format__(__printf__,3,4)));
 int
                xmlStrVPrintf (xmlChar *buf,
                                         int len,
                                         const char *msg,
                                         va_list ap) __attribute__((__format__(__printf__,3,0)));

 int
        xmlGetUTF8Char (const unsigned char *utf,
                                         int *len);
 int
        xmlCheckUTF8 (const unsigned char *utf);
 int
        xmlUTF8Strsize (const xmlChar *utf,
                                         int len);
 xmlChar *
        xmlUTF8Strndup (const xmlChar *utf,
                                         int len);
 const xmlChar *
        xmlUTF8Strpos (const xmlChar *utf,
                                         int pos);
 int
        xmlUTF8Strloc (const xmlChar *utf,
                                         const xmlChar *utfchar);
 xmlChar *
        xmlUTF8Strsub (const xmlChar *utf,
                                         int start,
                                         int len);
 int
        xmlUTF8Strlen (const xmlChar *utf);
 int
        xmlUTF8Size (const xmlChar *utf);
 int
        xmlUTF8Charcmp (const xmlChar *utf1,
                                         const xmlChar *utf2);
