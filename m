Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from openbsd1.buttafuoco.net (3ff839a7.dsl.flashcom.net [63.248.57.167])
	by dsl2.external.hp.com (Postfix) with ESMTP id DB2384A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Feb 2001 10:39:50 -0700 (MST)
Date: Wed, 21 Feb 2001 12:39:39 -0500 (EST)
Message-Id: <200102211739.f1LHddN31316@openbsd1.buttafuoco.net>
From: "Jim Buttafuoco" <jim@tylerdrive.org>
To: "Bryan W. Headley" <bheadley@interaccess.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] CD boot help with 735
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
List-ID: <linux-parisc.vger.kernel.org>

Bryan,

What CD are you using.  I couldn't get the .5 version to work on my 
735.  I did create my own kernel and booted via the network. Let me 
know if you need any help.

Jim

> Hi,
> 
> Am trying to boot the CDROM, but keep getting "ENTRY_INIT status = -4"
> and a few lines of hex. Never
> 
> 1) The above occurs on the console, routed to built-in video. Should I
> have done something to redirect console messages to
>     COMM port beforehand? Have a laptop attached to be the serial
> console, but obviously to no effect
> 2) Just being stupid: 9600 8 N 1, COM port A for the serial console,
> right?
> 3) Should I try, "b scsi.6.0 IPL" or without the IPL?
> 
> This is on a 735 box. Your help much appreciated.
> 
> 
> --
> ____               .:.                 ____
> Bryan W. Headley - bheadley@interaccess.com
> 
> 
> ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿéj¸¬sùb&#382;ìfj)b&#382;
	b²ÚZ®+þX§»å&#352;Ëlþ&#8211;«&#352;Çÿ&#8211;)îÇú+&#8218;m§ÿÿ&#8211;+-³úZ®+þX§»è®Ü&#8218;/Û&#352;æj)
fjå&#352;Ëbú?¥ªâ±Ïå&#352;{±
> 
> 
