Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA17387
	for <parisc-linux@puffin.external.hp.com>; Mon, 28 Aug 2000 07:40:43 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 28 Aug 2000 13:40:44 -0000
To: Matthew Hudson <mhudson@home.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] My toolchain whoes...
References: <39A85787.6A917C57@home.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 28 Aug 2000 09:26:25 -0400
In-Reply-To: Matthew Hudson's message of "Sat, 26 Aug 2000 18:49:27 -0500"
Message-ID: <87hf85pldq.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Matthew Hudson <mhudson@home.com> writes:

> gcc -E -dD output: (sorry I couldn't get this to you sooner willy I got
> stuck in the middle of a bad day at work)
> result = ({ unsigned long __sys_res; { register unsigned long __res
> asm("r28"); register unsigned long __r24 __asm__("r24") = (unsigned
> long)oact ? (&k_osigact) : ((void *)0); register unsigned long __r25
> __asm__("r25") = (unsigned long)act ? (&k_sigact) : ((void *)0);
> register unsigned long __r26__asm__("r26") = (unsigned long)sig; asm
> volatile( "ble  0x100(%%sr2, %%r0)\n\t" " ldi %1, %%r20" : "=r" (__res)
> : "i" ((__NR_sigaction)) , "r" (__r26), "r" (__r25), "r" (__r24) );
> __sys_res = __res; } if (__sys_res >= (unsigned long)-4095) {
> (*__errno_location ()) = (-__sys_res); __sys_res == (unsigned long)-1; }
> __sys_res; });
> 
> undefined symbol: __NR_sigaction
> 
> Now, you tell me whats wrong?

That's pretty screwed up, actually.  The line that says __NR_sigaction
clearly should say __NR_rt_sigaction (given that this is the output of
INLINE_SYSCALL(rt_sigaction, ...).  I don't know why it isn't.

Unless you pasted the wrong line ;-)

> My guess is that some how my config is getting mangled, I don't know
> how.

I'll say.  Maybe somewhere along the line some nasty header file did
something bad.  I'll see if the same thing is happening here.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
