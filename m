From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: Bug#200619: gcc: parisc: compiling dietlibc-dev with -Os caus
Date: Thu, 24 Jul 2003 23:08:40 -0400 (EDT)
Message-ID: <200307250308.h6P38ej6026594__39888.5214505301$1416622622$gmane$org@hiauly1.hia.nrc.ca>
References: <16160.16989.224282.484030@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: pape-dbnbgs@smarden.org, 200619@bugs.debian.org,
	dave.anglin@nrc-cnrc.gc.ca, tausq@debian.org,
	parisc-linux@lists.parisc-linux.org
To: doko@cs.tu-berlin.de (Matthias Klose)
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <16160.16989.224282.484030@gargle.gargle.HOWL> from "Matthias Klose" at Jul 24, 2003 04:32:29 pm
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> [CC to jda]
> 
> Please can you recheck with a current gcc snapshot (from the
> gcc-snapshot package) and attach the preprocessed source?

This doesn't appear to be a gcc problem.  The register %r3 is saved
on the stack in __stdio_init_file_nothreads.  The stack location
is clobbered by the fstat syscall.

> > +  {
> > +    struct stat st;
> > +    fstat(fd,&st);

At the fstat call we have the following values:

Breakpoint 11, 0x00010b10 in __stdio_init_file_nothreads ()
(gdb) printf "0x%x\n",*0xfaf005a8
0xfaf004c0
(gdb) printf "0x%x\n",$r25
0xfaf00548
(gdb) printf "0x%x\n",$r26
0x5
(gdb) c
Continuing.

Breakpoint 12, 0x00010b18 in __stdio_init_file_nothreads ()
(gdb) printf "0x%x\n",*0xfaf005a8
0x0

0xfaf005a8 is the location where %r3 was saved.  The break is at the
fstat syscall.  Non of the user space code in the call patch affects
the above location, so the bug must be in the kernel.

I looked at this on a 64-bit kernel:

dave@gsyprf11:~/dietlibc-0.22.orig$ uname -a
Linux gsyprf11.external.hp.com 2.4.21-pa6 #23 Mon Jul 14 23:11:39 PDT 2003 parisc64 GNU/Linux

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
