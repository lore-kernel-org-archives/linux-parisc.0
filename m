Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hem11-4-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id 14AE64864
	for <parisc-linux@lists.parisc-linux.org>; Wed, 10 Jul 2002 09:24:38 -0600 (MDT)
Date: Wed, 10 Jul 2002 15:23:18 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Thibaut VARENE <varenet@esiee.fr>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP (in)stability
Message-ID: <20020710142317.GS6681@sleepie.demon.co.uk>
References: <8CE455AF-93F4-11D6-BEE2-0030656F07A2@esiee.fr> <20020710145014.B71554854@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020710145014.B71554854@dsl2.external.hp.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Wed, Jul 10, 2002 at 08:50:14AM -0600, Grant Grundler wrote:
> Thibaut VARENE wrote:
> > hangs occured (SysRq 't', Ryan modified), take a look at:
> > http://pateam.esiee.fr/archive/mails/
> > 
> > and read the *SMPHangReport* files...
> 
> ah - thanks for saving those.
> Here's another crash we just got last night on the A500-6X.
> 
> grant
> 
> 
> -pa52 kernel panic'd at 22:07
> running gcc1 test in background
> ran two cvs updates on the kernel.
> 
> Kernel Fault: Code=26 regs=0000000012a2cd40 (Addr=0000000010112738)
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00001000000001000000000100001110 Not tainted
> r00-03  0000000000000000 0000000010421c10 00000000101869c4 0000000030c14010
> r04-07  0000000030c14000 0000000010415410 0000000030c14010 0000000000000000
> r08-11  0000000012a2ca48 000000000000000b 0000000000000000 0000000010415410
> r12-15  000000000000000b 0000000000000000 0000000012a2ca80 0000000000000000
> r16-19  0000000000000000 000000000000004a 0000000010490000 0000000000000001
> r20-23  0000000010112738 0000000012a1b550 000000000800000f 000000000800000f
> r24-27  0000000000000000 0000000030c14018 0000000012a1b540 0000000010415410
> r28-31  0000000000000104 0000000012a2cd30 0000000012a2cd40 0000000010398840
> sr0-3   0000000000005700 0000000000009780 0000000000000000 0000000000000080
> sr4-7   0000000000000000 0000000000000000 0000000000000000 0000000000000000
> 
> IASQ: 0000000000000000 0000000000000000 IAOQ: 000000001013078c 0000000010130790
>  IIR: 0e9512c0    ISR: 0000000000000000  IOR: 0000000010112738
>  CPU:        0   CR30: 0000000012a2c000 CR31: 0000000010498000
>  ORIG_R28: 000000001015ed00
> 
> GR02 0x101869c4 poll_freewait+3c
> IOAQ 0x1013078c remove_wait_queue+1c

0000000000000000 <remove_wait_queue>:
   0:   00 01 0e 76     rsm 1,r22
   4:   0f 40 11 d3     ldcw 0(sr0,r26),r19
   8:   86 60 20 3a     cmpib,=,n 0,r19,2c <remove_wait_queue+0x2c>
   c:   53 35 00 20     ldd 10(r25),r21
  10:   53 34 00 30     ldd 18(r25),r20
  14:   34 13 00 02     ldi 1,r19
  18:   0e b4 12 d0     std r20,8(sr0,r21)
  1c:   0e 95 12 c0     std r21,0(sr0,r20)
  20:   0f 53 12 80     stw r19,0(sr0,r26)
  24:   00 16 18 60     mtsm r22
  28:   e8 40 d0 02     bve,n (rp)


The address it is trying to store to is 0x10112738, which is kernel
_code_ space.

void remove_wait_queue(wait_queue_head_t *q, wait_queue_t * wait)

so either r25 (= wait) is wrong, or the wait_queue_t it points at is
corrupt.  r25 is 0x3....... don't know what is up there; vmalloc'ed
memory?

Richard
