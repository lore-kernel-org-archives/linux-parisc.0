Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from woph.mbl.smarden.org (dsl-62-220-19-73.berlikomm.net [62.220.19.73])
	by dsl2.external.hp.com (Postfix) with SMTP id 0EA68483D
	for <parisc-linux@lists.parisc-linux.org>; Sat,  9 Aug 2003 03:00:44 -0600 (MDT)
Message-ID: <20030809090032.16836.qmail@h14f7d.mid.smarden.org>
Date: Sat, 9 Aug 2003 11:00:32 +0200
From: Gerrit Pape <pape@smarden.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: doko@cs.tu-berlin.de, 200619@bugs.debian.org,
	dave.anglin@nrc-cnrc.gc.ca, tausq@debian.org,
	parisc-linux@lists.parisc-linux.org, control@bugs.debian.org
Subject: Re: [parisc-linux] Re: Bug#200619: gcc: parisc: compiling dietlibc-dev with -Os caus
References: <200307250308.h6P38ej6026594@hiauly1.hia.nrc.ca> <200307260221.h6Q2LRN3001246@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200307260221.h6Q2LRN3001246@hiauly1.hia.nrc.ca>
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

reassign 200619 dietlibc
retitle 200619 dietlibc: parisc: bad stat struct mapping
thanks

On Fri, Jul 25, 2003 at 10:21:26PM -0400, John David Anglin wrote:
> > At the fstat call we have the following values:
> > 
> > Breakpoint 11, 0x00010b10 in __stdio_init_file_nothreads ()
> 
> Carlos O'Donell and myself looked at this problem this afternoon.  This
> is a dietlib problem.  Dietlib is not using the correct kernel_stat
> mapping for parisc.  They appear to be using the i386 mapping.  They
> need to look at /libc/sysdeps/unix/sysv/linux/xstatconv.c and the
> hppa/kernel_stat.h header in glibc.

Yes, this seems to be the cause of the problems, and needs to be fixed
in the dietlibc.  Thanks a lot for your time looking into this, and your
valuable support.

Regards, Gerrit.
