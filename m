Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA04440
	for <parisc-linux@puffin.external.hp.com>; Thu, 7 Sep 2000 01:01:56 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 7 Sep 2000 07:02:10 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id SAA29399;
	Thu, 7 Sep 2000 18:01:58 +1100
Date: Thu, 7 Sep 2000 18:01:58 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: binutils@sourceware.cygnus.com
cc: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.21.0009071644240.16907-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Nasty elf orphan section bug.
List-ID: <linux-parisc.vger.kernel.org>

This one's a beauty, resulting in empty orphan output sections with nary a
complaint from the linker.  (I reckon it predates my fiddling with
elf32.em too.  Hi Ian ;-) )

The problem was that the statement list tail pointer was never updated.
If an orphan section happenned to be added such that it's output section
statement was right at the tail of the statement list, then the
next output statement to be added was tacked on to the list at the
same position, effectively snipping off the previous statement.
Fortunately, in practice this didn't happen very often when using the
default linker scripts as they have assorted .debug sections at the tail.

Fixed by the last hunk of the following patch, which addresses a few other
minor issues as well.

ld/ChangeLog
	* emultempl/elf32.em (gld${EMULATION_NAME}_place_orphan): Fix
	broken list handling.  Create __start_SECNAME and __stop_SECNAME
	when no placeholder.  Add some comments.  Test both SEC_CODE and
	SEC_READONLY for hold_text to prevent .rodata orphan poisoning.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.

Index: elf32.em
===================================================================
RCS file: /cvs/src/src/ld/emultempl/elf32.em,v
retrieving revision 1.33
diff -c -p -r1.33 elf32.em
*** elf32.em	2000/09/06 15:28:25	1.33
--- elf32.em	2000/09/07 06:54:05
*************** gld${EMULATION_NAME}_place_orphan (file,
*** 1010,1016 ****
    static struct orphan_save hold_interp;
    static int count = 1;
    struct orphan_save *place;
!   lang_statement_list_type *old = NULL;
    lang_statement_list_type add;
    etree_type *address;
    const char *secname;
--- 1010,1016 ----
    static struct orphan_save hold_interp;
    static int count = 1;
    struct orphan_save *place;
!   lang_statement_list_type *old;
    lang_statement_list_type add;
    etree_type *address;
    const char *secname;
*************** gld${EMULATION_NAME}_place_orphan (file,
*** 1060,1067 ****
  
    if (s->flags & SEC_EXCLUDE)
      return false;
!   else if ((s->flags & SEC_ALLOC) == 0)
!     place = NULL;
    else if ((s->flags & SEC_LOAD) != 0
  	   && strncmp (secname, ".note", 4) == 0
  	   && HAVE_SECTION (hold_interp, ".interp"))
--- 1060,1069 ----
  
    if (s->flags & SEC_EXCLUDE)
      return false;
! 
!   place = NULL;
!   if ((s->flags & SEC_ALLOC) == 0)
!     ;
    else if ((s->flags & SEC_LOAD) != 0
  	   && strncmp (secname, ".note", 4) == 0
  	   && HAVE_SECTION (hold_interp, ".interp"))
*************** gld${EMULATION_NAME}_place_orphan (file,
*** 1076,1090 ****
  	   && (hold_rel.os != NULL
  	       || (hold_rel.os = output_rel_find ()) != NULL))
      place = &hold_rel;
!   else if ((s->flags & SEC_CODE) == 0
! 	   && (s->flags & SEC_READONLY) != 0
  	   && HAVE_SECTION (hold_rodata, ".rodata"))
      place = &hold_rodata;
!   else if ((s->flags & SEC_READONLY) != 0
  	   && hold_text.os != NULL)
      place = &hold_text;
-   else
-     place = NULL;
  
  #undef HAVE_SECTION
  
--- 1078,1089 ----
  	   && (hold_rel.os != NULL
  	       || (hold_rel.os = output_rel_find ()) != NULL))
      place = &hold_rel;
!   else if ((s->flags & (SEC_CODE | SEC_READONLY)) == SEC_READONLY
  	   && HAVE_SECTION (hold_rodata, ".rodata"))
      place = &hold_rodata;
!   else if ((s->flags & (SEC_CODE | SEC_READONLY)) == (SEC_CODE | SEC_READONLY)
  	   && hold_text.os != NULL)
      place = &hold_text;
  
  #undef HAVE_SECTION
  
*************** gld${EMULATION_NAME}_place_orphan (file,
*** 1097,1115 ****
  					      outsecname,
  					      &count);
  
    if (place != NULL)
      {
-       /* Start building a list of statements for this section.  */
-       old = stat_ptr;
        stat_ptr = &add;
        lang_list_init (stat_ptr);
  
        /* If the name of the section is representable in C, then create
  	 symbols to mark the start and the end of the section.  */
        for (ps = outsecname; *ps != '\0'; ps++)
  	if (! isalnum ((unsigned char) *ps) && *ps != '_')
  	  break;
!       if (*ps == '\0' && config.build_constructors)
  	{
  	  char *symname;
  	  etree_type *e_align;
--- 1096,1122 ----
  					      outsecname,
  					      &count);
  
+   /* Start building a list of statements for this section.
+      First save the current statement pointer.  */
+   old = stat_ptr;
+ 
+   /* If we have found an appropriate place for the output section
+      statements for this orphan, add them to our own private list,
+      inserting them later into the global statement list.  */
    if (place != NULL)
      {
        stat_ptr = &add;
        lang_list_init (stat_ptr);
+     }
  
+   if (config.build_constructors)
+     {
        /* If the name of the section is representable in C, then create
  	 symbols to mark the start and the end of the section.  */
        for (ps = outsecname; *ps != '\0'; ps++)
  	if (! isalnum ((unsigned char) *ps) && *ps != '_')
  	  break;
!       if (*ps == '\0')
  	{
  	  char *symname;
  	  etree_type *e_align;
*************** gld${EMULATION_NAME}_place_orphan (file,
*** 1139,1167 ****
      ((bfd_vma) 0, "*default*",
       (struct lang_output_section_phdr_list *) NULL, "*default*");
  
!   if (place != NULL)
      {
!       asection *snew, **pps;
  
!       stat_ptr = &add;
  
!       if (*ps == '\0' && config.build_constructors)
! 	{
! 	  char *symname;
  
! 	  symname = (char *) xmalloc (ps - outsecname + sizeof "__stop_");
! 	  sprintf (symname, "__stop_%s", outsecname);
! 	  lang_add_assignment (exp_assop ('=', symname,
! 					  exp_nameop (NAME, ".")));
! 	}
!       stat_ptr = old;
  
        snew = os->bfd_section;
        if (place->section != NULL
  	  || (place->os->bfd_section != NULL
  	      && place->os->bfd_section != snew))
  	{
! 	  /* Shuffle the section to make the output file look neater.  */
  	  if (place->section == NULL)
  	    {
  #if 0
--- 1146,1180 ----
      ((bfd_vma) 0, "*default*",
       (struct lang_output_section_phdr_list *) NULL, "*default*");
  
!   if (config.build_constructors && *ps == '\0')
      {
!       char *symname;
  
!       /* lang_leave_ouput_section_statement resets stat_ptr.  Put
! 	 stat_ptr back where we want it.  */
!       if (place != NULL)
! 	stat_ptr = &add;
! 
!       symname = (char *) xmalloc (ps - outsecname + sizeof "__stop_");
!       sprintf (symname, "__stop_%s", outsecname);
!       lang_add_assignment (exp_assop ('=', symname,
! 				      exp_nameop (NAME, ".")));
!     }
  
!   /* Restore the global list pointer.  */
!   stat_ptr = old;
  
!   if (place != NULL)
!     {
!       asection *snew, **pps;
  
        snew = os->bfd_section;
        if (place->section != NULL
  	  || (place->os->bfd_section != NULL
  	      && place->os->bfd_section != snew))
  	{
! 	  /* Shuffle the section to make the output file look neater.
! 	     This is really only cosmetic.  */
  	  if (place->section == NULL)
  	    {
  #if 0
*************** gld${EMULATION_NAME}_place_orphan (file,
*** 1190,1195 ****
--- 1203,1211 ----
  	}
        place->section = &snew->next;	/* Save the end of this list.  */
  
+       /* We try to put the output statements in some sort of
+ 	 reasonable order here, because they determine the final load
+ 	 addresses of the orphan sections.  */
        if (place->stmt == NULL)
  	{
  	  /* Put the new statement list right at the head.  */
*************** gld${EMULATION_NAME}_place_orphan (file,
*** 1202,1208 ****
  	  *add.tail = *place->stmt;
  	  *place->stmt = add.head;
  	}
!       place->stmt = add.tail;		/* Save the end of this list.  */
      }
  
    return true;
--- 1218,1231 ----
  	  *add.tail = *place->stmt;
  	  *place->stmt = add.head;
  	}
! 
!       /* Fix the global list pointer if we happened to tack our new
! 	 list at the tail.  */
!       if (*old->tail == add.head)
! 	old->tail = add.tail;
! 
!       /* Save the end of this list.  */
!       place->stmt = add.tail;
      }
  
    return true;
