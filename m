Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA05295
	for <parisc-linux@puffin.external.hp.com>; Thu, 7 Sep 2000 03:05:36 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 7 Sep 2000 09:05:51 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id UAA31630;
	Thu, 7 Sep 2000 20:05:09 +1100
Date: Thu, 7 Sep 2000 20:05:09 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: binutils@sourceware.cygnus.com
cc: parisc-linux@thepuffingroup.com
Subject: Re: Nasty elf orphan section bug.
In-Reply-To: <Pine.LNX.4.21.0009071644240.16907-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0009071955540.16907-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 7 Sep 2000, Alan Modra wrote:

> ld/ChangeLog
> 	* emultempl/elf32.em (gld${EMULATION_NAME}_place_orphan): Fix
> 	broken list handling.  Create __start_SECNAME and __stop_SECNAME
> 	when no placeholder.  Add some comments.  Test both SEC_CODE and
> 	SEC_READONLY for hold_text to prevent .rodata orphan poisoning.

Drat.  Missed another problem when using weird linker scripts.

ld/ChangeLog
	Handle case where no output section statement created.

This can happen when an output section statement already exists for the
input orphan section.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.

Index: emultempl/elf32.em
===================================================================
RCS file: /cvs/src/src/ld/emultempl/elf32.em,v
retrieving revision 1.34
diff -u -w -p -r1.34 elf32.em
--- elf32.em	2000/09/07 07:08:58	1.34
+++ elf32.em	2000/09/07 08:52:17
@@ -1203,9 +1203,11 @@ gld${EMULATION_NAME}_place_orphan (file,
 	}
       place->section = &snew->next;	/* Save the end of this list.  */
 
+      if (add.head != NULL)
+	{
       /* We try to put the output statements in some sort of
-	 reasonable order here, because they determine the final load
-	 addresses of the orphan sections.  */
+	     reasonable order here, because they determine the final
+	     load addresses of the orphan sections.  */
       if (place->stmt == NULL)
 	{
 	  /* Put the new statement list right at the head.  */
@@ -1219,13 +1221,14 @@ gld${EMULATION_NAME}_place_orphan (file,
 	  *place->stmt = add.head;
 	}
 
-      /* Fix the global list pointer if we happened to tack our new
-	 list at the tail.  */
+	  /* Fix the global list pointer if we happened to tack our
+	     new list at the tail.  */
       if (*old->tail == add.head)
 	old->tail = add.tail;
 
       /* Save the end of this list.  */
       place->stmt = add.tail;
+	}
     }
 
   return true;
