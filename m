Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E2C41482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Jul 2001 10:57:58 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15MBgs-0004jV-00; Mon, 16 Jul 2001 17:57:50 +0100
Date: Mon, 16 Jul 2001 17:57:50 +0100
From: Matthew Wilcox <willy@debian.org>
To: Holger Zessel <hzessel@grc.hp.com>
Cc: Helge Deller <deller@gmx.de>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] problem activating the optional lan card on 712/80 with 0.9-32serial
Message-ID: <20010716175750.F3048@parcelfarce.linux.theplanet.co.uk>
References: <20010713190310.95C7A482A@dsl2.external.hp.com> <200107161629.SAA14087@hprtdt13.grc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200107161629.SAA14087@hprtdt13.grc.hp.com>; from hzessel@grc.hp.com on Mon, Jul 16, 2001 at 06:29:34PM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jul 16, 2001 at 06:29:34PM +0200, Holger Zessel wrote:
> What makes me confused is that the card is 'supported' according to
> the hw list but apparently this part of the code was not even designed
> to support more than one card at all. How can this be if the code
> PALINUX-2.4 started with was official 2.4 code which of course 
> supported more than one lancard ?? 

each network driver needs to support the ability to drive multiple cards.
i don't think anyone had tried a second network card in a gecko before.

-- 
Revolutions do not require corporate support.
