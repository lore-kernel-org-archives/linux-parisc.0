Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 81618482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  1 Sep 2001 09:27:26 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15dCg9-0000xO-00; Sat, 01 Sep 2001 16:27:25 +0100
Date: Sat, 1 Sep 2001 16:27:25 +0100
From: Matthew Wilcox <willy@debian.org>
To: =?iso-8859-1?Q?Andreas_H=E4rtel?= <andreas@malcolm.in-chemnitz.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP712/60 Hang when booting over the network
Message-ID: <20010901162725.L5126@parcelfarce.linux.theplanet.co.uk>
References: <000001c132e4$2ee29ca0$0350a8c0@genesis>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <000001c132e4$2ee29ca0$0350a8c0@genesis>; from andreas@malcolm.in-chemnitz.de on Sat, Sep 01, 2001 at 02:45:25PM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Sep 01, 2001 at 02:45:25PM +0200, Andreas Härtel wrote:
> Kernel: partition 0 file /vmlinux
> Ramdisk: partition 0 file /ramdisk
> Warning: kernel name doesn't end with 32 or 64... Guessing Annoyance:
> Firmware
> does not support PDV_MODEL_CAPABILITIES cell
> 32
> 
> ERROR: Read from boot device failed (status = -3).
> byteio_read: seekread() returned -1 expected 2048
> 
> ERROR: Read from boot device failed (status = -3).
> byteio_read: seekread() returned -1 expected 2048
> Couldn't grok your kernel executable format
> failed to load kernel
> 
> ---snip---

That's very strange.  Can you tcpdump to see what packets are going
across the wire?  It almost looks as if your tftpd died halfway through
the transfer.

-- 
Revolutions do not require corporate support.
