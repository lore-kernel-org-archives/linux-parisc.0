Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 346AE482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Jun 2001 06:20:43 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 1D565B007; Mon, 11 Jun 2001 13:16:36 +0100 (BST)
Date: Mon, 11 Jun 2001 13:16:36 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Peter Weilbacher <weilbach@uni-sw.gwdg.de>,
	Helge Deller <deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Kernel faults on boot
Message-ID: <20010611131636.H16532@linuxcare.com>
References: <20010610140927.C16532@linuxcare.com> <Pine.LNX.4.33.0106111249020.9668-100000@leo.uni-sw.gwdg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0106111249020.9668-100000@leo.uni-sw.gwdg.de>; from weilbach@uni-sw.gwdg.de on Mon, Jun 11, 2001 at 01:17:39PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jun 11, 2001 at 01:17:39PM +0200, Peter Weilbacher wrote:
> Hmm, it seems that the numbers change every time, but here are the
> ones from the last instance:
> 
> 	Kernel Fault: Code=15 regs=1051ca80 (Addr=1dc0ce18)
> 
> 	     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> 	PSW: 00000000000001000000000000001111
> 	r0-3o 00000000 10236000 10193d70 1dc0cd18
> 	r4-7o 146fc000 102fe13c 00000001 00000100
> 	r8-11o 4020b1a8 00000000 00000004 146ff000
> 	r12-15o 00000100 00000030 00003000 102fe138
> 	r16-19o 00000080 1051c908 00000001 14786000
> 	r20-23o 146fc000 102959f8 101da1d4 00000000
> 	r24-27o 000000ff 1dc0ce18 146fc000 10268010
> 	r28-31o 00001920 00000004 1051ccc0 10192c78
> 	sr0-3o 00000000 0000012a 00000000 0000012a
> 	sr4-7o 00000000 00000000 00000000 00000000
> 
> 	IASQ: 00000000 00000000 IAOQ: 10236234 10236238
> 	 IIR: 0f221033    ISR: 00000000  IOR: 1dc0ce18
> 	 ORIG_R28: 1005f210
> 
> Phew, quite a work to type all this stuff, I am glad that you are
> not interested in the stack... Perhaps this is useful.

The 'o' chars are actually tabs, which are supposed to make the register
dump line up.

IAOQ is the most important.  You can look up the value in the
sti/sys_map file on the CD:

...
10236204 T bcopy
10236228 T memcpy
1023624c T memmove
...

so it crashed in memcpy.  r2 is often the return address, so back to sys_map:

...
10193a98 T vc_allocate
10193bc8 T vc_resize
10193ed8 t .L1003
10193f40 t .L1043
10193fcc T vc_disallocate
...

looks like memcpy was called from vc_resize().

r236,r25,r24,r23 are the call params, if they havn't been overwritten.

memcpy() disassembles as

00000000 <memcpy>:
   0:   37 18 3f ff     ldo -1(r24),r24
   4:   87 1f 20 20     cmpib,= -1,r24,1c <memcpy+0x1c>
   8:   08 1a 02 54     copy r26,r20
   c:   0f 22 10 33     ldb,ma  1(sr0,r25),r19
  10:   37 18 3f ff     ldo -1(r24),r24
  14:   8f 1f 3f e5     cmpib,<> -1,r24,c <memcpy+0xc>
  18:   0e 93 12 22     stb,ma  r19,1(sr0,r20)
  1c:   e8 40 c0 00     bv r0(rp)
  20:   08 1a 02 5c     copy r26,ret0

r26 = r20, so it failed on the first byte of the move, so call was

  memcpy(0x146fc000,0x1dc0ce18,0x100);

with 0x1dc0ce18 being an invalid address.

I guess that comes from this loop in drivers/char/screen.c:

  while (ol < scr_end) {
          scr_memcpyw((unsigned short *) nl, (unsigned short *) ol, rlth);
          if (rrem)
                  scr_memsetw((void *)(nl + rlth), video_erase_char, rrem);
          ol += osr;
          nl += sr;
  }


At this point I'll stop and hope Helge can comment...


> In the meantime I noticed that about every 6th time it boots up
> without crashing, but the keyboard setting from the installation
> (German) was obviously not saved.

Correct, keyboard config is broken in the release sti image.  If you
manage to boot you could try

mv /bin/loadkeys /bin/loadkeys.old
mv /bin/dumpkeys /bin/dumpkeys.old
mv /etc/console-tools /etc/console-tools.old
apt-get install console-data console-common console-tools console-tools-libs


If that works, let me know and I'll add it to the errata.

Richard
