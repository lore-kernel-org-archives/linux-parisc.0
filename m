Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 71DD94A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Feb 2001 17:42:19 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: PL <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Warnings compiling the CVS kernel
Date: Thu, 22 Feb 2001 01:43:43 +0100
References: <3A9369CF.C7DDC195@neuronet.pitt.edu>
In-Reply-To: <3A9369CF.C7DDC195@neuronet.pitt.edu>
MIME-Version: 1.0
Message-Id: <01022201400100.16704@P100.helgenet.de>
List-ID: <linux-parisc.vger.kernel.org>

On Wednesday 21 February 2001 08:10, Rafael E. Herrera wrote:
>
> The compilation succeeds but the boot will crash here:
>
> [...]
> POSIX conformance testing by UNIFIX
>
>
> Dumping Stack from 14000000 to 14000240:
>
> Dumping Stack from 1026e000 to 1026e700:
[stack dump removed] 
> Kernel Fault: Code=15 regs=1026e4c0 (Addr=14000008)
>
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001000000000000001110
> r0-3     00000000 102ea000 10102ba8 14000000
> r4-7     14000240 1023a800 00000000 00000002
> r8-11    19a10000 00000005 00000000 00000005
> r12-15   00000004 00000006 00000008 00000006
> r16-19   1026e080 00000002 00000000 102ea000
> r20-23   00000000 00000060 00000001 00000002
> r24-27   00000001 00000001 1027b484 10266000
> r28-31   0000002a 015752a0 1026e700 00000060
> sr0-3    00000000 00000000 00000000 00000000
> sr4-7    00000000 00000000 00000000 00000000
>
> IASQ: 00000000 00000000 IAOQ: 10102b10 10102b14
>  IIR: 0c701093    ISR: 00000000  IOR: 14000008
> ORIG_R28: 00000000

I have the same problem on a 715/64.
I tried to find the reason for that problem, but since I'm no professional in 
parisc-assembler I'm some kind of stuck here right now.

As far as I've tested, the following patch (HACK!) to 
ret_from_kernel_thread() against CVS head gets me at least to the 
init-process (where it then crashes).

diff -u -r1.72 entry.S
--- entry.S     2001/02/20 02:19:52     1.72
+++ entry.S     2001/02/22 00:18:13
@@ -509,10 +509,12 @@
 
        /* Call schedule_tail first though */
 
+#if 0
        b,l     schedule_tail, %r2
        ldo     64(%r30), %r30
 
        ldo     -64(%r30), %r30
+#endif
        LDREG   TASK_PT_GR26-TASK_SZ_ALGN(%r30), %r1
        LDREG   TASK_PT_GR25-TASK_SZ_ALGN(%r30), %r26
        ble     0(%sr7, %r1)

I know this is *NOT* the correct patch, but AFAIT this means that 
something on the stack (return adress or the pointer to struct task_struct 
*prev for schedule_tail ?) isn't set up properly for 32bit PA ?

I know, that this isn't much information, but maybe this can give someone 
here on the list a clue, where the problem could be ?

Thanks,
Helge
