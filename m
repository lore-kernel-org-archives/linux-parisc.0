Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA17737
	for <parisc-linux@puffin.external.hp.com>; Sun, 26 Mar 2000 11:24:28 -0700
From: willy@thepuffingroup.com
Date: Sun, 26 Mar 2000 13:26:01 -0500
To: Bas Valkema <b_valkema@hotmail.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Couple of questions
Message-ID: <20000326132601.A29108@thepuffingroup.com>
References: <20000326122048.75837.qmail@hotmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000326122048.75837.qmail@hotmail.com>; from Bas Valkema on Sun, Mar 26, 2000 at 02:17:01PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Mar 26, 2000 at 02:17:01PM +0200, Bas Valkema wrote:
> 1 - how does a 715/50 boot over a network? Probably not bootp...

rbootd.  There's an RPM and a tgz on puffin.external.hp.com in
/pub/parisc/binaries/

> 2 - what is the maximum size of memory(module) (8 slots) supported in the 715/50? And what does Linux support?

not sure.  You need to add them in pairs.  It's documented in the Hardware
Compatibility List that's available from the documentation page.

> 3 - What does the TOC button do????

Transfer Of Control.  It resets the machine.

> 4 - Linux reports SCSI-Clock of 50MHz, this is probably wrong, right?

According to the documentation we have, that is correct.

> 5 - I am willing to write a fb-driver, but can't find any specs of the graphics adapter..

we're working on getting those specs released.  steve shack is already
working on it though.

> 6 - Is someone (thinking of) porting ld.so??

yes, it's part of glibc.

> 7 - Is it possible to use an ext2fs partition as root?

The SCSI driver isn't working yet.  If you want to add support for the
NCR53c700 which is in the 715/50, then you will be very popular :-)
