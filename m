Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailin7.bigpond.com (juicer38.bigpond.com [139.134.6.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 69B69482D
	for <parisc-linux@parisc-linux.org>; Sat, 16 Jun 2001 23:40:21 -0600 (MDT)
Received: from bubble.local ([144.135.24.75]) by
          mailin7.bigpond.com (Netscape Messaging Server 4.15) with SMTP
          id GF27ZK00.3VP for <parisc-linux@parisc-linux.org>; Sun, 17 Jun
          2001 15:45:20 +1000
Date: Sun, 17 Jun 2001 15:13:36 +0930
From: Alan Modra <amodra@bigpond.net.au>
To: Paul Bame <bame@fc.hp.com>
Cc: parisc-linux@parisc-linux.org
Message-ID: <20010617151336.A16044@bubble.local>
References: <E15B4IO-000111-00@noam.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E15B4IO-000111-00@noam.fc.hp.com>; from bame@fc.hp.com on Fri, Jun 15, 2001 at 06:50:36PM -0600
Subject: [parisc-linux] Re: new g++/exceptions problem
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jun 15, 2001 at 06:50:36PM -0600, Paul Bame wrote:
> 
> so it's inside the exception-handler frame.  My wild guess is the
> dynamic linker is trying to handle a new type of symbol which refers
> to the new exception stuff which is for some reason not 4-byte
> aligned

Yes, the new exception code puts R_PARISC_DIR32 relocs at unaligned
addresses.  "objdump -r libstdc++.so" reveals

Relocation section '.rela.eh_frame' at offset 0x37024 contains 1611 entries:
  Offset    Info  Type            Symbol's Value  Symbol's Name          Addend
  000c167e  4da01 R_PARISC_DIR32        00056914  __gxx_personality_v0      + 0
  000c1690  00d01 R_PARISC_DIR32        0003fe40  .text                     + 5114
  000c1699  01301 R_PARISC_DIR32        000cede4  .gcc_except_table         + 0
etc.

Seems like a change in the dynamic linker is needed to handle this
situation.  Something like the following should do it for you.

--- sysdeps/hppa/dl-machine.h~	Sun Jun 17 15:03:59 2001
+++ sysdeps/hppa/dl-machine.h	Sun Jun 17 15:05:11 2001
@@ -536,7 +536,16 @@
       if (map == &_dl_rtld_map)
 	return;
 #endif
-      /* Otherwise, nothing more to do here. */
+      /* .eh_frame can have unaligned relocs.  */
+      if (reloc_addr & 3)
+	{
+	  char *rel_addr = (char *) reloc_addr;
+	  rel_addr[0] = value >> 24;
+	  rel_addr[1] = value >> 16;
+	  rel_addr[2] = value >> 8;
+	  rel_addr[3] = value >> 0;
+	  return;
+	}
       break;
 
     case R_PARISC_PLABEL32:
