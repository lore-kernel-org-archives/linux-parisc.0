Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 382784829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 Jan 2003 12:09:48 -0700 (MST)
Message-Id: <200301151909.h0FJ9iL1021952@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] 64 userspace
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Wed, 15 Jan 2003 14:09:44 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: leandro.farinati@hp.com, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030115190154.GA20519@systemhalted> from "Carlos O'Donell" at Jan 15, 2003 02:01:54 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> > To my knowledge, there isn't one.  Roughly what is required is:
> > 
> > 1) Kernel -- design and implement 64-bit system calls.
> 
> Currently, 64-bit kernels return bogus sigcontext structures to our
> 32-bit userspace, they stuff the sigcontext with 64-bit registers when
> it is only expecting 32-bits. It seems like sigcontext should be
> expanded to have 64-bits per register for both 32 and 64 bit kernels?
> This is definately an ABI breakage. Though it's funny that not many
> programs are broken under 64-bit kernels, but I guess that without
> *context() calls implemented for HPPA in glibc, the returned ucontext is
> not used (except for that weird LISP interpreter that Krystof was
> porting).

I wonder if this isn't the problem with expect.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
