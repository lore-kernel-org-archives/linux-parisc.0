Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA14592
	for <parisc-linux@puffin.external.hp.com>; Tue, 19 Dec 2000 18:36:58 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id 3EDC9ABF
	for <parisc-linux@thepuffingroup.com>; Tue, 19 Dec 2000 17:39:56 -0800 (PST)
Received: from localhost (grundler@localhost [127.0.0.1])
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) with SMTP id RAA16387
	for <parisc-linux@thepuffingroup.com>; Tue, 19 Dec 2000 17:40:56 -0800 (PST)
Message-Id: <200012200140.RAA16387@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] WAX, Harmony and SuperIO 
In-reply-to: Your message of "Wed, 13 Dec 2000 13:52:17 PST."
             <3A37C561.48BD88F5@linuxcare.com>
Date: Tue, 19 Dec 2000 17:40:55 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries wrote:
> 
> Just an update on three device drivers I'm vaguely working on.
> 
> I'm actually up for working on other various drivers, and am taking
> requests.  I do have quite a variety of hardware to test on.
> 
> 1. Harmony, the sound driver
> 
> Definitely some problems here, most are already documented but one
> notable one is that the sound chip on a 715/75 doesn't appear to be
> Harmony at all.  Does anyone by chance know what this is?

I tried to locate info on this and couldn't. Too many stale links.
Perhaps someone with better connections in/to Fort Collins might know.


> 3. SuperIO
> 
> I made an unsuccessful attempt to understand how SuperIO (the funky IO
> controller in C3k and J5k) PCI interrupts work.

I'm happy to help make interrupts work w/suckyio - it shouldn't be that hard.
They are definitely routed through an I/O SAPIC.
I'll try to figure out how.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
