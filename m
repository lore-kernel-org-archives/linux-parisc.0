Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from amsfep14-int.chello.nl (amsfep14-int.chello.nl [213.46.243.22])
	by dsl2.external.hp.com (Postfix) with ESMTP id C0B4B4831
	for <parisc-linux@lists.parisc-linux.org>; Fri, 25 Apr 2003 11:16:58 -0600 (MDT)
Received: from gatekeeper ([213.46.122.180]) by amsfep14-int.chello.nl
          (InterMail vM.5.01.05.17 201-253-122-126-117-20021021) with ESMTP
          id <20030425171656.ZAWJ11499.amsfep14-int.chello.nl@gatekeeper>
          for <parisc-linux@lists.parisc-linux.org>;
          Fri, 25 Apr 2003 19:16:56 +0200
Received: from laptop ([10.0.3.2] ident=arjen)
	by gatekeeper with esmtp (Exim 3.35 #1 (Debian))
	id 1996ud-0001aW-00
	for <parisc-linux@lists.parisc-linux.org>; Fri, 25 Apr 2003 19:23:03 +0200
From: Arjen Hommersom <arjenh@chello.nl>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] sstfb crash
Date: Fri, 25 Apr 2003 18:13:33 +0200
References: <200304251408.39242.arjenh@chello.nl> <3EA96903.3050808@tiscali.be>
In-Reply-To: <3EA96903.3050808@tiscali.be>
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_t6Vq+MbF0sxL4lc"
Message-Id: <200304251813.33948.arjenh@chello.nl>
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

--Boundary-00=_t6Vq+MbF0sxL4lc
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 25 April 2003 18:57, Joel Soete wrote:
> >I just tried to test my Voodoo2 card on a C240 machine. I compiled
> > 2.4.20-pa32 and set CONFIG_FB_VOODOO1=m. The compiler was 3.0.4.
> > Unfortunately it crashes when i try to load it. The following messages
> > appear just before it locks up hard: [dump]
>
> It would be also of good help if you try to run the dump_analyser.sh (T.
> Varene) on this 'dump' with your kernel.

Thanks for your reply. I have attached the output of the dump_analyser.

regards,
Arjen Hommersom
--Boundary-00=_t6Vq+MbF0sxL4lc
Content-Type: text/plain;
  charset="iso-8859-1";
  name="dumpoutput.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="dumpoutput.txt"

IAOQ = 10135394
Func: kfree, Off: 34, Addr: 0x10135394
10135390:	00 01 0d 60 	ssm 1,r0
10135394:	35 d3 00 30 	ldo 18(r14),r19
10135398:	4a 63 00 c8 	ldw 64(r19),r3
1013539c:	36 73 00 c8 	ldo 64(r19),r19

GR0 = 00000000

GR1 = 102ad810
Func: vm_table, Off: c, Addr: 0x102ad810
102ad810:	92 e0 b0 64 	cmpiclr,>> 32,r23,r0
102ad814:	34 17 00 64 	ldi 32,r23
102ad818:	8a e6 80 48 	cmpb,>>= r6,r23,102ad844 <tcp_retransmit_timer+0xe4>
102ad81c:	34 05 00 02 	ldi 1,r5

GR2 = 101f5f68
Func: fb_alloc_cmap, Off: 3c, Addr: 0x101f5f68
101f5f60:	eb f8 1d 9c 	b,l 10227e34 <sr_audio_ioctl+0x2b4>,r31
101f5f64:	0b 83 0a 03 	add,l r3,ret0,r3
101f5f68:	08 1d 02 5a 	copy ret1,r26
101f5f6c:	08 ba 0a 1a 	add,l r26,r5,r26

GR3 = 1ebe5ab4

GR4 = 00000000

GR5 = 00000000

GR6 = 00000000

GR7 = 1ebe5800

GR8 = ffffffff

GR9 = 1ec64810

GR10 = 6269745f

GR11 = 1ebaa000

GR12 = 1fdabcc0

GR13 = 1ec64550

GR14 = 000435a8

GR15 = 00042da8

GR16 = 00042da8

GR17 = 00042da8

GR18 = 000521c8

GR19 = 00450192

GR20 = 001f5dce

GR21 = 2bb0e9ab

GR22 = eae3e71d

GR23 = 745f6c6f

GR24 = 00000000

GR25 = 00000000

GR26 = 745f6c6f

GR27 = 10292010
Func: $global$, Off: 0, Addr: 0x10292010
10292010:	6f cd 01 00 	stw,ma r13,80(sp)

GR28 = 0000000f

GR29 = f3000000

GR30 = 1ec64900

GR31 = 101f20d4
Func: pci_write_config_dword, Off: 40, Addr: 0x101f20d4
101f20d0:	0a 98 02 14 	and r24,r20,r20
101f20d4:	34 13 00 80 	ldi 40,r19
101f20d8:	82 93 20 70 	cmpb,= r19,r20,101f2118 <set_geometry_intr+0x70>
101f20dc:	34 1c 00 00 	ldi 0,ret0

Kernel symbols on the stack:
[<10159e6c>]: Func: seq_read, Off: 318, Addr: 0x10159e6c
[<0003242c>]: 
[<0003556c>]: 
[<00032adc>]: 
[<000355cc>]: 
[<0003556c>]: 
[<00034fee>]: 
[<00034940>]: 
[<00034fb4>]: 
[<0003556c>]: 
[<000355a4>]: 
[<101f1ac8>]: Func: pci_announce_device, Off: 60, Addr: 0x101f1ac8
[<000355a4>]: 
[<101f1b90>]: Func: pci_register_driver, Off: 98, Addr: 0x101f1b90
[<000355a4>]: 
[<000345c8>]: 
[<1011cff0>]: Func: sys_init_module, Off: 640, Addr: 0x1011cff0
[<101049fc>]: Func: handle_interruption, Off: 150, Addr: 0x101049fc
[<00032060>]: 
[<10109f90>]: Func: syscall_exit, Off: 0, Addr: 0x10109f90
[<0002b800>]: 
[<10109084>]: Func: intr_check_sig, Off: 0, Addr: 0x10109084
[<10108cf4>]: Func: _switch_to_ret, Off: 0, Addr: 0x10108cf4
[<1013eaac>]: Func: chrdev_open, Off: 54, Addr: 0x1013eaac
[<1013d610>]: Func: dentry_open, Off: 1e8, Addr: 0x1013d610
[<1014db28>]: Func: locate_fd, Off: 88, Addr: 0x1014db28
[<1011f77c>]: Func: it_real_fn, Off: 0, Addr: 0x1011f77c

Done.

--Boundary-00=_t6Vq+MbF0sxL4lc--
