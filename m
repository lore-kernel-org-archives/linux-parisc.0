Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA07298
	for <parisc-linux@puffin.external.hp.com>; Sun, 17 Dec 2000 17:56:48 -0700
Received: from router-100m.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.17)
  by mailserv2.iuinc.com with SMTP; 18 Dec 2000 00:59:42 -0000
Subject: Re: [parisc-linux] ldcw in __pthread_acquire
To: sieler@allegro.com (Stan Sieler)
Date: Mon, 18 Dec 2000 00:59:09 +0000 (GMT)
Cc: alan@lxorguk.ukuu.org.uk (Alan Cox), matthew@wil.cx (Matthew Wilcox),
        jes@linuxcare.com (Jes Sorensen), alan@linuxcare.com.au (Alan Modra),
        jsm@udlkern.fc.hp.com (John Marvin), parisc-linux@thepuffingroup.com
In-Reply-To: <200012180048.QAA03547@opus.allegro.com> from "Stan Sieler" at Dec 17, 2000 04:48:52 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E147oe0-0004pC-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> As Lamont Jones agreed, lightweight system calls exist, and their
> cost is on the order of a couple of instructions (typically the equivalent
> of a missed branch prediction).  HP-UX has some, Lamont speaks from experience
> (as do I).

x86 is about 50 clocks to do a syscall so the maths is strongly in favour
of user mode spins.

> Thus, it is *NOT* true that a syscall cost must be "huge".

On 99.99% of the machines people care about it is 8)
