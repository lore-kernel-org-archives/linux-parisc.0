Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ukcrn03.zaxus.com (mail.securepay.co.uk [193.112.44.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id E950E482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 21 May 2001 04:07:41 -0600 (MDT)
Message-ID: <9EB1F7B63758D411A78D00A0C9D84789B16BF0@UKCRN03>
From: "Bright, Stephen" <Stephen.Bright@thales-esecurity.com>
To: parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] Booting from SCSI disk.
Date: Mon, 21 May 2001 11:03:24 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Thanks Matthew, you were right I was using the lifimage.  Switched to the
vmlinux, rerun palo natively, and everything worked.  Now just need to find
out why the ethernet interface is not coming up too.

Thanks to everyone who replied.

-- 
Steve

> -----Original Message-----
> From: Matthew Wilcox [mailto:matthew@wil.cx]
> Sent: 17 May 2001 16:04
> To: Bright, Stephen
> Cc: 'parisc-linux@lists.parisc-linux.org'
> Subject: Re: [parisc-linux] Booting from SCSI disk.
> 
> 
> On Thu, May 17, 2001 at 11:32:35AM +0100, Bright, Stephen wrote:
> > Is it not possible to run fdisk and palo on the HP itself?
> 
> Yes, it is, i've done it.
> 
> > I have tried
> > this, but when it boots I get a message along the lines of 
> "Cannot grok the
> > kernel executable" (sorry, this is quoted from memory, so 
> may not be exactly
> > correct).
> 
> i bet you're using the lifimage instead of the vmlinuz.  
> paul, would it
> be feasible to check for this and print a more helpful error 
> message in
> this instance?
> 
> -- 
> Revolutions do not require corporate support.
> 
