Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA11369
	for <parisc-linux@puffin.external.hp.com>; Fri, 1 Sep 2000 09:45:39 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 1 Sep 2000 15:45:46 -0000
Received: from dhd by localhost with local (Exim 3.12 #1 (Debian))
	id 13UszM-0005w9-00
	for <parisc-linux@thepuffingroup.com>; Fri, 01 Sep 2000 11:44:20 -0400
To: parisc-linux@thepuffingroup.com
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 01 Sep 2000 11:44:20 -0400
Message-ID: <87zolsktgr.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Oops in sim700.c on C360
List-ID: <linux-parisc.vger.kernel.org>

Hi,

Booting on a C360 I get this oops:

Kernel Fault: Code=26 regs=c7f98900 (Addr=00000004)

PSW  : 0004ff0a  GR 1 : c0232800  GR 2 : c01dd3d0  GR 3 : ffd06100
GR 4 : c02ce070  GR 5 : 000002c6  GR 6 : c027b000  GR 7 : c7f8f2e0
GR 8 : c7f8f260  GR 9 : 00000216  GR10 : 00000000  GR11 : 0000000a
GR12 : ffffffff  GR13 : ffffffff  GR14 : c02cd800  GR15 : f0100000
GR16 : f00010bc  GR17 : f0000154  GR18 : f000014c  GR19 : 00000000
GR20 : 00000000  GR21 : 00000000  GR22 : 00000008  GR23 : c028ee80
GR24 : ffffffff  GR25 : 00008000  GR26 : 00000000  GR27 : c0276000
GR28 : c7f8f2e0  GR29 : ffd05800  GR30 : c7f98b40  GR31 : c01f2ed8
SR0  : 00000000  SR1  : 00000000  SR2  : 00000000  SR3  : 00000000
SR4  : 00000000  SR5  : 00000000  SR6  : 00000000  SR7  : 00000000

IASQ : 00000000 00000000 IAOQ : c01dd3dc c01dd3e0 ORIG_R28 : c027c7d4
 IIR : 0e681096 ISR : 00000000 IOR : 00000004

Which matches with this function:

c01dd340 T sim700_init_host

In the disassembly this is:

<sim700.c, line 1664>:

    host = scsi_register(tpnt, sizeof(struct sim700_hostdata));
    hostdata = (struct sim700_hostdata *)host->hostdata;
    memset(hostdata, 0, sizeof(struct sim700_hostdata));
    hostdata->targets = pci_alloc_consistent(NULL, PAGE_SIZE << 3, &dma_addr);
    4c6c:       2b 60 00 00     addil 0,dp,%r1
    4c70:       6b c3 3f 79     stw r3,-44(sr0,sp)
    4c74:       6b c5 3f 69     stw r5,-4c(sr0,sp)
    4c78:       08 19 02 45     copy r25,r5
    4c7c:       34 19 00 60     ldi 30,r25
    4c80:       6b ce 3f 21     stw r14,-70(sr0,sp)
    4c84:       6b ca 3f 41     stw r10,-60(sr0,sp)
    4c88:       08 01 02 4e     copy r1,r14
    4c8c:       6b c8 3f 51     stw r8,-58(sr0,sp)
    4c90:       6b c7 3f 59     stw r7,-54(sr0,sp)
    4c94:       6b cd 3f 29     stw r13,-6c(sr0,sp)
    4c98:       6b cc 3f 31     stw r12,-68(sr0,sp)
    4c9c:       6b cb 3f 39     stw r11,-64(sr0,sp)
    4ca0:       6b c6 3f 61     stw r6,-50(sr0,sp)
    4ca4:       6b c4 3f 71     stw r4,-48(sr0,sp)
    4ca8:       4a 83 00 00     ldw 0(sr0,r20),r3
    4cac:       4a 69 00 00     ldw 0(sr0,r19),r9
    4cb0:       90 60 30 00     cmpiclr,<> 0,r3,r0
    4cb4:       08 18 02 43     copy r24,r3
    4cb8:       91 20 30 00     cmpiclr,<> 0,r9,r0
    4cbc:       08 17 02 49     copy r23,r9
    4cc0:       e8 40 00 00     b,l 4cc8 <sim700_init_host+0x78>,rp
    4cc4:       4b ca 3e 99     ldw -b4(sr0,sp),r10
    4cc8:       08 1c 02 48     copy ret0,r8
    4ccc:       34 19 00 00     ldi 0,r25
    4cd0:       35 07 01 00     ldo 80(r8),r7
    4cd4:       34 18 00 60     ldi 30,r24
    4cd8:       e8 40 00 00     b,l 4ce0 <sim700_init_host+0x90>,rp
    4cdc:       08 07 02 5a     copy r7,r26
    4ce0:       49 d3 00 00     ldw 0(sr0,r14),r19
    4ce4:       34 1a 00 00     ldi 0,r26
    4ce8:       23 24 00 00     ldil 8000,r25
    4cec:       0e 68 10 96     ldw  4(sr0,r19),r22
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  This instruction here
    4cf0:       37 d8 3f 11     ldo -78(sp),r24
    4cf4:       e6 c0 20 00     be,l 0(sr4,r22),%sr0,%r31
    4cf8:       08 1f 02 42     copy r31,rp

Looks like pci_alloc_consistent is broken...

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
