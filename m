Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0031A4841
	for <parisc-linux@lists.parisc-linux.org>; Sun,  9 Nov 2003 16:21:50 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1AIysP-0007Bz-Cs; Sun, 09 Nov 2003 23:21:49 +0000
Date: Sun, 9 Nov 2003 23:21:49 +0000
From: Matthew Wilcox <willy@debian.org>
To: "Shane G. Brodie" <sgbrodie@mts.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HPPA Newbie
Message-ID: <20031109232149.GI2014@parcelfarce.linux.theplanet.co.uk>
References: <LPENLKGPOOFMNIPKLBNDGEEFCAAA.sgbrodie@mts.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <LPENLKGPOOFMNIPKLBNDGEEFCAAA.sgbrodie@mts.net>
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

On Sun, Nov 09, 2003 at 01:48:56PM -0600, Shane G. Brodie wrote:
> I have downloaded and installed PA-Risc Linux 0.93 (I tried several attempts
> with network images, but couldn't figure out how to get my 10/100 VG EISA
> card working and don't have an aui-Ethernet transceiver for the built-in
> nic).  I thought about downloading the Debian ISO's ... but life is just too
> short for that many ISO downloads on a low-speed ADSL link ...

OK.  We don't normally ship the 100VG driver, but I have tried it on one
machine once, and it seemed to work.  You'll need to compile a new kernel
(or at least a new module).  This card is driven by the hp100 driver,
so look for the CONFIG_HP100 configuration option.

By the way, you said you were new to the platform, so it's worth
pointing out that 100VG is incompatible with the eventual 100 Mbps
Ethernet standard (100TX).  Unless you have a 100VG hub (in which case
you need to hit Grant to stop him sending you obsolete hardware ;-),
you'll need to plug your network cable into the 10Mbps socket on the card.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
