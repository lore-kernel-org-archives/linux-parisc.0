Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from oscar.intranet.nimag.net (slipknot.nimag.net [195.202.197.141])
	by dsl2.external.hp.com (Postfix) with SMTP id 19DDF482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Sep 2001 16:24:30 -0600 (MDT)
Date: Tue, 18 Sep 2001 00:24:28 +0200
From: Francois Deppierraz <francois@ctrlaltdel.ch>
To: thunder7@xs4all.nl
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] nmap -O -> kernel panic on 712
Message-ID: <20010918002427.C17483@gollum.intranet.nimag.net>
References: <20010917165501.B17483@gollum.intranet.nimag.net> <20010917203312.A6109@middle.of.nowhere>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <20010917203312.A6109@middle.of.nowhere>
Sender: Francois Deppierraz <francois@ctrlaltdel.ch>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Sep 17, 2001 at 08:33:12PM +0200, thunder7@xs4all.nl wrote:

> Let's first find out what happened. Paste a small part of your
> System.map file for this kernel (like 10 lines) with the address
> 10281658 somewhere in the middle. Then do 

I didn't found 10281658 in System.map.

ludwig:/boot# grep -C -10 102816 /boot/System.map-2.4.9-pa20
10280d7c t .L2469
10280d8c t .L2470
10280dcc t .L2471
10280ed0 t .L2472
10280f00 t tcp_ack_probe
10280ff0 t tcp_ack_update_window
10281104 t tcp_ack
1028114c t .L2521
102811b4 t .L2569
10281418 T tcp_parse_options
1028168c t tcp_disordered_ack
1028173c t tcp_reset
1028179c t .L2659
10281828 t .L2676
10281850 t tcp_fin
10281910 t .L2678
10281914 t .L2720
1028195c t .L2756
10281ae4 t .L2757
10281af8 t .L2758
10281af8 t tcp_send_dupack
ludwig:/boot# 

> objdump -d <your kernel> and grep for say 40 lines around 10281658. It
> helps if there are some calls in that part, so you can see where we are
> in the kernel. 

ludwig:/boot# objdump -d /boot/vmlinux-2.4.9-pa20 | grep -C -40 10281658
102815b8:       37 5a 08 78     ldo 43c(r26),r26
102815bc:       34 13 00 1c     ldi e,r19
102815c0:       e8 1f 1e 2d     b,l 102814dc <tcp_parse_options+0xc4>,r0
102815c4:       60 b3 02 08     stb r19,104(sr0,r5)
102815c8:       8c 64 3e 25     cmpib,<> 2,r3,102814e0 <tcp_parse_options+0xc8>
102815cc:       08 64 0a 13     add,l r4,r3,r19
102815d0:       0c f8 10 93     ldw  c(sr0,r7),r19
102815d4:       09 53 02 13     and r19,r10,r19
102815d8:       86 60 3e 05     cmpib,= 0,r19,102814e0 <tcp_parse_options+0xc8>
102815dc:       08 64 0a 13     add,l r4,r3,r19
102815e0:       8d 00 3d ff     cmpib,<>,n 0,r8,102814e4 <tcp_parse_options+0xcc>
102815e4:       36 64 3f fd     ldo -2(r19),r4
102815e8:       2b 61 50 00     addil 42800,dp,%r1
102815ec:       48 33 0a 70     ldw 538(sr0,r1),r19
102815f0:       86 60 3d d5     cmpib,= 0,r19,102814e0 <tcp_parse_options+0xc8>
102815f4:       08 64 0a 13     add,l r4,r3,r19
102815f8:       60 a9 02 04     stb r9,102(sr0,r5)
102815fc:       60 a0 02 34     stb r0,11a(sr0,r5)
10281600:       60 a0 02 36     stb r0,11b(sr0,r5)
10281604:       e8 1f 1d ad     b,l 102814e0 <tcp_parse_options+0xc8>,r0
10281608:       60 a0 02 9a     stb r0,14d(sr0,r5)
1028160c:       8c 72 5d 9d     cmpib,>= 9,r3,102814e0 <tcp_parse_options+0xc8>
10281610:       08 64 0a 13     add,l r4,r3,r19
10281614:       34 73 3f fd     ldo -2(r3),r19
10281618:       d2 73 1b fd     extrw,u r19,31,3,r19
1028161c:       8e 60 3d 7d     cmpib,<> 0,r19,102814e0 <tcp_parse_options+0xc8>
10281620:       08 64 0a 13     add,l r4,r3,r19
10281624:       40 b3 02 04     ldb 102(sr0,r5),r19
10281628:       86 60 3d 5d     cmpib,= 0,r19,102814dc <tcp_parse_options+0xc4>
1028162c:       08 e4 04 13     sub r4,r7,r19
10281630:       36 73 3f fd     ldo -2(r19),r19
10281634:       e8 1f 1d 45     b,l 102814dc <tcp_parse_options+0xc4>,r0
10281638:       61 73 00 92     stb r19,49(sr0,r11)
1028163c:       8c 74 3d 3d     cmpib,<> a,r3,102814e0 <tcp_parse_options+0xc8>
10281640:       08 64 0a 13     add,l r4,r3,r19
10281644:       85 00 20 42     cmpib,=,n 0,r8,1028166c <tcp_parse_options+0x254>
10281648:       40 b3 02 00     ldb 100(sr0,r5),r19
1028164c:       86 60 3d 1d     cmpib,= 0,r19,102814e0 <tcp_parse_options+0xc8>
10281650:       08 64 0a 13     add,l r4,r3,r19
10281654:       60 a9 02 06     stb r9,103(sr0,r5)
10281658:       0c 80 10 93     ldw  0(sr0,r4),r19
1028165c:       68 b3 02 10     stw r19,108(sr0,r5)
10281660:       0c 88 10 94     ldw  4(sr0,r4),r20
10281664:       e8 1f 1c e5     b,l 102814dc <tcp_parse_options+0xc4>,r0
10281668:       68 b4 02 18     stw r20,10c(sr0,r5)
1028166c:       2b 61 50 00     addil 42800,dp,%r1
10281670:       48 33 0a 60     ldw 530(sr0,r1),r19
10281674:       8e 60 3f bf     cmpib,<>,n 0,r19,10281658 <tcp_parse_options+0x240>
10281678:       60 a9 02 06     stb r9,103(sr0,r5)
1028167c:       e8 1f 1c bd     b,l 102814e0 <tcp_parse_options+0xc8>,r0
10281680:       08 64 0a 13     add,l r4,r3,r19
10281684:       e8 1f 1c bd     b,l 102814e8 <tcp_parse_options+0xd0>,r0
10281688:       b4 c6 07 ff     addi -1,r6,r6

1028168c <tcp_disordered_ack>:
1028168c:       4b 35 00 38     ldw 1c(sr0,r25),r21
10281690:       08 1a 02 57     copy r26,r23
10281694:       0e b8 10 93     ldw  c(sr0,r21),r19
10281698:       4b 36 00 78     ldw 3c(sr0,r25),r22
1028169c:       4b 34 00 98     ldw 4c(sr0,r25),r20
102816a0:       c5 73 c0 10     bb,*>= r19,b,102816b0 <tcp_disordered_ack+0x24>
102816a4:       34 1c 00 00     ldi 0,ret0
102816a8:       4b 33 00 80     ldw 40(sr0,r25),r19
102816ac:       82 d3 20 02     cmpb,=,n r19,r22,102816b4 <tcp_disordered_ack+0x28>
102816b0:       e8 40 c0 02     bv,n r0(rp)
102816b4:       0e f0 10 93     ldw  8(sr0,r23),r19
102816b8:       8a d3 3f e5     cmpb,<> r19,r22,102816b0 <tcp_disordered_ack+0x24>
102816bc:       08 00 02 40     nop
102816c0:       4a f3 00 20     ldw 10(sr0,r23),r19
102816c4:       8a 93 3f cd     cmpb,<> r19,r20,102816b0 <tcp_disordered_ack+0x24>
102816c8:       08 00 02 40     nop
102816cc:       42 f3 02 08     ldb 104(sr0,r23),r19
102816d0:       4a f8 00 a0     ldw 50(sr0,r23),r24
102816d4:       0e bc 10 54     ldh  e(sr0,r21),r20
102816d8:       96 73 00 3e     subi 1f,r19,r19
102816dc:       01 73 18 40     mtsar r19
102816e0:       0a d8 04 15     sub r24,r22,r21
102816e4:       d6 94 00 00     depw,z r20,%sar,32,r20
102816e8:       86 a0 60 60     cmpib,<= 0,r21,10281720 <tcp_disordered_ack+0x94>
102816ec:       34 19 00 00     ldi 0,r25
102816f0:       34 19 00 02     ldi 1,r25
102816f4:       8f 20 3f 6d     cmpib,<> 0,r25,102816b0 <tcp_disordered_ack+0x24>
102816f8:       34 19 00 c8     ldi 64,r25
102816fc:       4a fa 01 00     ldw 80(sr0,r23),r26
10281700:       4a f3 02 20     ldw 110(sr0,r23),r19
10281704:       d7 5a 09 4a     depw,z r26,21,22,r26
10281708:       eb fd 08 c4     b,l 102bcb70 <$$divU>,r31
1028170c:       4a f4 02 10     ldw 108(sr0,r23),r20
ludwig:/boot# 

> Then post this information!

Here it is, anything else needed ?

Thanks a lot !
-- 
Francois Deppierraz <francois.deppierraz@nimag.net>
Nimag Networks Sàrl - www.nimag.net
PGP Key ID: 9D283BC9
