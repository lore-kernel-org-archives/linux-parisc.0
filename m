Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA06291
	for <parisc-linux@puffin.external.hp.com>; Sun, 17 Dec 2000 17:46:39 -0700
Received: from router-100m.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.17)
  by mailserv2.iuinc.com with SMTP; 18 Dec 2000 00:49:34 -0000
Subject: Re: [parisc-linux] ldcw in __pthread_acquire
To: sieler@allegro.com (Stan Sieler)
Date: Mon, 18 Dec 2000 00:36:06 +0000 (GMT)
Cc: alan@lxorguk.ukuu.org.uk (Alan Cox), matthew@wil.cx (Matthew Wilcox),
        jes@linuxcare.com (Jes Sorensen), alan@linuxcare.com.au (Alan Modra),
        jsm@udlkern.fc.hp.com (John Marvin), parisc-linux@thepuffingroup.com
In-Reply-To: <200012180029.QAA03444@opus.allegro.com> from "Stan Sieler" at Dec 17, 2000 04:29:50 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E147oHg-0004n8-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> The apparent advantages are *strictly* short term.  A single mistake
> using a buzz lock from user code in a single process on a single computer
> can cost more time than all properly implemented buzz locks ever save.

The cost of a syscall against a rarely contended lock is huge. So you
test in user space, you spin enough times to cover SMP contentions then
you leap into the kernel since its a context switch away while the
other guy held the lock, which at maybe a 30 clock window is unlikely
