Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA25582
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 May 2000 12:07:04 -0600
From: Helge Deller <deller@gmx.de>
To: parisc-linux@thepuffingroup.com
Subject: Fwd: Re: [parisc-linux] CONFIG_SYSCTL is not set
Date: Tue, 30 May 2000 20:05:52 +0200
Content-Type: text/plain
MIME-Version: 1.0
Message-Id: <00053020065500.00442@P100>
List-ID: <linux-parisc.vger.kernel.org>

---------  Weitergeleitete Nachricht  ----------
Subject: Re: [parisc-linux] CONFIG_SYSCTL is not set
Date: Tue, 30 May 2000 19:59:09 +0200
From: Helge Deller <deller@gmx.de>


Am Tue, 30 May 2000 schrieben Sie:
> THe linking problem I had was that "sysrq_enabled" is defined in
> keyboard.c, which formerly we never used, so the link was failing.
> That's why I hacked it into setup.c.  If your STI stuff causes us
> to compile keyboard.c, that would explain why you don't need my setup.c
> hack.

I just looked into it. You will NOT be forced by my patches to compile 
keyboard.c. You may stay with your usual configuration (no keyboard, no STI, 
only serial-console). In my last commit I changed defconfig to use virtual 
consoles, keyboard and hil-keyboard. This should not affect your usage of the 
serial-console.
So I think my changes should cleanly attach to any tree, and if you only use 
serial-console without keyboard enabled, you're right, that you will need the 
patch to setup.c. Couldn't you commit your patch to setup.c (with  #ifdef ... 
#endif) ?

Helge.
-------------------------------------------------------
