Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id DD2C8482E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Nov 2002 12:29:58 -0700 (MST)
Date: Mon, 18 Nov 2002 14:30:07 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, tausq@debian.org
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
Message-ID: <20021118193007.GA10036@systemhalted>
References: <20021118161215.GE2729@systemhalted> <200211181742.gAIHgWcv019940@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200211181742.gAIHgWcv019940@hiauly1.hia.nrc.ca>
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

> > - Implement atomic_add, echange_and_add, and compare and swap, which are
> >   required in atomicity.h
> 
> I added an implementation of atomic_add and echange_and_add to libstdc++
> recently.  You can probably copy most of it for glibc, although the libstdc++
> implementation is for c++.  The main problem would be in initializing
> the 16 byte lock structure.
> 

We already have a 16-byte aligned lock structure in glibc for pthreads, 
and I plan to use the same construct in atomicity.h.

...
typedef struct {
       int lock;
} __attribute__((aligned (16))) __atomic_lock_t;
...
#define __LOCK_INIT = { 1 };
static __atomic_lock_t __hppa_lock = __LOCK_INIT;
...
Ref the above lock in my __asm statement and use ldcw and a loop to make
sure the C function stays atomic for those threads (similar
implementation to sparc and mips).

c.
