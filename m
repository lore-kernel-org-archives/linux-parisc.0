Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp3.xs4all.nl (smtp3.xs4all.nl [194.109.127.132])
	by dsl2.external.hp.com (Postfix) with ESMTP id 603BF482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Sep 2001 22:47:28 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp3.xs4all.nl (8.9.3/8.9.3) with ESMTP id GAA26117
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Sep 2001 06:47:21 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Fri, 21 Sep 2001 06:47:02 +0200
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010921064702.A4159@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
References: <Pine.LNX.4.33.0109201328390.14604-100000@lefou>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0109201328390.14604-100000@lefou>
Subject: [parisc-linux] Re: kernel 2.5.9-pa24 won't boot 735/125
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Sep 20, 2001 at 01:33:09PM -0600, Sonny Cook wrote:
> Hi,
> I just tried my hand at cross compiling the parisc-linux kernel on my x86
> box.  Something compiled, so I put the vmlinux on my 735/125 and tried to
> boot it.  It went like this:
> 
> Hard booted.
> Command line: 'HOME=/ TERM=LINUX console=tty root=/dev/sda2'
> 
> Segment 5 load 0038d684 size 88048 mediaptr 0x250684
> branching to kernel entry point 0x001000d0
> 
> At this point, I can't even think where to begin looking for problems.
> Any hints?
> 
That is the point, where normally output on the serial console would
start appearing. Did you try both ports? Did you try 'console=ttyS0' in
the kernel command-line? Other than that, there are some references in
this list to a special 'debug-early' flag. Dig them out, and see if that
helps?

Good luck,
Jurriaan
-- 
The documentation is in Japanese.  Good luck.
	Rich 
GNU/Linux 2.4.9-ac10 SMP/ReiserFS 2x1402 bogomips load av: 0.53 0.14 0.04
