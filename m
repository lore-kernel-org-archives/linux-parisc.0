Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta06ps.bigpond.com (mta06ps.bigpond.com [144.135.25.138])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2BE30482B
	for <parisc-linux@parisc-linux.org>; Fri, 26 Oct 2001 19:18:33 -0600 (MDT)
Received: from bubble.local ([144.135.25.81]) by
          mta06ps.bigpond.com (Netscape Messaging Server 4.15) with SMTP
          id GLUBXP00.CHY for <parisc-linux@parisc-linux.org>; Sat, 27 Oct
          2001 11:25:01 +1000
Date: Sat, 27 Oct 2001 10:48:24 +0930
From: Alan Modra <amodra@bigpond.net.au>
To: Paul Bame <bame@fc.hp.com>
Cc: parisc-linux@parisc-linux.org
Message-ID: <20011027104824.C1050@bubble.sa.bigpond.net.au>
References: <E15xFJt-0006F5-00@noam.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E15xFJt-0006F5-00@noam.fc.hp.com>; from bame@fc.hp.com on Fri, Oct 26, 2001 at 04:19:17PM -0600
Subject: [parisc-linux] Re: python (toolchain really) problems
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

On Fri, Oct 26, 2001 at 04:19:17PM -0600, Paul Bame wrote:
> 
> One good reason not to upgrade right now is python is broken, but I'm
> pretty sure this is a dynamic linker bug.  I tried my test against
> glibc 2.2.4-4 which is currently in incoming.
> 
> _start is making it's first function call:
> 
> 0x1053c <_start+40>:    ldil 20800,dp
> 0x10540 <_start+44>:    ldo 8(dp),dp
> 0x10544 <_start+48>:    b,l 0x104d4 <_init+56>,rp
> 
> to here:
> 
> 000104d4 <.text>:
>    104d4:       2b 60 00 00     addil 0,dp,%r1
>    104d8:       48 35 02 58     ldw 12c(sr0,r1),r21
>    104dc:       ea a0 c0 00     bv r0(r21)
>    104e0:       48 33 02 60     ldw 130(sr0,r1),r19

I agree that it looks like a dynamic linker problem.  For those who might
be confused about how the above stub can lead to an IAOQ of 0x00c0ffee
with r21 = 0xdeadbeef, the explanation is that a little more code has
run than Paul showed.  The address stored at 0x20800+0x12c is that of
the lazy linking .plt stub, which looks like

1: ldw	0(%r20),%r22
   bv	%r0(%r22)
   ldw	4(%r20),%r21
start_here:
   b,l	1b,%r20
   depi	0,31,2,%r20
  .word	fixup_func	initialised to 0x00c0ffee by the linker
  .word	fixup_ltp	initialised to 0xdeadbeef

so for some reason the dynamic linker has failed to replace the fixup_func
dummy value with the real value.  See glibc/sysdeps/hppa/dl_machine.h:
elf_machine_runtime_setup for where this is supposed to happen.  From
the symptoms that Paul has shown here, I'd guess that DT_JMPREL or
DT_PLTRELSZ are missing/zero in Paul's binary, or that for some other
reason, elf_machine_runtime_setup hasn't even been called.

BTW, I don't think lazy linking has ever been tested because dl-machine.h
failed to define ELF_MACHINE_PLTREL_OVERLAP.  This had the unfortunate
effect of always fully relocating .plt.

Anyway, I hope the above explanation is enough for someone to track down
the problem if I don't find time.

Alan

> r21 contains '0xdeadbeef' -- here are the details:
> 
> do_page_fault() pid=16052 command='python2' type=6 address=0x00c0ffef
> vm_start = 0x00020000, vm_end = 0x00021000
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001101111111100001111
> r0-3     0000000000000000 0000000000020808 000000000001054f 0000000040029abc
> r4-7     000000004024d048 00000000000bfef0 00000000000bfc30 00000000000bfc30
> r8-11    00000000ffffffff 00000000000b9010 00000000000bfd70 00000000000bfcb0
> r12-15   0000000000000000 00000000ffffffff 00000000000bfcf0 0000000000000000
> r16-19   0000000000000000 0000000000000004 0000000000000004 0000000000020808
> r20-23   0000000000020958 00000000deadbeef 0000000000c0ffee 000000000002090e
> r24-27   00000000bff003b8 0000000000000001 0000000000020916 0000000000020808
> r28-31   0000000000000000 000000007efefeff 00000000bff00580 000000004000ddf7
> sr0-3    0000000000001c80 0000000000001c80 0000000000000000 0000000000001c80
> sr4-7    0000000000001c80 0000000000001c80 0000000000001c80 0000000000001c80
> 
> IASQ: 0000000000001c80 0000000000001c80 IAOQ: 0000000000c0ffef 0000000000c0fff3
>  IIR: 43ffff80    ISR: 0000000000001c80  IOR: 000000004033a08c
>  CPU:        0   CR30: 0000000013f24000 CR31: 0000000010450000
>  ORIG_R28: 00000000bff00b08
