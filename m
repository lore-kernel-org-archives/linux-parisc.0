Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.istop.com (cpu1693.adsl.bellglobal.com [206.47.27.174])
	by dsl2.external.hp.com (Postfix) with ESMTP id 880F2486B
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Mar 2002 09:17:43 -0700 (MST)
Received: from old@istop.magma.ca (herbr.istop.com [216.187.107.13])
	by ns.istop.com (Postfix) with ESMTP id 61FD21705A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Mar 2002 11:17:57 -0500 (EST)
Message-Id: <5.1.0.14.0.20020307110937.026af020@mail.magma.ca>
Date: Thu, 07 Mar 2002 11:17:28 -0500
To: parisc-linux@lists.parisc-linux.org
From: Herb Radford <herbr@magma.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: [parisc-linux] J3515 10/100 NIC
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

I have a (brand new) 10/100 ethernet card that I was hoping to use in a D360.
This would give the D360 a little boost in throughput!
When I inserted it and did an "IN ALL", the card was listed as a "DMA I/O" 
at path 8/8. When I booted the scan found an HSC-PCI card.
However nothing else happens. Is this supported? Do I have to reconfigure 
the kernel somehow?

Here are the 2 selected parts of the PDC output and the I/O scan:

I/O MODULE INFORMATION


                                                                    IODC   IODC

Path (dec)   Type                Bus Slot Mod HVERSION  SVERSION   Vers   Dep

----         ----                --- ---- --- -------- ---------- ------ ------

8            I/O Adapter           0   2   0   0x580f  0x10000b50  0x00   0x00

8/4          A DMA I/O             1   1   0   0x0131  0x00008980  0x98   0x00

8/8          A DMA I/O             1   2   0   0x0040  0x00009d80  0x00   0x00

8/16         Bus Adapter           1   4   0   0x02f0  0x00008100  0x00   0x00

8/16/4       Built-in RS232       16   1   0   0x02f0  0x00008c00  0x00   0x00

8/16/5       Built-in SE SCSI     16   1   1   0x02f0  0x00008280  0x01   0x00

8/16/6       Built-in LAN         16   1   2   0x02f0  0x00008a00  0x02   0x00

8/16/0       Built-in Parallel    16   0   0   0x02f0  0x00007400  0x00   0x00

8/16/7       Built-in Keyboard    16   1   3   0x02f0  0x00008400  0x00   0x00

8/16/8       Built-in Mouse       16   2   0   0x02f0  0x00008400  0x00   0x00

8/20         Bus Adapter           1   5   0   0x0310  0x00008e00  0x00   0x00

8/20/5       Bus Adapter          20   1   1   0x0310  0x00009000  0x00   0x00

8/20/2       RS232 Port           20   0   2   0x0310  0x00008c00  0x00   0x00

10           I/O Adapter           0   2   2   0x580f  0x10000b50  0x00   0x00



<Press any key to continue (q to quit)>






Found devices:

1. U2-IOA BC Runway Port (12) at 0xfff88000 [8], versions 0x580, 0xf, 0xb

2. Bluefish Add-on FW-SCSI (4) at 0xf1004000 [8/4], versions 0x13, 0x1, 0x89

3. HP HSC-PCI Cards (4) at 0xf1008000 [8/8], versions 0x4, 0x0, 0x9d

4. UL 550 Lasi Core BA (11) at 0xffd00000 [8/16], versions 0x2f, 0x0, 
0x81,  additional addresses: 0xffc00000

5. UL 550 Core Centronics (10) at 0xffd02000 [8/16/0], versions 0x2f, 0x0, 
0x74,  additional addresses: 0xffd03000

6. UL 550 Lasi Core RS-232 (10) at 0xffd05000 [8/16/4], versions 0x2f, 0x0, 
0x8c

7. UL 550 Core SCSI (10) at 0xffd06000 [8/16/5], versions 0x2f, 0x0, 0x82

8. UL 350 Core LAN (802.3) (10) at 0xffd07000 [8/16/6], versions 0x2f, 0x0, 
0x8a

9. UL 550 Core PS/2 Port (10) at 0xffd08000 [8/16/7], versions 0x2f, 0x0, 0x84

10. UL 550 Core PS/2 Port (10) at 0xffd08100 [8/16/8], versions 0x2f, 0x0, 0x84

11. UL 550 Core Wax BA (11) at 0xffe00000 [8/20], versions 0x31, 0x0, 0x8e

12. UL 550 Wax Core RS-232 (10) at 0xffe02000 [8/20/2], versions 0x31, 0x0, 
0x8c

13. UL 550 Wax EISA BA (11) at 0xfc000000 [8/20/5], versions 0x31, 0x0, 0x90

14. U2-IOA BC GSC+ Port (7) at 0xf103f000 [8/63], versions 0x501, 0x1, 0xc

15. U2-IOA BC Runway Port (12) at 0xfff8a000 [10], versions 0x580, 0xf, 0xb

16. U2-IOA BC GSC+ Port (7) at 0xf183f000 [10/63], versions 0x501, 0x1, 0xc

17. UL 1w U160 512K/512K (861/D270,D370) (0) at 0xfffa0000 [32], versions 
0x5a2, 0x0, 0x4

18. UL 1 way U160 512K/512K memory (1) at 0xfffb1000 [49], versions 0x76, 
0x0, 0x9

CPU(s): 1 x PA8000 (PCX-U) at 160.000000 MHz

ccio found U2 at 0xfff88000

ccio found U2 at 0xfff8a000




Regards, Herb
