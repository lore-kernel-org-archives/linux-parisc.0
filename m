Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id PAA00619
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 15:26:04 -0700
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
cc: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] time_t, size_t, off_t, ... 
In-Reply-To: Your message of "Thu, 30 Nov 2000 20:50:04 GMT."
             <E141aec-0007nC-00@the-village.bc.nu>
References: <E141aec-0007nC-00@the-village.bc.nu> 
Date: Thu, 30 Nov 2000 15:28:32 -0700
From: Paul Bame <bame@noam.fc.hp.com>
Message-Id: <E141cBs-0007Gb-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= time_t itself is normally a long because historically (pre ANSI/POSIX) back
= when men where men and adb was the coolest debugger on the planet it was
= the case that time() foo was a function using longs
= 
= [Random historical aside - very early C didnt support passing long as an 
= argument hence time(&foo) not foo=time()]

I cut my Unix teeth on pdp11/v6-7 -- counts as very early I think :-)

= I know of no kernel reason. If you are using a 1KHz system clock then it
= may be handy to up the loop time for the counter to above 50 days by using
= long.

I'm setting clock_t to 64 bits on wide kernel FYI, but will keep time_t
and suseconds_t at 32 bits until there's a problem.  Won't effect
32-bit userspace if it has to change.

= > (4)	I thought I could get away with making sigset_t.sig int[] therefore
= > 	32 bits everywhere.  It would save several 32/64 syscall
= > 	wrappers (and increase speed).  However this little piece
= > 	in kernel/signal.c is a hard-coded assumption that .sig[] is
= > 	an array of long, and was a bitch to find:
= > 
= > 		unsigned long i, *s, *m, x;
= > 		s = tsk->pending.signal.sig;
= 
= Eep. Its not unreasonable to suggest to Linus that gets fixed 8)

Yeah, too bad I'm too much of a wimp to sign up for l-k -- already get
more e-mail than I read :-(  

= On the 64bit port _please_ use a 64bit ino_t. It'll possibly tickle the odd
= other problem but post 2.4 the main kernel has to move to 64bit ino_t to make
= NFSv3 and XFS sanely work. That may well let you relax and look smug as the
= rest of the world suffers 8)

Ok, I'll use 64-bit ino_t on parisc64.

	-P
