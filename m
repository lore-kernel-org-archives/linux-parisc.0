From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: Bug#200619: gcc: parisc: compiling dietlibc-dev with -Os caus
Date: Fri, 25 Jul 2003 22:21:26 -0400 (EDT)
Message-ID: <200307260221.h6Q2LRN3001246__14943.4168976315$1416622624$gmane$org@hiauly1.hia.nrc.ca>
References: <200307250308.h6P38ej6026594@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: doko@cs.tu-berlin.de, pape-dbnbgs@smarden.org,
	200619@bugs.debian.org, dave.anglin@nrc-cnrc.gc.ca, tausq@debian.org,
	parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <200307250308.h6P38ej6026594@hiauly1.hia.nrc.ca> from "John David Anglin" at Jul 24, 2003 11:08:40 pm
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> This doesn't appear to be a gcc problem.  The register %r3 is saved
> on the stack in __stdio_init_file_nothreads.  The stack location
> is clobbered by the fstat syscall.
> 
> > > +  {
> > > +    struct stat st;
> > > +    fstat(fd,&st);
> 
> At the fstat call we have the following values:
> 
> Breakpoint 11, 0x00010b10 in __stdio_init_file_nothreads ()

Carlos O'Donell and myself looked at this problem this afternoon.  This
is a dietlib problem.  Dietlib is not using the correct kernel_stat
mapping for parisc.  They appear to be using the i386 mapping.  They
need to look at /libc/sysdeps/unix/sysv/linux/xstatconv.c and the
hppa/kernel_stat.h header in glibc.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
