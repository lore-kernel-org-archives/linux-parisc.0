Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id DDAA6482A
	for <parisc-linux@parisc-linux.org>; Sat, 18 Aug 2001 17:04:42 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15YF8z-0006Go-00; Sun, 19 Aug 2001 00:04:41 +0100
Date: Sun, 19 Aug 2001 00:04:41 +0100
From: Matthew Wilcox <willy@debian.org>
To: Helge Deller <deller@gmx.de>
Cc: Matthew Wilcox <willy@debian.org>,
	Matthew Wilcox <willy@ldl.fc.hp.com>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Turn off CONFIG_PCI
Message-ID: <20010819000441.B14486@parcelfarce.linux.theplanet.co.uk>
References: <E15Xdn8-0000kt-00@chrysl> <20010818193908.2DE79482A@dsl2.external.hp.com> <20010818233700.A14486@parcelfarce.linux.theplanet.co.uk> <E15YF67-0000tK-00@master.debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E15YF67-0000tK-00@master.debian.org>; from deller@gmx.de on Sun, Aug 19, 2001 at 12:59:41AM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Aug 19, 2001 at 12:59:41AM +0200, Helge Deller wrote:
> Sure, Cxxx and Jxxx may have LASI, but if I'm correct they all have a 32bit PA7XXX 
> CPU and thus won't be catched by this check.

Nope, C200+, C240+, C360 (and equivalent J class) all have PA8x00 CPUs.

> Machines with a PA8XXX CPU don't have any LASI/GSC devices and would _always_ 
> HPMC without PCI support. So I still think it is better to panic() with a nice message 
> instead of just let the user guess why the machine suddenly HPMC'ed with this kernel 
> and start asking on the parisc-linux list.

Everyone who's asked about compilng a kernel with CONFIG_PCI off has had a
715/712-era machine.  I don't think people with PCI slots will turn it off.

-- 
Revolutions do not require corporate support.
