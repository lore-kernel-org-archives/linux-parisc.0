Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA06549
	for <parisc-linux@puffin.external.hp.com>; Sun, 17 Dec 2000 17:47:12 -0700
From: Stan Sieler <sieler@allegro.com>
Message-Id: <200012180048.QAA03547@opus.allegro.com>
Subject: Re: [parisc-linux] ldcw in __pthread_acquire
To: alan@lxorguk.ukuu.org.uk (Alan Cox)
Date: Sun, 17 Dec 2000 16:48:52 -0800 (PST)
Cc: alan@lxorguk.ukuu.org.uk (Alan Cox), matthew@wil.cx (Matthew Wilcox),
        jes@linuxcare.com (Jes Sorensen), alan@linuxcare.com.au (Alan Modra),
        jsm@udlkern.fc.hp.com (John Marvin), parisc-linux@thepuffingroup.com
In-Reply-To: <E147oHg-0004n8-00@the-village.bc.nu> from "Alan Cox" at Dec 18, 2000 12:36:06 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hi Alan,

As Lamont Jones agreed, lightweight system calls exist, and their
cost is on the order of a couple of instructions (typically the equivalent
of a missed branch prediction).  HP-UX has some, Lamont speaks from experience
(as do I).

> > The apparent advantages are *strictly* short term.  A single mistake
> > using a buzz lock from user code in a single process on a single computer
> > can cost more time than all properly implemented buzz locks ever save.
> 
> The cost of a syscall against a rarely contended lock is huge. So you

Thus, it is *NOT* true that a syscall cost must be "huge".

You can say: I don't want to change it, or "we've always done it that way".
but, the one thing you can't accurately say is "this is the right way".

Been there, learned that, tried to share it with you, and am now 
giving up on it.

-- 
Stan (still right :) Sieler
