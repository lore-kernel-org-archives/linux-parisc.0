Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id 491AA4856
	for <parisc-linux@lists.parisc-linux.org>; Thu,  5 Dec 2002 08:40:03 -0700 (MST)
Date: Thu, 5 Dec 2002 10:39:49 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Matthew Wilcox <willy@debian.org>
Cc: debian-hppa@lists.debian.org,
	parisc-linux@lists.parisc-linux.org, debian-glibc@lists.debian.org,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Randolph Chung <tausq@debian.org>
Message-ID: <20021205153949.GB27054@systemhalted>
References: <20021205010845.GU16331@systemhalted> <20021205133139.C5327@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021205133139.C5327@parcelfarce.linux.theplanet.co.uk>
Subject: [parisc-linux] Re: GNU/Libc 2.3.1 on HP-PARISC requires >= 2.4.19 kernel.
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

> > Why?
> > ====
> > - More testing.
> > - Bugs fixed in unaligned handlers.
> > - Trap handler fixes.
> > - More things than you can shake a stick at, and all thanks to the
> >   wonderful kernel hacking team that parisc-linux has.
> 
> That's great, but there are still problems with 2.4.19 and 2.4.20.  I think
> you're doing our users a disservice by requiring them to upgrade to 2.4.19.
> Why not relax the minimum version requirement down to 2.4.17?

I agree that it was probably a mistake at the time since 2.4.19 seemed
to solve a lot of problems... though in hindsight they are still too
unstable to push forward on all of our users.

Hrmm... *Carlos mulls for a few hours*

I'll relax it to 2.4.17 in debian, but I'll leave the upstream
requirement of 2.4.19.

c.
