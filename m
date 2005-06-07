From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [PATCH] usb/input/hid-core.c extract() brain damage
Date: Tue, 7 Jun 2005 16:20:19 -0400 (EDT)
Message-ID: <200506072020.j57KKJgU028014@hiauly1.hia.nrc.ca>
References: <4282FEEE0000A497@mail-5-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: kyle@cabal.ca,
 parisc-linux@parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4282FEEE0000A497@mail-5-bnl.tiscali.it> from "Joel Soete" at Jun
	7, 2005 07:14:20 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > Sorry it didn't help for me (on a b180 with kernel 2.6.12-rc5-pa2 and 2.6.8/include/asm-parisc/unaligned.h)
> > still panicing as usual:

It also didn't help the stability issues that I previously reported
for my c3750 although the mouse and keyboard now work with 2.6.12.

> Definitely, the system already hang with 2.6.9-rc2-pa13.
> As it's a b180, I observe leds on front panel:
>     o heart bit always flicking, 
>     o from time to time lan in/out leds flick also,
>     o power on/off button didn't reach to stop the system
>     o after that only toc buttom reach to restart the server (fwiw nothing
> in piminfo?)

Here's a hand copy TOC dump using 2.6.12-rc5-pa1 with Grant's usb
patch:

General registers
0	00000000	409b4480	1018122c	4ce72ac0
4	00000001	0002e4f8	000007d1	4ce72ac0
8	00000000	0002e500	00000001	fffffff2
12	00000000	000e7508	00000000	00000000
16	000eb8e8	00000000	00000001	40918000
20	00000001	00000000	0002e4fe	4ce72ad6
24	00000000	00000001	4d9f7e00	103dc010
28	00000000	00155cc0	40918140	10180fe8

IIA Space	= 00000000
IIA Offset	= 10181300

r2 points to this bit of code in sys_poll:

101810e8 <sys_poll>:
101810e8:       6b c2 3f d9     stw rp,-14(sp)
101810ec:       37 de 01 00     ldo 80(sp),sp
101810f0:       6b cb 3f 31     stw r11,-68(sp)
101810f4:       6b ca 3f 39     stw r10,-64(sp)
...
1018120c:       8d 00 3f 4f     cmpib,<>,n 0,r8,101811b8 <sys_poll+0xd0>
10181210:       08 08 02 44     copy r8,r4
10181214:       08 0a 02 5a     copy r10,r26
10181218:       08 06 02 57     copy r6,r23
1018121c:       08 07 02 59     copy r7,r25
10181220:       37 d8 3f 11     ldo -78(sp),r24
10181224:       eb ff bb 8d     b,l 10180ff0 <do_poll>,%r2
10181228:       34 0b 3f e5     ldi -e,r11
1018122c:       c8 67 20 9a     movb,=,n r7,r3,10181280 <sys_poll+0x198>

IIA Offset points to this bit of code in do_poll:

101810e8 <sys_poll>:
101810e8:       6b c2 3f d9     stw rp,-14(sp)
101810ec:       37 de 01 00     ldo 80(sp),sp
101810f0:       6b cb 3f 31     stw r11,-68(sp)
101810f4:       6b ca 3f 39     stw r10,-64(sp)
...
10181250:       03 c0 08 b3     mfctl tr6,r19
10181254:       0e 78 10 94     ldw c(,r19),r20
10181258:       8e 80 21 38     cmpib,<> 0,r20,101812fc <sys_poll+0x214>
...
101812f0:       4b c3 3f 71     ldw -48(sp),r3
101812f4:       e8 40 d0 00     bve (rp)
101812f8:       37 de 3f 01     ldo -80(sp),sp
101812fc:       0e d5 d2 40     sth r21,0(sr3,r22)
10181300:       e8 1f 1e bf     b,l,n 10181264 <sys_poll+0x17c>,r0
10181304:       e8 1f 1f 35     b,l 101812a4 <sys_poll+0x1bc>,r0
10181308:       34 0b 3f e5     ldi -e,r11
1018130c:       e8 1f 1d a5     b,l 101811e4 <sys_poll+0xfc>,r0
10181310:       08 1c 02 47     copy ret0,r7
10181314:       e8 1f 1c f5     b,l 10181194 <sys_poll+0xac>,r0
10181318:       d4 df 18 01     depwi,z -1,31,31,r6

1018131c <wait_for_partner>:

The system was still pingable, but ssh and the console didn't work.
No heartbeat was observed.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
