Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA17989
	for <parisc-linux@puffin.external.hp.com>; Sat, 16 Dec 2000 21:15:42 -0700
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: sieler@allegro.com (Stan Sieler), matthew@wil.cx (Matthew Wilcox),
        jes@linuxcare.com (Jes Sorensen), alan@linuxcare.com.au (Alan Modra),
        jsm@udlkern.fc.hp.com (John Marvin), parisc-linux@thepuffingroup.com,
        lamont@hp.com
Subject: Re: [parisc-linux] ldcw in __pthread_acquire 
In-reply-to: Your message of "Sun, 17 Dec 2000 02:38:10 GMT."
             <E147TiI-0003X1-00@the-village.bc.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Sat, 16 Dec 2000 21:18:25 -0700
From: LaMont Jones <lamont@hp.com>
Message-Id: <20001217041834.39E581872C@security.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> Thats how Mozilla does it, and with a short spin in user space performance
> is way higher than always bugging the kernel

The hp-ux implementation of msem_lock() takes the advantages of both:
Gateway to kernel mode (very light weight - one predicted branch beyond
the function call), and then it does the spin and wait as needed.  Very
low cost, with the kernel-mode blocking easier to do that a combined
user-and-kernel-mode implementation.

Just my $.02,
lamont
