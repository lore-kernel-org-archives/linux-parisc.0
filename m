Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id AAA784829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  3 Apr 2003 15:19:37 -0700 (MST)
Message-Id: <200304032219.h33MJY6B020051@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Applications in 64 bits userspace
To: willy@debian.org (Matthew Wilcox)
Date: Thu, 3 Apr 2003 17:19:33 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: rodrigo@tteng.com.br, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030403184513.GH29376@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Apr 3, 2003 07:45:13 pm
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

> As to which kernel to base it on; most of the work is kernel-independent.
> It's all about making the toolchain work properly.  There's a certain
> amount of work to do in the kernel, but there's some design work to do
> up-front first.  It shouldn't be hard to do it to either kernel and then
> port to the other.

With respect to the toolchain, you should be aware that there are
two different GNU linkers.  The 64-bit linker was designed for HP-UX
operation and was written more or less from scratch.  The 32-bit
linker was ported I believe from the i386 port and is better
suited to linux use.  It has had more testing.  If the 32-bit linker
is ported to 64 bits, you will have to deal with the different
handling of function descriptors (OPDs).  This is also an issue
for the parisc specific code in glibc used for the dynamic loader.
Code to handle various 64-bit relocations would need to be added
to the 32-bit linker.  Management of stub groups might also be an
issue although the 32-bit linker currently does a better job of this.

The current 64-bit linker is broken in a number of ways.  These
problems might get fixed in the coming months but it would be nice 
if we could dispense with having two different linkers.  If
the current 64-bit linker is used for linux, then the problems
with link-once sections, symbol overloading, symbol visibility,
PHDRs, static links, etc., will need fixing.  Fixing these problems
could be 2-3 months work, or more, for someone who knows their way
around the linker.

What you need to do is to look at the parisc specific code in the
kernel, binutils and glibc.  Carlos O'Donell <carlos@baldric.uwo.ca>
did some hacking a few months ago to try to get a simple static linked
application to run in 64-bit mode.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
