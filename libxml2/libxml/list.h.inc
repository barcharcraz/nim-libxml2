# 1 "list.h"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 32 "<command-line>" 2
# 1 "list.h"
# 14 "list.h"
# 1 "../libxml/xmlversion.h" 1
# 13 "../libxml/xmlversion.h"
# 1 "../libxml/xmlexports.h" 1
# 14 "../libxml/xmlversion.h" 2
# 24 "../libxml/xmlversion.h"
 void xmlCheckVersion(int version);
# 15 "list.h" 2





typedef struct _xmlLink xmlLink;
typedef xmlLink *xmlLinkPtr;

typedef struct _xmlList xmlList;
typedef xmlList *xmlListPtr;







typedef void (*xmlListDeallocator) (xmlLinkPtr lk);
# 42 "list.h"
typedef int (*xmlListDataCompare) (const void *data0, const void *data1);
# 52 "list.h"
typedef int (*xmlListWalker) (const void *data, const void *user);


 xmlListPtr
  xmlListCreate (xmlListDeallocator deallocator,
                                  xmlListDataCompare compare);
 void
  xmlListDelete (xmlListPtr l);


 void *
  xmlListSearch (xmlListPtr l,
      void *data);
 void *
  xmlListReverseSearch (xmlListPtr l,
      void *data);
 int
  xmlListInsert (xmlListPtr l,
      void *data) ;
 int
  xmlListAppend (xmlListPtr l,
      void *data) ;
 int
  xmlListRemoveFirst (xmlListPtr l,
      void *data);
 int
  xmlListRemoveLast (xmlListPtr l,
      void *data);
 int
  xmlListRemoveAll (xmlListPtr l,
      void *data);
 void
  xmlListClear (xmlListPtr l);
 int
  xmlListEmpty (xmlListPtr l);
 xmlLinkPtr
  xmlListFront (xmlListPtr l);
 xmlLinkPtr
  xmlListEnd (xmlListPtr l);
 int
  xmlListSize (xmlListPtr l);

 void
  xmlListPopFront (xmlListPtr l);
 void
  xmlListPopBack (xmlListPtr l);
 int
  xmlListPushFront (xmlListPtr l,
      void *data);
 int
  xmlListPushBack (xmlListPtr l,
      void *data);


 void
  xmlListReverse (xmlListPtr l);
 void
  xmlListSort (xmlListPtr l);
 void
  xmlListWalk (xmlListPtr l,
      xmlListWalker walker,
      const void *user);
 void
  xmlListReverseWalk (xmlListPtr l,
      xmlListWalker walker,
      const void *user);
 void
  xmlListMerge (xmlListPtr l1,
      xmlListPtr l2);
 xmlListPtr
  xmlListDup (const xmlListPtr old);
 int
  xmlListCopy (xmlListPtr cur,
      const xmlListPtr old);

 void *
  xmlLinkGetData (xmlLinkPtr lk);
