From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] D380: ccio-dma issue for 64bit kernel?
Date: Thu, 14 Apr 2005 14:39:11 +0200
Message-ID: <42134E6200016E60@mail-2-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello all,

This is a d380 2way pa8000 with 256K of ram which boot and run fine 32bit=

kernels (up et smp) :-)

As those processor are pa8000, I would be also able to run 64bi kernel?

I tried 2.6.12-rc2-pa2 but it failled at:
...
 EISA bus registered
Searching for devices...
Found devices:
1. U2-IOA BC Runway Port at 0xfffffffffff88000 [8] { 12, 0xf, 0x580, 0x00=
00b
}
2. UL 550 Lasi Core BA at 0xffffffffffd00000 [8/16] { 11, 0x0, 0x02f, 0x0=
0081
},
  additional addresses: 0xffffffffffd0c000 0xffffffffffc00000
3. UL 550 Lasi Core RS-232 at 0xffffffffffd05000 [8/16/4] { 10, 0x0, 0x02=
f,
0x00
08c }
4. UL 550 Core SCSI at 0xffffffffffd06000 [8/16/5] { 10, 0x0, 0x02f, 0x00=
082
}
5. UL 350 Core LAN (802.3) at 0xffffffffffd07000 [8/16/6] { 10, 0x0, 0x02=
f,
0x00
08a }
6. UL 550 Core Centronics at 0xffffffffffd02000 [8/16/0] { 10, 0x0, 0x02f=
,
0x000
74 },  additional addresses: 0xffffffffffd01000 0xffffffffffd03000
7. UL 550 Core PS/2 Port at 0xffffffffffd08000 [8/16/7] { 10, 0x0, 0x02f,=

0x0008
4 }
8. UL 550 Core PS/2 Port at 0xffffffffffd08100 [8/16/8] { 10, 0x0, 0x02f,=

0x0008
4 }
9. UL 550 Core Wax BA at 0xffffffffffe00000 [8/20] { 11, 0x0, 0x031, 0x00=
08e
}
10. UL 550 Wax EISA BA at 0xfffffffffc000000 [8/20/5] { 11, 0x0, 0x031, 0=
x00090
},  additional addresses: 0xffffffffffc88000
11. UL 550 Wax Core RS-232 at 0xffffffffffe02000 [8/20/2] { 10, 0x0, 0x03=
1,
0x00
08c }
12. Bluefish Add-on FW-SCSI at 0xfffffffff1004000 [8/4] { 4, 0x1, 0x013,
0x00089
 }
13. Bluefish Add-on FW-SCSI at 0xfffffffff1008000 [8/8] { 4, 0x1, 0x013,
0x00089
 }
14. Bluefish Add-on FW-SCSI at 0xfffffffff100c000 [8/12] { 4, 0x1, 0x013,=

0x0008
9 }
15. U2-IOA BC GSC+ Port at 0xfffffffff103f000 [8/63] { 7, 0x1, 0x501, 0x0=
000c
}
16. U2-IOA BC Runway Port at 0xfffffffffff8a000 [10] { 12, 0xf, 0x580, 0x=
0000b
}
17. U2-IOA BC GSC+ Port at 0xfffffffff183f000 [10/63] { 7, 0x1, 0x501, 0x=
0000c
}
18. UL proc 2-way U180 1M/1M at 0xfffffffffffa0000 [32] { 0, 0x0, 0x5aa,
0x00004
 }
19. UL proc 2-way U180 1M/1M at 0xfffffffffffa2000 [34] { 0, 0x0, 0x5aa,
0x00004
 }
20. Memory at 0xfffffffffffb1000 [49] { 1, 0x0, 0x07c, 0x00009 }
CONFIG_SMP=3Dn  ignoring additional CPUs
CPU: probe of 34 failed with error 1
CPU(s): 1 x PA8000 (PCX-U) at 180.000000 MHz
Setting cache flush threshold to e4540 (1 CPUs online)
Found U2 at 0xfffffffffff88000
Found U2 at 0xfffffffffff8a000
/usr/src/linux-2.6.12-rc2-pa2-050413/drivers/parisc/ccio-dma.c: failed to=

claim
CCIO bus address space (ffffffff00000000,ffffffffffffffff)
Lasi version 0 at 0xffffffffffd00000 found.
LED display at ffffffffffd0c000 registered
wax at 0xffffffffffe00000 found.
Wax EISA Adapter found at 0xfffffffffc000000
Enumerating EISA bus

Any idea?

Thanks in advance,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
