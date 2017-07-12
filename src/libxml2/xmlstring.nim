type
  xmlChar* = cuchar
{.push cdecl, importc.}
proc xmlStrdup*(cur: ptr xmlChar): ptr xmlChar
proc xmlStrndup*(cur: ptr xmlChar; len: cint): ptr xmlChar
proc xmlCharStrndup*(cur: cstring; len: cint): ptr xmlChar
proc xmlCharStrdup*(cur: cstring): ptr xmlChar
proc xmlStrsub*(str: ptr xmlChar; start: cint; len: cint): ptr xmlChar
proc xmlStrchr*(str: ptr xmlChar; val: xmlChar): ptr xmlChar
proc xmlStrstr*(str: ptr xmlChar; val: ptr xmlChar): ptr xmlChar
proc xmlStrcasestr*(str: ptr xmlChar; val: ptr xmlChar): ptr xmlChar
proc xmlStrcmp*(str1: ptr xmlChar; str2: ptr xmlChar): cint
proc xmlStrncmp*(str1: ptr xmlChar; str2: ptr xmlChar; len: cint): cint
proc xmlStrcasecmp*(str1: ptr xmlChar; str2: ptr xmlChar): cint
proc xmlStrncasecmp*(str1: ptr xmlChar; str2: ptr xmlChar; len: cint): cint
proc xmlStrEqual*(str1: ptr xmlChar; str2: ptr xmlChar): cint
proc xmlStrQEqual*(pref: ptr xmlChar; name: ptr xmlChar; str: ptr xmlChar): cint
proc xmlStrlen*(str: ptr xmlChar): cint
proc xmlStrcat*(cur: ptr xmlChar; add: ptr xmlChar): ptr xmlChar
proc xmlStrncat*(cur: ptr xmlChar; add: ptr xmlChar; len: cint): ptr xmlChar
proc xmlStrncatNew*(str1: ptr xmlChar; str2: ptr xmlChar; len: cint): ptr xmlChar
proc xmlStrPrintf*(buf: ptr xmlChar; len: cint; msg: cstring): cint {.varargs.}
#proc xmlStrVPrintf*(buf: ptr xmlChar; len: cint; msg: cstring; ap: va_list): cint
proc xmlGetUTF8Char*(utf: ptr cuchar; len: ptr cint): cint
proc xmlCheckUTF8*(utf: ptr cuchar): cint
proc xmlUTF8Strsize*(utf: ptr xmlChar; len: cint): cint
proc xmlUTF8Strndup*(utf: ptr xmlChar; len: cint): ptr xmlChar
proc xmlUTF8Strpos*(utf: ptr xmlChar; pos: cint): ptr xmlChar
proc xmlUTF8Strloc*(utf: ptr xmlChar; utfchar: ptr xmlChar): cint
proc xmlUTF8Strsub*(utf: ptr xmlChar; start: cint; len: cint): ptr xmlChar
proc xmlUTF8Strlen*(utf: ptr xmlChar): cint
proc xmlUTF8Size*(utf: ptr xmlChar): cint
proc xmlUTF8Charcmp*(utf1: ptr xmlChar; utf2: ptr xmlChar): cint
