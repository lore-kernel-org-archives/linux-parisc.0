Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta05bw.bigpond.com (mta05bw.bigpond.com [139.134.6.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7CA5A4829
	for <parisc-linux@parisc-linux.org>; Wed, 28 May 2003 13:07:11 -0600 (MDT)
Received: from bubble.local ([144.135.24.81]) by
          mta05bw.bigpond.com (Netscape Messaging Server 4.15 mta05bw Jul
          16 2002 22:47:55) with SMTP id HFM2FV00.2LG for
          <parisc-linux@parisc-linux.org>; Thu, 29 May 2003 05:07:07 +1000
From: amodra@bigpond.net.au
Date: Thu, 29 May 2003 04:37:06 +0930
To: Randolph Chung <tausq@debian.org>
Cc: bug-binutils@gnu.org, binutils@sources.redhat.com,
	parisc-linux@parisc-linux.org, debian-gcc@lists.debian.org
Message-ID: <20030528190706.GC21904@bubble.sa.bigpond.net.au>
References: <20030527052251.GC24873@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030527052251.GC24873@tausq.org>
Subject: [parisc-linux] Re: [hppa] binutils will not build shared libraries with external deps?
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Mon, May 26, 2003 at 10:22:51PM -0700, Randolph Chung wrote:
> tausq@ios:~$ gcc -shared -fPIC -o blah.so blah.c
> /tmp/ccC3fZeH.o(.text+0x1c): In function `call_foo':
> : undefined reference to `foo'

This should fix it.  Would someone mind applying it for me?  I'm in
transit at the moment and internet access is slow and flaky.  2.14
branch too, I guess.

	* elf32-hppa.c (elf32_hppa_relocate_section): Delete bogus
	undefined_symbol call.

--- bfd/elf32-hppa.c~	2003-05-08 12:08:31.000000000 +0930
+++ bfd/elf32-hppa.c	2003-05-28 10:44:19.000000000 +0930
@@ -3666,16 +3666,11 @@ elf32_hppa_relocate_section (output_bfd,
 	    }
 	  else if (h->elf.root.type == bfd_link_hash_undefweak)
 	    ;
-	  else if (info->shared && !info->no_undefined
+	  else if (info->shared
+		   && !info->no_undefined
 		   && ELF_ST_VISIBILITY (h->elf.other) == STV_DEFAULT
 		   && h->elf.type != STT_PARISC_MILLI)
-	    {
-	      if (!((*info->callbacks->undefined_symbol)
-		    (info, h->elf.root.root.string, input_bfd,
-		     input_section, rel->r_offset, FALSE)))
-		return FALSE;
-	      warned_undef = TRUE;
-	    }
+	    ;
 	  else
 	    {
 	      if (!((*info->callbacks->undefined_symbol)

-- 
Alan Modra
IBM OzLabs - Linux Technology Centre
