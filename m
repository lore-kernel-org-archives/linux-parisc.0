Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2644A482A
	for <parisc-linux@parisc-linux.org>; Mon, 27 Aug 2001 13:37:27 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15bSCG-0001M9-00; Mon, 27 Aug 2001 20:37:20 +0100
Date: Mon, 27 Aug 2001 20:37:20 +0100
From: Matthew Wilcox <willy@debian.org>
To: Tom <tom@alaskatech.org>
Cc: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Kernel building
Message-ID: <20010827203720.G525@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.33.0108260741370.1919-100000@goliath.alaskatech.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0108260741370.1919-100000@goliath.alaskatech.org>; from tom@alaskatech.org on Sun, Aug 26, 2001 at 07:55:46AM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Aug 26, 2001 at 07:55:46AM -0800, Tom wrote:
> I then changed to '2/vmlinux-2.4.9' (partition 2 is /boot once mounted),
> ran palo (no errors, identified 2/vmlinux-2.4.9 as the new kernel),
> rebooted - and I get the error that the system can't grok the kernel
> executable format and then a 'failed to boot' message.

You're probably trying to boot a lifimage (which is what `make palo' produces).
palo will only boot a raw kernel -- ie the vmlinux.

-- 
Revolutions do not require corporate support.
