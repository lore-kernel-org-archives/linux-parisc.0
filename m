From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: Aw: Reproducible kernel panic using gdb
Date: Mon, 28 Oct 2013 10:00:04 +0100
Message-ID: <650fc503e24cdb24b5cc286aec329df6@tuxicoman.be>
References: <b6f8076c32d0859e4ddb328bb7aca076@tuxicoman.be>
 <trinity-f177b623-5ca9-4417-a689-b0f8676e3fb5-1382711499524@3capp-gmx-bs08>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <trinity-f177b623-5ca9-4417-a689-b0f8676e3fb5-1382711499524@3capp-gmx-bs08>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


Hi Helge,

> 
> Works without crash for me on 3.12-rc6 ?
> Linux ls3011 3.12.0-rc6-64bit+
> 
> Since you run 3.10.6, maybe updating the kernel might help.
> Esp. this patch, which has been backported to kernel 3.10 (and is in 
> 3.10.17):
> http://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/commit/?h=linux-3.10.y&id=77587e89405f5d8225a0e750df254bcc2dcb73e1

Still the same problem with 3.12-rc6 here :

Output from the kernel :

terminator ~ # dmesg -n 8
terminator ~ # Backtrace:


Bad Address (null pointer deref?): Code=6 regs=000000007f41d3b0 
(Addr=0000000000000000)
CPU: 0 PID: 1536 Comm: gdb-crash Not tainted 3.12.0-rc6 #1
task: 000000007f41d038 ti: 000000413eb00000 task.ti: 000000413eb00000

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111111000001111 Not tainted
r00-03  000000ff0006fe0f 0000000000000000 0000000000000000 
00000000faf02300
r04-07  0000000040a53b30 0000000000000000 00000000000c8e98 
00000000000c7a80
r08-11  00000000000c8e70 00000000000c8e70 000000000000006c 
0000000000000061
r12-15  00000000000c3100 0000000000000000 00000000000bf100 
00000000000c0900
r16-19  0000000000000000 00000000000c0900 000000000009f000 
0000000000000000
r20-23  0000000000010638 0000000000000000 0000000000010638 
0000000040a511b8
r24-27  00000000faf02034 00000000faf0202c 0000000000000000 
00000000000110e4
r28-31  00000000faf0230c 0000000000000001 0000000000000000 
0000000040403327
sr00-03  00000000002fc800 00000000002fc800 0000000000000000 
00000000002fc800
sr04-07  00000000002fc800 00000000002fc800 00000000002fc800 
00000000002fc800

IASQ: 00000000002fc800 00000000002fc800 IAOQ: 0000000000000000 
0000000000000004
  IIR: 43ffff80    ISR: 0000000010250000  IOR: 000003f7a5b02308
  CPU:        0   CR30: 000000413eb00000 CR31: fe1eec3fc1ecdbed
  ORIG_R28: 0000000000000000
  IAOQ[0]:           (null)
  IAOQ[1]: 0x4
  RP(r2):           (null)
Backtrace:

Kernel panic - not syncing: Bad Address (null pointer deref?)
Rebooting in 5 seconds..



Output from gdb :
(gdb) break gdb-crash.c:24
Breakpoint 1 at 0x10660: file gdb-crash.c, line 24.
(gdb) run
Starting program: /root/gdb-crash

Breakpoint 1, main () at gdb-crash.c:25
25              printf("Test is %u, %u\n", tv.a, tv.b);
(gdb) set tp = { 0,0}



Regards,
   Guy


