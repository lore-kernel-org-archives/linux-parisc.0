Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp7.xs4all.nl (smtp7.xs4all.nl [194.109.127.133])
	by dsl2.external.hp.com (Postfix) with ESMTP id 145C6482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Sep 2001 12:39:08 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp7.xs4all.nl (8.9.3/8.9.3) with ESMTP id UAA06639
	for <parisc-linux@lists.parisc-linux.org>; Thu, 6 Sep 2001 20:39:01 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Thu, 6 Sep 2001 20:30:16 +0200
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010906203016.A19723@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Trace/Breakpoint trap - results with #define DEBUG_SIG 1
List-ID: <linux-parisc.vger.kernel.org>

After setting #define DEBUG_SIG to 1 in arch/parisc/kernel/signal.c, I
see the following messages in /var/log/messages just before the crash:

usp: 0xbff02488 stack bff022a0returning to 0x40106c5f
in sys_rt_sigreturn:
Sep  6 22:03:52 pa8200 kernel: do_signal(oldset=0x00000000, regs=0x2ef78258, sr7 0x21c, pending 1, in_syscall=1
Sep  6 22:03:52 pa8200 kernel: do_signal: oldsedo_signal(oldset=0x00000000, regs=0x2efd0258, sr7 0x229, pending 1, in_syscall=1
t 00000000:00000do_signal: oldset 00000000:00000000
000
Sep  6 22:0do_signal: signr=18, pid=159
3:52 pa8200 kernsa_handler is 40dae
el: do_signal: sERESTARTSYS: putting -EINTR
ignr=18, pid=160handle_signal(sig=18, ka=2efd41d4, info=2efd0508, oldset=2efd0444, regs=2efd0258)

Sep  6 22:03:5setup_rt_frame 1: frame bff02598 info 2efd0508
2 pa8200 kernel:setup_sigcontext: iaoq 0x40106c5f/0x40106c5f
 sa_handler is 9setup_sigcontext: r28 is -4
abda
Sep  6 22:flushing 64 bytes at space 0x229 offset bff02598
03:52 pa8200 kermaking sigreturn frame: 0xbff02598 + 0x280 = 0xbff02818
nel: handle_signSIG deliver (make:159): frame=0xbff02598 sp=0xbff02818 iaoq=0x185ff/0x18603 rp=0xbff02598
al(sig=18, ka=2edo_signal(oldset=0x00000000, regs=0x2efd0258, sr7 0x229, pending 1, in_syscall=0
do_signal: oldset 00020000:00000000
do_signal: signr=5, pid=159
sa_handler is 0
do_signal(oldset=0x00000000, regs=0x100bc258, sr7 0x1f5, pending 1, in_syscall=1
do_signal: oldset 00000000:00000000
do_signal: signr=18, pid=1
sa_handler is 280f6
ERESTARTNOHAND: returning -EINTR
handle_signal(sig=18, ka=2fefae14, info=100bc508, oldset=100bc444, regs=100bc258)
setup_rt_frame 1: frame faf00940 info 100bc508
setup_sigcontext: iaoq 0x4010e4b7/0x4010e4b7
setup_sigcontext: r28 is -4
flushing 64 bytes at space 0x1f5 offset faf00940
making sigreturn frame: 0xfaf00940 + 0x280 = 0xfaf00bc0
SIG deliver (init:1): frame=0xfaf00940 sp=0xfaf00bc0 iaoq=0x400b7f47/0x400b7f4b rp=0xfaf00940
in sys_rt_sigreturn, frame is faf00940
restore_sigcontext: r28 is -4
usp: 0xfaf00bc0 stack faf009d8returning to 0x4010e4b7
in sys_rt_sigreturn:
do_signal(oldset=0x00000000, regs=0x2f108258, sr7 0x212, pending 1, in_syscall=1
do_signal: oldset 00000000:00000000
do_signal: signr=18, pid=154
sa_handler is 9abda
handle_signal(sig=18, ka=2fefb694, info=2f108508, oldset=2f108444, regs=2f108258)
setup_rt_frame 1: frame bff00680 info 2f108508
setup_sigcontext: iaoq 0x401397b3/0x401397b3
setup_sigcontext: r28 is 0
flushing 64 bytes at space 0x212 offset bff00680
making sigreturn frame: 0xbff00680 + 0x280 = 0xbff00900
SIG deliver (bash:154): frame=0xbff00680 sp=0xbff00900 iaoq=0x4017cbfb/0x4017cbff rp=0xbff00680
in sys_rt_sigreturn, frame is bff00680
restore_sigcontext: r28 is 0
usp: 0xbff00900 stack bff00718returning to 0x401397b3
in sys_rt_sigreturn:

Is there anything obviously wrong? Would more output be needed?

Greetings,
Jurriaan
-- 
We carry in our hearts the true country
And that cannot be stolen
We follow in the steps of our ancestry
And that cannot be broken
   Midnight Oil - The dead heart.
GNU/Linux 2.4.9-ac7 SMP/ReiserFS 2x1402 bogomips load av: 6.86 4.43 2.05
