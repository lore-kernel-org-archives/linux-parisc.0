Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0AFDF482A
	for <parisc-linux@parisc-linux.org>; Wed, 30 Jan 2002 05:10:46 -0700 (MST)
Date: Wed, 30 Jan 2002 07:10:53 -0500
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: Tom <palinux@alaskatech.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Odd kernel error
Message-ID: <20020130071053.H8395@systemhalted>
References: <Pine.LNX.4.33.0201291938520.3623-100000@goliath.alaskatech.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0201291938520.3623-100000@goliath.alaskatech.org>; from palinux@alaskatech.org on Tue, Jan 29, 2002 at 08:00:21PM -0900
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

> Compiling the latest from CVS (-pa16, I think) and at the final make, when
> gcc is actually doing the '-o vmlinux' I'm getting:
> 
> drivers/video/video.o: In function 'L1260':
> drivers/video/video.o(.init.text+0x2554): undefined reference to
> 'fbcon_sti'
> drivers/video/video.o(.init.text+0x255c): undefined reference to
> 'fbcon_sti'
> make: *** [vmlinux] Error 1
> 
> This happened with -pa15 also. I downloaded the pre-built -pa15 kernel and
> it boots fine, though. Checking, I realized I had disabled PCI in my
> config (it's a 715/100, no PCI in it), and remembered some discussion
> about PCI being a 'depends-on' item for some things... Is it possible this
> is a 'needs PCI' issue?
> 
> I have a new kernel compile going on now, with PCI enabled, so we'll see
> what happens, but figured I'd toss it out in case someone else is seeing
> this.
> 
>

Yes, without PCI you couldn't (until recently) compile
the STI Console.

Matthew believed that some subsequent changes had possibly
fixed this error, but I haven't checked yet.

It might be that STI Console depends on FB to be compiled.
Which can break since STI can still be compiled with FB
config turned off.

And thus you see the error that you have.

c. 
