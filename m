Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA22665
	for <parisc-linux@puffin.external.hp.com>; Mon, 18 Dec 2000 12:50:41 -0700
Received: from router-100m.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.17)
  by mailserv2.iuinc.com with SMTP; 18 Dec 2000 19:53:34 -0000
Subject: Re: [parisc-linux] ldcw in __pthread_acquire
To: sieler@allegro.com (Stan Sieler)
Date: Mon, 18 Dec 2000 19:54:52 +0000 (GMT)
Cc: parisc-linux@thepuffingroup.com,
        phi@hpfrcu03.france.hp.com (Philippe Benard),
        alan@lxorguk.ukuu.org.uk (Alan Cox), lamont@hp.com (LaMont Jones),
        matthew@wil.cx (Matthew Wilcox), jes@linuxcare.com (Jes Sorensen),
        alan@linuxcare.com.au (Alan Modra),
        jsm@udlkern.fc.hp.com (John Marvin)
In-Reply-To: <200012181944.LAA07568@opus.allegro.com> from "Stan Sieler" at Dec 18, 2000 11:44:45 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E1486N5-000662-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> Note that efficiency *IS ALWAYS LESS IMPORTANT THAN CORRECTNESS*.
> That's 100%, totally vital!  To say "important" is to make a severe
> understatement.

Tell that to the folks I work with at times for whom user space lock testing
shaves 4 weeks off a run. Try the difference in Mozilla.

In both cases Im forced to disagree - at least for x86.

> Can you interrogate and ask what version of msem_lock() you're calling?  

Yes. ELF has versioned symbols if they have changed. You can use those for
many things. X86 however has a stable instruction set abi for locking.

> Although I can't find the man pages for Linux msem_lock, I know that the
> HP-UX msem_lock doesn't meet all of these criteria (nor does MPE/iX, although
> it comes a lot closer).

We use user space locks for stuff like pthreads on most platforms with
the kernel doing the contention cases. I'm not arguing that it wouldnt be nice
to let the kernel do it all if we had cheap syscalls. 

Alan
