Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 37A60484F
	for <parisc-linux@parisc-linux.org>; Tue, 26 Feb 2002 14:41:03 -0700 (MST)
Date: Tue, 26 Feb 2002 16:41:30 -0500
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] nslookup segmentation fault
Message-ID: <20020226164130.B5289@systemhalted>
References: <2F1E6AB90ECAD311943700A0C9E3B1540804ED28@xatl03.atl.hp.com> <20020226194150.GB11598@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020226194150.GB11598@tausq.org>; from randolph@tausq.org on Tue, Feb 26, 2002 at 11:41:51AM -0800
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

> Neat....
> 
> Here's part of Dennis' strace of nslookup:
> > m4450dmf:/etc# strace nslookup athp.hp.com
> [...]
> > rt_sigprocmask(SIG_BLOCK, [HUP INT TERM], NULL, 8) = 0
> > getpid()                                = 22574
> > socket(PF_INET, SOCK_STREAM, IPPROTO_IP) = 3
> > close(3)                                = 0
> > socket(PF_INET6, SOCK_STREAM, 0)        = -1 EAFNOSUPPORT (Address family
> > not su
> > pported by protocol)
> > brk(0)                                  = 0x2f000
> > brk(0x2f030)                            = 0x2f030
> > brk(0x30000)                            = 0x30000
> > brk(0x33000)                            = 0x33000
> > --- SIGSEGV (Segmentation fault) ---
> > +++ killed by SIGSEGV +++
> 
> why is it trying to do ipv6?
> 
> randolph
> -- 


I'm feel worried about what brk() is trying to do.

PF_INET==2 and PF_INET6==10 are only a single bit appart :}
Cosmic radiation maybe?

I'm not sure what is going on. Though I tried to build
Bind 8.3.1 on x86 and if failed (need to look into bits/types).

eventlib.c: In function `__evGetNext':
eventlib.c:298: structure has no member named `fds_bits'
eventlib.c:299: structure has no member named `fds_bits'
eventlib.c:300: structure has no member named `fds_bits'

c.
