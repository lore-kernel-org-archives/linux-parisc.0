Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id A9DCB482E
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 28 Apr 2004 17:51:46 -0600 (MDT)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 1BIype-0008Aw-00 for <parisc-linux@lists.parisc-linux.org>;
	Wed, 28 Apr 2004 19:51:14 -0400
Date: Wed, 28 Apr 2004 19:51:13 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 carlos
Message-ID: <20040428235113.GB31006@baldric.uwo.ca>
References: <20040428231338.BB0124945C3@palinux.hppa>
	<20040428231506.GJ6936@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040428231506.GJ6936@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, Apr 28, 2004 at 07:15:07PM -0400, Carlos O'Donell wrote:
> On Wed, Apr 28, 2004 at 05:13:38PM -0600, Carlos O'Donell wrote:
> > CVSROOT:	/var/cvs
> > Module name:	linux-2.6
> > Changes by:	carlos	04/04/28 17:13:38
> > 
> > Modified files:
> > 	arch/parisc/kernel: syscall_table.S 
> > 	include/asm-parisc: unistd.h 
> > 	ipc            : compat_mq.c 
> >
> > Log message:
> > First cut to get mq_* functions working in userspace. 
> > Fix CONFIG_POSIX_MQUEUE build. Connect mq_* syscalls. 
> > Make our syscall_table match unistd.h definitions. 
> > Boots on my A500, testing new glibc build as we speak.
> 
> Not too much glue required.
> 

Okay, glibc build completed, tests pass. We have functioning posix mq_*
support for hppa.

c.
