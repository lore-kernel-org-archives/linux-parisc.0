Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9A8CA482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 May 2001 09:04:11 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 150PJR-0004Pw-00; Thu, 17 May 2001 16:03:37 +0100
Date: Thu, 17 May 2001 16:03:37 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: "Bright, Stephen" <Stephen.Bright@thales-esecurity.com>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Booting from SCSI disk.
Message-ID: <20010517160337.A13481@parcelfarce.linux.theplanet.co.uk>
References: <9EB1F7B63758D411A78D00A0C9D84789B16BED@UKCRN03>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <9EB1F7B63758D411A78D00A0C9D84789B16BED@UKCRN03>; from Stephen.Bright@thales-esecurity.com on Thu, May 17, 2001 at 11:32:35AM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, May 17, 2001 at 11:32:35AM +0100, Bright, Stephen wrote:
> Is it not possible to run fdisk and palo on the HP itself?

Yes, it is, i've done it.

> I have tried
> this, but when it boots I get a message along the lines of "Cannot grok the
> kernel executable" (sorry, this is quoted from memory, so may not be exactly
> correct).

i bet you're using the lifimage instead of the vmlinuz.  paul, would it
be feasible to check for this and print a more helpful error message in
this instance?

-- 
Revolutions do not require corporate support.
