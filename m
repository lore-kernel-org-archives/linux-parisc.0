Return-Path: <parisc@rkeene.org>
Received: from mail.oc9.org (unknown [209.224.199.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id ABACE4880
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 19 Apr 2004 23:56:20 -0600 (MDT)
Date: Tue, 20 Apr 2004 00:56:18 -0500 (CDT)
From: Roy Keene <parisc@rkeene.org>
To: Randolph Chung <tausq@debian.org>
Subject: Re: [parisc-linux] Kernel 2.4 bug (fwd)
In-Reply-To: <20040420055330.GY17842@tausq.org>
Message-ID: <Pine.LNX.4.58.0404200054450.11253@hammer.oc9.org>
References: <Pine.LNX.4.58.0404200039410.31608@hammer.oc9.org>
	<20040420055330.GY17842@tausq.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

When it crashes I get no messages :-)

There might be something on the serial console, but I've never been
attached to it when it happened.

On Mon, 19 Apr 2004, Randolph Chung wrote:

> > (double free() shouldn't cause the kernel to give page faults, running it
> >  enough times eventually crashes the kernel)
>
> actually, the page fault message from the kernel is just informational.
> it tells you what is the processor state when you get a segfault. it's
> quite useful for some types of debugging.
>
> however, this should NOT cause your kernel to crash. When your kernel
> crashes, do you see a different type of register dump show up? does the
> machine hang? hpmc? print some errors? the important bit to look at is
> the IAOQ listed in the register dump. If the last 2 bits are set, then
> it's a userspace page fault (and should be safe). If you get one where
> the last 2 bits are 0 then it's a kernel-space fault, and we should try
> to figure out where that comes from.
>
> randolph
> --
> Randolph Chung
> Debian GNU/Linux Developer, hppa/ia64 ports
> http://www.tausq.org/
>
