Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from vogon.bangor.ac.uk (vogon.bangor.ac.uk [147.143.41.40])
	by dsl2.external.hp.com (Postfix) with ESMTP id 90EEC482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 26 Jun 2001 02:34:19 -0600 (MDT)
Sender: sim@vogon.bangor.ac.uk
Message-ID: <3B384906.2805FD29@sbs.bangor.ac.uk>
Date: Tue, 26 Jun 2001 09:34:14 +0100
From: Simeon Walker <simeon@sbs.bangor.ac.uk>
MIME-Version: 1.0
To: Markus Ungermann <m.ungermann@tuxhausen.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 712/60: No login, only crashes
References: <3B378759.CBB5160E@tuxhausen.de>
Content-Type: text/plain; charset=iso-8859-1
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  i saw this problem too a few weeks ago (search the list for the thread
'[parisc-linux] Re: Kernel faults on boot'). If you get into run level
one 
(as one of the other replies here shows) you can the finish the install. 
If you download the kernel source from cvs and compile/install that
then you should be able to boot ok. It worked for me.

Regards,
Simeon

Markus Ungermann wrote:
> 
> Hi,
> 
> i get an HP 712/60 last week, it has an installed Debian and this works
> good. But the HD is to little, only 520MB (with 128MB Swap).
> 
> Then i installed PA-Linux 0.9 on a 3.2GB-HD (Quantum Fireball 3200S ),
> but after the first reboot:
> - the system starts and
> - the Init-Process works,
> - it enter Runlevel 2
> - then instead of a login i get an Crash
> I get a Dump list (How can i print/copy this?) and the following line:
> 
> Kernel Fault Code 26 regs(differents everytime)
> 
> Ok, i use another HD 2.1GB (IBM DFRS ...) but, the same ....
> 
> I have Bootmon 1.2, i tries to update it (with a tape) but it didn't
> work.
> 
> If fsck failed, and i must login as root, i have no Problems, it seens
> to be an error with the login-script.
> 
> Can someone help me to login ?
> Or how can i boot into single mode (there is no lilo ;-))) ?
> 
> Is the powersupply strong enough for a second intern HD (then i boot
> from the 520MB und use the Quantum as /usr) ?
> 
> --
> cu Markus Ungermann
> 
>        Look at my website: http://www.tuxhausen.de
>                      !! Ask me for my PGP-Key !
> 
>         `Software is like sex; it's best when it´s free´
>                  ->> Linus B. Torvalds
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux


-- 
Simeon Walker,                      email: simeon@sbs.bangor.ac.uk
School of Biological Sciences,      phone: +44 (0)1248 383702
University of Wales, Bangor,        fax: +44 (0)1248 382569
Gwynedd, LL57 2UW, UK.              www: http://biology.bangor.ac.uk/
