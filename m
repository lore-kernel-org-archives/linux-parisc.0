Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA25790
	for <parisc-linux@puffin.external.hp.com>; Mon, 18 Dec 2000 14:51:55 -0700
Received: from router-100m.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.17)
  by mailserv2.iuinc.com with SMTP; 18 Dec 2000 21:54:51 -0000
Subject: Re: [parisc-linux] ldcw in __pthread_acquire
To: lamont@hp.com (LaMont Jones)
Date: Mon, 18 Dec 2000 21:56:03 +0000 (GMT)
Cc: alan@lxorguk.ukuu.org.uk (Alan Cox), sieler@allegro.com (Stan Sieler),
        parisc-linux@thepuffingroup.com,
        phi@hpfrcu03.france.hp.com (Philippe Benard),
        lamont@hp.com (LaMont Jones), matthew@wil.cx (Matthew Wilcox),
        jes@linuxcare.com (Jes Sorensen), alan@linuxcare.com.au (Alan Modra),
        jsm@udlkern.fc.hp.com (John Marvin)
In-Reply-To: <20001218204414.F2EAF1872C@security.hp.com> from "LaMont Jones" at Dec 18, 2000 01:44:12 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E1488GN-0006Gl-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> > We use user space locks for stuff like pthreads on most platforms with
> > the kernel doing the contention cases. I'm not arguing that it wouldnt be nic
> > to let the kernel do it all if we had cheap syscalls. 
> 
> Sounds perfectly reasonable.  How hard is it to put arch-specific things
> into that path?

Its all arch specific, so you can do it right for hppa. The code in db3 is
also arch specific (falling back to kernel) as is the Mozilla code.
