Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA16405
	for <parisc-linux@puffin.external.hp.com>; Mon, 18 Dec 2000 07:46:41 -0700
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: phi@hpfrcu03.france.hp.com (Philippe Benard),
        sieler@allegro.com (Stan Sieler), matthew@wil.cx (Matthew Wilcox),
        jes@linuxcare.com (Jes Sorensen), alan@linuxcare.com.au (Alan Modra),
        jsm@udlkern.fc.hp.com (John Marvin), parisc-linux@thepuffingroup.com,
        lamont@hp.com
Subject: Re: [parisc-linux] ldcw in __pthread_acquire 
In-reply-to: Your message of "Mon, 18 Dec 2000 12:06:16 GMT."
             <E147z3b-0005TD-00@the-village.bc.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Mon, 18 Dec 2000 07:49:32 -0700
From: LaMont Jones <lamont@hp.com>
Message-Id: <20001218144932.427471872C@security.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> Since hppa its apparently 2 clocks to the syscall the numbers are apparently
> different.

Actually, the sequence consists of:

libc_stub:
	bl	gateway_page_addr
	...

gateway_page_addr:
	gate	.+8
	...
	...

And we find ourselves in kernel mode after 2 branches (unconditional
and pre-computed ==> predict correctly) and two delay slots.  At that
point we have kernel data structures at our fingertips, but have in no
way done a complete 'syscall' entry - those are (at least on hp-ux) a
bit more expensive...  (It also means that kernel vs user detection in
traps code needs to look at the priv level, not the stack pointer...)

lamont
