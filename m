Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA18479
	for <parisc-linux@puffin.external.hp.com>; Mon, 18 Dec 2000 09:36:56 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 18 Dec 2000 16:39:52 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 1482h7-0006PZ-00; Mon, 18 Dec 2000 15:59:21 +0000
Date: Mon, 18 Dec 2000 15:59:21 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: LaMont Jones <lamont@hp.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>,
        Philippe Benard <phi@hpfrcu03.france.hp.com>,
        Stan Sieler <sieler@allegro.com>, Matthew Wilcox <matthew@wil.cx>,
        Jes Sorensen <jes@linuxcare.com>, Alan Modra <alan@linuxcare.com.au>,
        John Marvin <jsm@udlkern.fc.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ldcw in __pthread_acquire
Message-ID: <20001218155921.A23539@parcelfarce.linux.theplanet.co.uk>
References: <E147z3b-0005TD-00@the-village.bc.nu> <20001218144932.427471872C@security.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001218144932.427471872C@security.hp.com>; from lamont@hp.com on Mon, Dec 18, 2000 at 07:49:32AM -0700
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Dec 18, 2000 at 07:49:32AM -0700, LaMont Jones wrote:
> > Since hppa its apparently 2 clocks to the syscall the numbers are apparently
> > different.
> 
> Actually, the sequence consists of:
> 
> libc_stub:
> 	bl	gateway_page_addr
> 	...
> 
> gateway_page_addr:
> 	gate	.+8
> 	...
> 	...
> 
> And we find ourselves in kernel mode after 2 branches (unconditional
> and pre-computed ==> predict correctly) and two delay slots.  At that
> point we have kernel data structures at our fingertips, but have in no
> way done a complete 'syscall' entry - those are (at least on hp-ux) a
> bit more expensive...  (It also means that kernel vs user detection in
> traps code needs to look at the priv level, not the stack pointer...)

... ignoring the potential pain of TLB misses caused by losing locality.
But this is merely a quibble, I think.

-- 
Revolutions do not require corporate support.
