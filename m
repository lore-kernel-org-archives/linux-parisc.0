Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0BDFC482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 23 Aug 2002 10:16:49 -0600 (MDT)
Date: Fri, 23 Aug 2002 12:14:32 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] RFC - glibc - patch reivew - 64->32
Message-ID: <20020823161432.GF4764@systemhalted>
References: <20020823131634.GA3229@systemhalted> <20020823153600.GS8214@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020823153600.GS8214@tausq.org>
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

> >  #ifndef	_ASM
> > -typedef double __jmp_buf[21];
> > +typedef int __jmp_buf[21] __attribute__ ((aligned (8)));
> >  #endif
> 
> this should now be
> typedef int __jmp_buf[42] __attribute__ ((aligned (8)));
> (sizeof(double) == 2 * sizeof(int))
> 

Correct. Thanks! I've been working in a mixed 32/64-bit mode
for most of the week trying to get sigcontext right... that sometimes
I miss the simple things :}

Can you find example jmpbuf usages that break this?

c.
