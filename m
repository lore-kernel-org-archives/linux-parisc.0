Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA13957
	for <parisc-linux@puffin.external.hp.com>; Mon, 18 Dec 2000 05:22:28 -0700
Sender: phi@hpfrcu03.france.hp.com
Message-ID: <3A3E02BF.DC1D0EB5@hpfrcu03.france.hp.com>
Date: Mon, 18 Dec 2000 13:27:43 +0100
From: Philippe Benard <phi@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: LaMont Jones <lamont@hp.com>, Stan Sieler <sieler@allegro.com>,
        Matthew Wilcox <matthew@wil.cx>, Jes Sorensen <jes@linuxcare.com>,
        Alan Modra <alan@linuxcare.com.au>,
        John Marvin <jsm@udlkern.fc.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ldcw in __pthread_acquire
References: <E147yrB-0005SH-00@the-village.bc.nu>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>


> >
> > Note also that spinning in a ldcw is very painful for the bus, and
> > switching to a ldw-loop followed by ldcw results in starvation in a
> > greater-than-2-way MP system.
> 
> That sounds a good reason to do at least most of it in kernel space on hppa
> 


I think LaMont Jones meant that the spinlock loop (in user space AND in kernel
space) must implement a load word loop, and issue a load-and-clear word only
when the lock word looks 'free', this is because the 'write' part of the
load-and-clear word issue a cache broadcast transaction on the bus, so the
loop should be on load-word followed by load-clear-word when it looks free,
after a given amount of loop you got to ask for kernel arbitration, then OS
whence again try to get the lock and if fail go to sleep.

Phi
