Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA14423
	for <parisc-linux@puffin.external.hp.com>; Mon, 18 Dec 2000 05:30:51 -0700
Received: from router-100m.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.17)
  by mailserv2.iuinc.com with SMTP; 18 Dec 2000 12:33:44 -0000
Subject: Re: [parisc-linux] ldcw in __pthread_acquire
To: phi@hpfrcu03.france.hp.com (Philippe Benard)
Date: Mon, 18 Dec 2000 12:06:16 +0000 (GMT)
Cc: alan@lxorguk.ukuu.org.uk (Alan Cox), sieler@allegro.com (Stan Sieler),
        matthew@wil.cx (Matthew Wilcox), jes@linuxcare.com (Jes Sorensen),
        alan@linuxcare.com.au (Alan Modra),
        jsm@udlkern.fc.hp.com (John Marvin), parisc-linux@thepuffingroup.com
In-Reply-To: <3A3DB858.A56A4FE4@hpfrcu03.france.hp.com> from "Philippe Benard" at Dec 18, 2000 08:10:16 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E147z3b-0005TD-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> I am not sure I understand this thread very well. I would say that going
> syscall() for a mutex lock (ldcw, testset, spinlock, whatever you name it) is
> not a question of cost it is just simply impossible to avoid. 

It comes down to probability

A syscall on x86 gives you a 50+ clock overhead at all times
A user mode test and short spin has a 1 or 2 clock overhead if uncontended
You spin for a few clocks in case the contention is SMP and if that works
you win

IFF the lock is contended then you just spent 100 clocks instead of 50
doing a short spin then entering the kernel.

With 1% contention that means you spent 99 times doing 2 clocks, 1 time doing
100, which is a win over 100 times doing 50 clocks.

Since hppa its apparently 2 clocks to the syscall the numbers are apparently
different.
