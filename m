Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA17182
	for <parisc-linux@puffin.external.hp.com>; Sat, 16 Dec 2000 19:49:03 -0700
Received: from router-100m.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.17)
  by mailserv2.iuinc.com with SMTP; 17 Dec 2000 02:51:55 -0000
Subject: Re: [parisc-linux] ldcw in __pthread_acquire
To: sieler@allegro.com (Stan Sieler)
Date: Sun, 17 Dec 2000 02:38:10 +0000 (GMT)
Cc: matthew@wil.cx (Matthew Wilcox), jes@linuxcare.com (Jes Sorensen),
        alan@linuxcare.com.au (Alan Modra),
        jsm@udlkern.fc.hp.com (John Marvin), parisc-linux@thepuffingroup.com
In-Reply-To: <200012170122.RAA26462@opus.allegro.com> from "Stan Sieler" at Dec 16, 2000 05:22:38 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E147TiI-0003X1-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> User code should never do LDCW calls ... we've just seen yet another
> example of why: it's difficult to do correctly.  Providing fast
> locking mechanisms is the *kernel's* job.

There are good reasons for doing buzzlocks in user space

> for a very short time, so the spin loop is acceptable ... but ... yes,
> things happen ... and sometimes the programmer is wrong, and that
> can have tragic consequences.  A kernel-implemented fast-lock would
> presumably ...like on MPE/iX ... have a max number of hard loops,
> and then revert to a blocking-lock of some kind.

Thats how Mozilla does it, and with a short spin in user space performance
is way higher than always bugging the kernel
