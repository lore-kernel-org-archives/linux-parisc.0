Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp7.xs4all.nl (smtp7.xs4all.nl [194.109.127.133])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6E9D6482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Sep 2001 04:24:03 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp7.xs4all.nl (8.9.3/8.9.3) with ESMTP id MAA03501
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Sep 2001 12:24:01 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Tue, 18 Sep 2001 07:38:55 +0200
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] nmap -O -> kernel panic on 712
Message-ID: <20010918073855.A11627@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
References: <20010917165501.B17483@gollum.intranet.nimag.net> <20010917203312.A6109@middle.of.nowhere> <20010918002427.C17483@gollum.intranet.nimag.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010918002427.C17483@gollum.intranet.nimag.net>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Sep 18, 2001 at 12:24:28AM +0200, Francois Deppierraz wrote:
> ludwig:/boot# objdump -d /boot/vmlinux-2.4.9-pa20 | grep -C -40 10281658
> 102815b8:       37 5a 08 78     ldo 43c(r26),r26
> 102815bc:       34 13 00 1c     ldi e,r19
> 102815c0:       e8 1f 1e 2d     b,l 102814dc <tcp_parse_options+0xc4>,r0
> 102815c4:       60 b3 02 08     stb r19,104(sr0,r5)
> 102815c8:       8c 64 3e 25     cmpib,<> 2,r3,102814e0 <tcp_parse_options+0xc8>
> 102815cc:       08 64 0a 13     add,l r4,r3,r19
> 102815d0:       0c f8 10 93     ldw  c(sr0,r7),r19
> 102815d4:       09 53 02 13     and r19,r10,r19
> 102815d8:       86 60 3e 05     cmpib,= 0,r19,102814e0 <tcp_parse_options+0xc8>
> 102815dc:       08 64 0a 13     add,l r4,r3,r19
> 102815e0:       8d 00 3d ff     cmpib,<>,n 0,r8,102814e4 <tcp_parse_options+0xcc>
> 102815e4:       36 64 3f fd     ldo -2(r19),r4
> 102815e8:       2b 61 50 00     addil 42800,dp,%r1
> 102815ec:       48 33 0a 70     ldw 538(sr0,r1),r19
> 102815f0:       86 60 3d d5     cmpib,= 0,r19,102814e0 <tcp_parse_options+0xc8>
> 102815f4:       08 64 0a 13     add,l r4,r3,r19
> 102815f8:       60 a9 02 04     stb r9,102(sr0,r5)
> 102815fc:       60 a0 02 34     stb r0,11a(sr0,r5)
> 10281600:       60 a0 02 36     stb r0,11b(sr0,r5)
> 10281604:       e8 1f 1d ad     b,l 102814e0 <tcp_parse_options+0xc8>,r0
> 10281608:       60 a0 02 9a     stb r0,14d(sr0,r5)
> 1028160c:       8c 72 5d 9d     cmpib,>= 9,r3,102814e0 <tcp_parse_options+0xc8>
> 10281610:       08 64 0a 13     add,l r4,r3,r19
> 10281614:       34 73 3f fd     ldo -2(r3),r19
> 10281618:       d2 73 1b fd     extrw,u r19,31,3,r19
> 1028161c:       8e 60 3d 7d     cmpib,<> 0,r19,102814e0 <tcp_parse_options+0xc8>
> 10281620:       08 64 0a 13     add,l r4,r3,r19
> 10281624:       40 b3 02 04     ldb 102(sr0,r5),r19
> 10281628:       86 60 3d 5d     cmpib,= 0,r19,102814dc <tcp_parse_options+0xc4>
> 1028162c:       08 e4 04 13     sub r4,r7,r19
> 10281630:       36 73 3f fd     ldo -2(r19),r19
> 10281634:       e8 1f 1d 45     b,l 102814dc <tcp_parse_options+0xc4>,r0
> 10281638:       61 73 00 92     stb r19,49(sr0,r11)
> 1028163c:       8c 74 3d 3d     cmpib,<> a,r3,102814e0 <tcp_parse_options+0xc8>
> 10281640:       08 64 0a 13     add,l r4,r3,r19
> 10281644:       85 00 20 42     cmpib,=,n 0,r8,1028166c <tcp_parse_options+0x254>
> 10281648:       40 b3 02 00     ldb 100(sr0,r5),r19
> 1028164c:       86 60 3d 1d     cmpib,= 0,r19,102814e0 <tcp_parse_options+0xc8>
> 10281650:       08 64 0a 13     add,l r4,r3,r19
> 10281654:       60 a9 02 06     stb r9,103(sr0,r5)
> 10281658:       0c 80 10 93     ldw  0(sr0,r4),r19
and there it seems to have crashed
> 
> Here it is, anything else needed ?
> 
A basic understanding of parisc assembly would help me :-)
At this point, newbies like you and me can only hope one of the real
kernel hackers sees this and says 'A-ha!'.

If I look at that code, I see a lot of (__u16 *)ptr and the like.

Am I correct in assuming those are all suspects and this is just another
example of the missing unaligned access trap haunting us?

Jurriaan
-- 
"You were warned, fool. Now I will teach you to profit
 from such courtesies when they are offered."
	Stephen R Donaldson - By Another Name
GNU/Linux 2.4.9-ac10 SMP/ReiserFS 2x1402 bogomips load av: 0.02 0.03 0.00
