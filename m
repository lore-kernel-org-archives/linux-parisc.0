Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from romano (romano-nyswri.cfe.cornell.edu [132.236.139.186])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7C5474829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 23 Sep 2002 15:05:42 -0600 (MDT)
Subject: Re: [parisc-linux] RTC and FB on 735/125
From: Steve Pacenka <spacenka@lightlink.com>
To: Helge Deller <deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <200209232217.45577.deller@gmx.de>
References: <03ab01c26266$2416dea0$1f96078d@acid>
	<003001c26327$d0db42e0$1f96078d@acid> <1032806776.2868.19.camel@romano>
	<200209232217.45577.deller@gmx.de>
Content-Type: text/plain
Date: 23 Sep 2002 17:04:16 -0400
Message-Id: <1032815056.3209.115.camel@romano>
Mime-Version: 1.0
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

On Mon, 2002-09-23 at 16:18, Helge Deller wrote:
> On Monday 23 September 2002 20:46, Steve Pacenka wrote:
> > The CRX24 framebuffer also works at 8 bit color, a bit faster.  A minor
> > patch to one file in the kernel is needed (duplicating a few lines that
> > apply to another card's depth selection in the same file) and a kernel
> > boot argument is needed to (optionally) cause the kernel to start video
> > in 8 bit mode instead of the default 32.
> >
> > The hard drive I patched this on is recycled into another type of box,
> > but Helge Deller can guess what's needed just from this description.
> 
> Hi Steve,
> 
> I don't have a CRX24 and can't test anything. 
> If you could post a patch here I could add it to the kernel.

Good day Helge,

I can't test easily either, or generate formal patches, since my 735
w/CRX24 is in a display at our computer recycle shop.
