Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA11094
	for <parisc-linux@puffin.external.hp.com>; Sat, 26 Aug 2000 17:45:34 -0600
Received: from home.com ([24.3.245.88]) by mail.rdc1.ne.home.com
          (InterMail vM.4.01.03.00 201-229-121) with ESMTP
          id <20000826234532.YLCF17075.mail.rdc1.ne.home.com@home.com>
          for <parisc-linux@thepuffingroup.com>;
          Sat, 26 Aug 2000 16:45:32 -0700
Message-ID: <39A85787.6A917C57@home.com>
Date: Sat, 26 Aug 2000 18:49:27 -0500
From: Matthew Hudson <mhudson@home.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] My toolchain whoes...
List-ID: <linux-parisc.vger.kernel.org>


>From a gcc -E -dD

sigaction.c

In function __libc_sigaction

sigaction.c line 83:
      result = INLINE_SYSCALL (rt_sigaction, 4, sig,
                               act ? __ptrvalue (&kact) : NULL,
                               oact ? __ptrvalue (&koact) : NULL, _NSIG
/ 8);

gcc -E -dD output: (sorry I couldn't get this to you sooner willy I got
stuck in the middle of a bad day at work)
result = ({ unsigned long __sys_res; { register unsigned long __res
asm("r28"); register unsigned long __r24 __asm__("r24") = (unsigned
long)oact ? (&k_osigact) : ((void *)0); register unsigned long __r25
__asm__("r25") = (unsigned long)act ? (&k_sigact) : ((void *)0);
register unsigned long __r26__asm__("r26") = (unsigned long)sig; asm
volatile( "ble  0x100(%%sr2, %%r0)\n\t" " ldi %1, %%r20" : "=r" (__res)
: "i" ((__NR_sigaction)) , "r" (__r26), "r" (__r25), "r" (__r24) );
__sys_res = __res; } if (__sys_res >= (unsigned long)-4095) {
(*__errno_location ()) = (-__sys_res); __sys_res == (unsigned long)-1; }
__sys_res; });

undefined symbol: __NR_sigaction

Now, you tell me whats wrong?

My guess is that some how my config is getting mangled, I don't know
how.

Any ideas?

-Matt
