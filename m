Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA08809
	for <parisc-linux@puffin.external.hp.com>; Sun, 17 Dec 2000 21:42:16 -0700
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: sieler@allegro.com (Stan Sieler), matthew@wil.cx (Matthew Wilcox),
        jes@linuxcare.com (Jes Sorensen), alan@linuxcare.com.au (Alan Modra),
        jsm@udlkern.fc.hp.com (John Marvin), parisc-linux@thepuffingroup.com,
        lamont@hp.com
Subject: Re: [parisc-linux] ldcw in __pthread_acquire 
In-reply-to: Your message of "Mon, 18 Dec 2000 00:59:09 GMT."
             <E147oe0-0004pC-00@the-village.bc.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Sun, 17 Dec 2000 21:43:59 -0700
From: LaMont Jones <lamont@hp.com>
Message-Id: <20001218044410.DA2DE1872C@security.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> x86 is about 50 clocks to do a syscall so the maths is strongly in favour
> of user mode spins.

It really comes down to what is the cost to get into kernel mode, as
compared to the cost of dealing with the atomicity problems that come
in when you try to implement locking completely in user space.

In the ideal world, I think that what we want is a libc entry point that
we can use for semaphoring (msem_lock comes to mind...), which the lib
(in arch specific code) either implements in a mixture of user/kernel
space, or (if you can get to kernel mode cheaply), does it in kernel mode
via a lightweight system call.

Note also that spinning in a ldcw is very painful for the bus, and
switching to a ldw-loop followed by ldcw results in starvation in a
greater-than-2-way MP system.

lamont
