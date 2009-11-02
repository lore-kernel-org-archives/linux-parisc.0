From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: Out of order unwind entry warning
Date: Sun, 1 Nov 2009 21:34:32 -0500
Message-ID: <20091102023432.GA12425@hiauly1.hia.nrc.ca>
References: <20091029233501.152D1500F@hiauly1.hia.nrc.ca> <4AEB6CEB.6010205@gmx.de> <20091101231654.GA11493@hiauly1.hia.nrc.ca> <20091102014025.GA12169@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="xHFwDpU9dbj6ez1V"
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	carlos@systemhalted.org, randolph@tausq.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091102014025.GA12169@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, 01 Nov 2009, John David Anglin wrote:

> On Sun, 01 Nov 2009, John David Anglin wrote:
> 
> > On Fri, 30 Oct 2009, Helge Deller wrote:
> > 
> > > But when compiling the kernel something is still wrong.
> > > I tried it a few times now, recompiled binutils, the kernel and so on.
> > > I'm not 100% sure that I did everything correct, but I still think there is
> > > something wrong...
> > 
> > I believe that you are correct but I think we have another unrelated bug.
> > It appears that the unwind data is getting messed up in the link of
> > built-in.o.
> 
> It seems the unwind data is being sorted by ld -r.

Does the attached patch fix the problem?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="unwind.d"

Index: elf32-hppa.c
===================================================================
RCS file: /cvs/src/src/bfd/elf32-hppa.c,v
retrieving revision 1.168
diff -u -3 -p -r1.168 elf32-hppa.c
--- elf32-hppa.c	18 Jun 2009 14:18:28 -0000	1.168
+++ elf32-hppa.c	2 Nov 2009 02:32:05 -0000
@@ -3238,6 +3238,9 @@ elf32_hppa_final_link (bfd *abfd, struct
 
   /* If we're producing a final executable, sort the contents of the
      unwind section.  */
+  if (info->relocatable)
+    return TRUE;
+
   return elf_hppa_sort_unwind (abfd);
 }
 
Index: elf64-hppa.c
===================================================================
RCS file: /cvs/src/src/bfd/elf64-hppa.c,v
retrieving revision 1.92
diff -u -3 -p -r1.92 elf64-hppa.c
--- elf64-hppa.c	21 May 2009 14:15:49 -0000	1.92
+++ elf64-hppa.c	2 Nov 2009 02:32:05 -0000
@@ -3033,7 +3033,7 @@ elf_hppa_final_link (bfd *abfd, struct b
 
   /* If we're producing a final executable, sort the contents of the
      unwind section. */
-  if (retval)
+  if (retval && !info->relocatable)
     retval = elf_hppa_sort_unwind (abfd);
 
   return retval;

--xHFwDpU9dbj6ez1V--
