Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA07086
	for <parisc-linux@puffin.external.hp.com>; Thu, 21 Dec 2000 09:03:25 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 21 Dec 2000 16:06:22 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id B873FB005; Thu, 21 Dec 2000 16:00:06 +0000 (GMT)
Date: Thu, 21 Dec 2000 16:00:06 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20001221160006.W2554@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] parisc64 kernel and ret1 (gr29) setup
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  I tried calling ptrace() from a 32 bit app on a 64 bit kernel, and
the kernel crashed.  sys_ptrace needs a 32 bit wrapper, but that is
a seperate issue (I think).

It died at sys_ptrace+0x28, where it tried to use ret1.
(ret1 = 00000000000517a1):

0000000000000000 <sys_ptrace>:
   0:   0f c2 12 c1     std  rp,-10(sr0,sp)
   4:   37 de 03 00     ldo 180(sp),sp
   8:   73 c5 3e 51     std r5,-d8(sp)
   c:   37 a5 3f 81     ldo -40(ret1),r5
  10:   73 c4 3e 61     std r4,-d0(sp)
  14:   08 1b 02 44     copy dp,r4
  18:   db 39 0f e0     extrd,s r25,63,32,r25
  1c:   73 c8 3e 31     std r8,-e8(sp)
  20:   73 c6 3e 41     std r6,-e0(sp)
  24:   73 c3 3e 71     std r3,-c8(sp)
  28:   73 b7 3f b1     std r23,-28(ret1)
  2c:   ef 40 2e 28     cmpib,*= 0,r26,748 <.L1098+0x7c>
  30:   34 08 3f ff     ldi -1,r8
  34:   d3 33 1e e8     extrw,s r25,23,24,r19
  38:   2b 60 00 00     addil 0,dp,%r1
                        38: R_PARISC_DLTIND21L  pidhash

At the moment we set up sp with "ldo TASK_SZ_ALGN+64(%r1),%r30" on syscall
entry.  For 64 bit presumably we should do something like:

	ldo     TASK_SZ_ALGN+80(%r1),%r30
	ldo	-16(%r30),%r29

Which gives 64 bytes for parameter saves, plus 16 bytes for rp+sp, and
initialises ret1.

Does that sound right?

Richard
