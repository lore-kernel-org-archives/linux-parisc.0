Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA16194
	for <parisc-linux@puffin.external.hp.com>; Mon, 21 Aug 2000 11:47:18 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 21 Aug 2000 17:47:07 -0000
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com, parisc@lists.linuxcare.com
Subject: Re: Incompatibility of PIC and non-PIC
References: <Pine.LNX.4.21.0008191523470.28329-100000@front.linuxcare.com.au>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 21 Aug 2000 13:46:19 -0400
In-Reply-To: Alan Modra's message of "Sat, 19 Aug 2000 15:29:56 +1000 (EST)"
Message-ID: <87em3iy0b8.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra <alan@linuxcare.com.au> writes:

> In some ways not having any hardware to run hppa-linux binaries on is
> good, as it gives me some excuse.  :-)

Well I'm enjoying tracking these problems down, even if the solutions
I propose are usually wrong :-)

> Let me know how this one goes.

Quite well, once I did this:

Index: bfd/elf32-hppa.c
===================================================================
RCS file: /home/cvs/parisc/binutils-2.10/bfd/elf32-hppa.c,v
retrieving revision 1.24
diff -u -p -r1.24 elf32-hppa.c
--- elf32-hppa.c	2000/08/19 12:21:12	1.24
+++ elf32-hppa.c	2000/08/21 17:39:36
@@ -957,7 +957,8 @@ hppa_build_one_stub (gen_entry, in_arg)
 
       if (!info->shared
 	  && stub_entry->h != NULL
-	  && stub_entry->h->pic_call)
+	  && stub_entry->h->pic_call
+	  && stub_entry->h->elf.plt.offset != (bfd_vma) -1)
 	{
 	  /* Build the .plt entry needed to call a PIC function from
 	     statically linked code.  We don't need any relocs.  */

I'm not sure why it's generating multiple stubs for the same symbol,
though.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
