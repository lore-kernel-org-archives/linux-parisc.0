Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 725BE483E
	for <parisc-linux@parisc-linux.org>; Sun, 21 Sep 2003 13:32:30 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A19wb-0007kM-IO; Sun, 21 Sep 2003 20:32:29 +0100
Date: Sun, 21 Sep 2003 20:32:29 +0100
From: Matthew Wilcox <willy@debian.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Matthew Wilcox <willy@debian.org>, soete.joel@tiscali.be,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] warning: long unsigned int format, time_t arg
Message-ID: <20030921193229.GJ13172@parcelfarce.linux.theplanet.co.uk>
References: <20030921190457.GI13172@parcelfarce.linux.theplanet.co.uk> <200309211916.h8LJGNAG011413@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200309211916.h8LJGNAG011413@hiauly1.hia.nrc.ca>
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

On Sun, Sep 21, 2003 at 03:16:23PM -0400, John David Anglin wrote:
> > > /* Note these change from narrow to wide kernels */
> > > #ifdef __LP64__
> > > typedef unsigned long           __kernel_size_t;
> > > typedef long                    __kernel_ssize_t;
> > > typedef long                    __kernel_ptrdiff_t;
> > > typedef long                    __kernel_time_t;
> > > #else
> > > typedef unsigned int            __kernel_size_t;
> > > typedef int                     __kernel_ssize_t;
> > > typedef int                     __kernel_ptrdiff_t;
> > > typedef int                     __kernel_time_t;
> > > #endif
> > > 
> > > On narrow kernels, int and long are the same.  So, why not use long
> > > for both narrow and wide?  Then, the ifdef can be eliminated.
> > 
> > I think it's because gcc complains ;-)
> 
> Possibly, but the pa seems to be about the only port doing this.

We're one of the few ports that builds both 32 and 64 bits from the same
port (actually, we were the first).  MIPS recently converted, and S390
before them.  PPC might in the future, and I doubt Sparc ever will.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
