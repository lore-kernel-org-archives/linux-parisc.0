Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from gwyn.tux.org (gwyn.tux.org [207.96.122.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id BA5D6482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Jul 2001 11:38:07 -0600 (MDT)
Received: (from timball@localhost)
	by gwyn.tux.org (8.9.3/8.9.1) id NAA12473
	for parisc-linux@lists.parisc-linux.org; Wed, 4 Jul 2001 13:38:02 -0400
Date: Wed, 4 Jul 2001 13:38:02 -0400
From: Timothy Ball <timball@tux.org>
To: Parisc Linux Mailing List <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] booting images
Message-ID: <20010704133802.K19064@gwyn.tux.org>
References: <20010703151202.H19064@gwyn.tux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010703151202.H19064@gwyn.tux.org>; from timball@tux.org on Tue, Jul 03, 2001 at 03:12:02PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jul 03, 2001 at 03:12:02PM -0400, Timothy Ball wrote:
> I have a 735 and have had a bit of a time to try to get this thing to
> boot and install. I have downloaded the palinux-0.9-32sti.iso.gz file
> from the parisc website. Is there anything special I have to do to this
> image to make it bootable? 

Okay I got the iso and it's booting... but then it gets down to these
last few lines:

--snip--snip--snip--
CPU(s): 1x PA7100 (PCX-T) at 125.000000 MHz
Kernel command line: HOME=/ TERM=linux root=/dev/ram console=tty0 sti=0
sti_font=VGA8x16
Console: colour dummy device 80x25
--snip--snip--snip--

Then it hangs... Not sure what to do... 

--timball

-- 
	GPG key available on pgpkeys.mit.edu
pub  1024R/CFF85605 1999-06-10 Timothy L. Ball <timball@sheergenius.com>
     Key fingerprint = 8A 8E 64 D6 21 C0 90 29  9F D6 1E DC F8 18 CB CD
