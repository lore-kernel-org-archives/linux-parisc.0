Received: from the-village.bc.nu (lightning.swansea.linux.org.uk [194.168.151.1])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id NAA28965
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 13:51:38 -0700
Subject: Re: [parisc-linux] time_t, size_t, off_t, ...
To: bame@noam.fc.hp.com (Paul Bame)
Date: Thu, 30 Nov 2000 20:50:04 +0000 (GMT)
Cc: parisc-linux@puffin.external.hp.com
In-Reply-To: <E141Zid-00049i-00@noam.fc.hp.com> from "Paul Bame" at Nov 30, 2000 12:50:11 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E141aec-0007nC-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> (3)	I'm currently using 32-bit time_t and suseconds_t for my 64-bit
> 	kernel and it appears to work just fine, and saves lots of syscall
> 	wrapper work.  However the other ports use 'long' so there's
> 	probably a good reason (or hidden assumptions in kernel code)
> 	for it.  Those are

time_t itself is normally a long because historically (pre ANSI/POSIX) back
when men where men and adb was the coolest debugger on the planet it was
the case that time() foo was a function using longs

[Random historical aside - very early C didnt support passing long as an 
argument hence time(&foo) not foo=time()]

I know of no kernel reason. If you are using a 1KHz system clock then it
may be handy to up the loop time for the counter to above 50 days by using
long.

> (4)	I thought I could get away with making this 'int' and therefore
> 	32 bits everywhere.  It would save several 32/64 syscall
> 	wrappers (and increase speed).  However this little piece
> 	in kernel/signal.c is a hard-coded assumption that .sig[] is
> 	an array of long, and was a bitch to find:
> 
> 		unsigned long i, *s, *m, x;
> 		s = tsk->pending.signal.sig;

Eep. Its not unreasonable to suggest to Linus that gets fixed 8)

> (5)	This looks to be 32 bits everywhere, even on 64-bit archs,
> 	with the single exception of sparc.  Although this little
> 	snippet in <linux/nfs_fs.h>:
> 
> 	static inline ino_t
> 	nfs_fileid_to_ino_t(u64 fileid)
> 	{
> 		ino_t ino = (ino_t) fileid;
> 		if (sizeof(ino_t) < sizeof(u64))
> 			ino ^= fileid >> (sizeof(u64)-sizeof(ino_t)) * 8;
> 		return ino;
> 	}
> 	
> 	clearly shows a 32-bit ino_t is currently a (potential) problem,
> 	it seems to me this is a Linux problem not a parisc problem, so
> 	it seemed better to follow the lead of the other ports.

On the 64bit port _please_ use a 64bit ino_t. It'll possibly tickle the odd
other problem but post 2.4 the main kernel has to move to 64bit ino_t to make
NFSv3 and XFS sanely work. That may well let you relax and look smug as the
rest of the world suffers 8)

Alan
