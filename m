From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] ccio-dma 64bit debug_init info
Date: Tue, 17 May 2005 18:29:18 +0200
Message-ID: <4282FEEE00001BF0@mail-5-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: "Grant Grundler" <grundler@parisc-linux.org>
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

Hello Grant,

>
> On Fri, May 13, 2005 at 07:50:05AM +0200, Joel Soete wrote:
> > Ah I thought (too quickly) that it could be the reason why:
> > ...
> > ccio-dma.c: failed to claim CCIO bus address space (ffffffff00000000,=
ffffffffffffffff)
>
> That's a completely different issue.
> It would be interesting to know why it's asking for that range.
> Where are the values of that range coming from?
> (ie what is the origin of ffffffff00000000 value)
>
Here are more DBG_INIT() :-)
32bit kernel:
...
Found devices:
1. U2-IOA BC Runway Port at 0xfff88000 [8] { 12, 0xf, 0x580, 0x0000b }
2. UL 550 Lasi Core BA at 0xffd00000 [8/16] { 11, 0x0, 0x02f, 0x00081 },
 additional addresses: 0xffd0c000 0xffc00000
3. UL 550 Lasi Core RS-232 at 0xffd05000 [8/16/4] { 10, 0x0, 0x02f, 0x000=
8c
}
4. UL 550 Core SCSI at 0xffd06000 [8/16/5] { 10, 0x0, 0x02f, 0x00082 }
5. UL 350 Core LAN (802.3) at 0xffd07000 [8/16/6] { 10, 0x0, 0x02f, 0x000=
8a
}
6. UL 550 Core Centronics at 0xffd02000 [8/16/0] { 10, 0x0, 0x02f, 0x0007=
4
},  additional addresses: 0xffd01000 0xffd03000
7. UL 550 Core PS/2 Port at 0xffd08000 [8/16/7] { 10, 0x0, 0x02f, 0x00084=

}
8. UL 550 Core PS/2 Port at 0xffd08100 [8/16/8] { 10, 0x0, 0x02f, 0x00084=

}
9. UL 550 Core Wax BA at 0xffe00000 [8/20] { 11, 0x0, 0x031, 0x0008e }
10. UL 550 Wax EISA BA at 0xfc000000 [8/20/5] { 11, 0x0, 0x031, 0x00090 }=
,
 additional addresses: 0xffc88000
11. UL 550 Wax Core RS-232 at 0xffe02000 [8/20/2] { 10, 0x0, 0x031, 0x000=
8c
}
12. Bluefish Add-on FW-SCSI at 0xf1004000 [8/4] { 4, 0x1, 0x013, 0x00089
}
13. Bluefish Add-on FW-SCSI at 0xf1008000 [8/8] { 4, 0x1, 0x013, 0x00089
}
14. Bluefish Add-on FW-SCSI at 0xf100c000 [8/12] { 4, 0x1, 0x013, 0x00089=

}
15. U2-IOA BC GSC+ Port at 0xf103f000 [8/63] { 7, 0x1, 0x501, 0x0000c }
16. U2-IOA BC Runway Port at 0xfff8a000 [10] { 12, 0xf, 0x580, 0x0000b }
17. U2-IOA BC GSC+ Port at 0xf183f000 [10/63] { 7, 0x1, 0x501, 0x0000c }
18. UL proc 2-way U180 1M/1M at 0xfffa0000 [32] { 0, 0x0, 0x5aa, 0x00004
}
19. UL proc 2-way U180 1M/1M at 0xfffa2000 [34] { 0, 0x0, 0x5aa, 0x00004
}
20. Memory at 0xfffb1000 [49] { 1, 0x0, 0x07c, 0x00009 }
CONFIG_SMP=3Dn  ignoring additional CPUs
CPU: probe of 34 failed with error 1
CPU(s): 1 x PA8000 (PCX-U) at 180.000000 MHz
Setting cache flush threshold to 20 (1 CPUs online)
Found U2 at 0xfff88000
ccio_probe() ioc_count 0
ccio_probe() dev->hpa fff88000
ccio_probe() ioc->ioc_regs fff88000
ccio_ioc_init() num_physpages 65536
     count_parisc_driver 2
     iova_space_size 32768
     limited iova_space_size 32768
     iov_order 15
     iova_space_size now bytes 134217728
     ioc->pdir_size 262144
ccio_ioc_init() hpa 0xfff88000 mem 256MB IOV 128MB (27 bits)
ccio_ioc_init() pdir 10740000 size 40000
 base 10740000
ccio_ioc_init() res_size 0x1000
ccio_ioc_init() res_map 106b7000 size 1000
 chainid_shift 0x13
ccio_init_resource(res=3D10712c68, name=3DGSC Bus [8/], ioaddr=3Dfff88078=
)
ccio_init_resource() res->start f1000000
ccio_init_resource() res->end f17fffff
ccio_init_resource() res->end + 1  f1800000
ccio_init_resource() claimed CCIO bus address space (f1000000, f17fffff)
ccio_init_resource(res=3D10712c84, name=3DGSC Bus [8/], ioaddr=3Dfff88060=
)
ccio_init_resource() res->start fc000000
ccio_init_resource() res->end fff7ffff
ccio_init_resource() res->end + 1  fff80000
ccio_init_resource() claimed CCIO bus address space (fc000000, fff7ffff)
Found U2 at 0xfff8a000
ccio_probe() ioc_count 1
ccio_probe() dev->hpa fff8a000
ccio_probe() ioc->ioc_regs fff8a000
ccio_ioc_init() num_physpages 65536
     count_parisc_driver 2
     iova_space_size 32768
     limited iova_space_size 32768
     iov_order 15
     iova_space_size now bytes 134217728
     ioc->pdir_size 262144
ccio_ioc_init() hpa 0xfff8a000 mem 256MB IOV 128MB (27 bits)
ccio_ioc_init() pdir 10780000 size 40000
 base 10780000
ccio_ioc_init() res_size 0x1000
ccio_ioc_init() res_map 106b9000 size 1000
 chainid_shift 0x13
ccio_init_resource(res=3D1071245c, name=3DGSC Bus [10/], ioaddr=3Dfff8a07=
8)
ccio_init_resource() res->start f1800000
ccio_init_resource() res->end f1ffffff
ccio_init_resource() res->end + 1  f2000000
ccio_init_resource() claimed CCIO bus address space (f1800000, f1ffffff)
ccio_init_resource(res=3D10712478, name=3DGSC Bus [10/], ioaddr=3Dfff8a06=
0)
ccio_init_resource() res->start 00000000
ccio_init_resource() res->end ffffffff
ccio_init_resource() res->end + 1  00000000
Lasi version 0 at 0xffd00000 found.
...

64bit kernel:
Found devices:
1. U2-IOA BC Runway Port at 0xfffffffffff88000 [8] { 12, 0xf, 0x580, 0x00=
00b
}
2. UL 550 Lasi Core BA at 0xffffffffffd00000 [8/16] { 11, 0x0, 0x02f, 0x0=
0081
},  additional addresses: 0xffffffffffd0c000 0xffffffffffc00000
3. UL 550 Lasi Core RS-232 at 0xffffffffffd05000 [8/16/4] { 10, 0x0, 0x02=
f,
0x0008c }
4. UL 550 Core SCSI at 0xffffffffffd06000 [8/16/5] { 10, 0x0, 0x02f, 0x00=
082
}
5. UL 350 Core LAN (802.3) at 0xffffffffffd07000 [8/16/6] { 10, 0x0, 0x02=
f,
0x0008a }
6. UL 550 Core Centronics at 0xffffffffffd02000 [8/16/0] { 10, 0x0, 0x02f=
,
0x00074 },  additional addresses: 0xffffffffffd01000 0xffffffffffd03000
7. UL 550 Core PS/2 Port at 0xffffffffffd08000 [8/16/7] { 10, 0x0, 0x02f,=

0x00084 }
8. UL 550 Core PS/2 Port at 0xffffffffffd08100 [8/16/8] { 10, 0x0, 0x02f,=

0x00084 }
9. UL 550 Core Wax BA at 0xffffffffffe00000 [8/20] { 11, 0x0, 0x031, 0x00=
08e
}
10. UL 550 Wax EISA BA at 0xfffffffffc000000 [8/20/5] { 11, 0x0, 0x031, 0=
x00090
},  additional addresses: 0xffffffffffc88000
11. UL 550 Wax Core RS-232 at 0xffffffffffe02000 [8/20/2] { 10, 0x0, 0x03=
1,
0x0008c }
12. Bluefish Add-on FW-SCSI at 0xfffffffff1004000 [8/4] { 4, 0x1, 0x013,
0x00089 }
13. Bluefish Add-on FW-SCSI at 0xfffffffff1008000 [8/8] { 4, 0x1, 0x013,
0x00089 }
14. Bluefish Add-on FW-SCSI at 0xfffffffff100c000 [8/12] { 4, 0x1, 0x013,=

0x00089 }
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
0x00004 }
19. UL proc 2-way U180 1M/1M at 0xfffffffffffa2000 [34] { 0, 0x0, 0x5aa,
0x00004 }
20. Memory at 0xfffffffffffb1000 [49] { 1, 0x0, 0x07c, 0x00009 }
CONFIG_SMP=3Dn  ignoring additional CPUs
CPU: probe of 34 failed with error 1
CPU(s): 1 x PA8000 (PCX-U) at 180.000000 MHz
Setting cache flush threshold to e9f80 (1 CPUs online)
Found U2 at 0xfffffffffff88000
ccio_probe() ioc_count 0
ccio_probe() dev->hpa fffffffffff88000
ccio_probe() ioc->ioc_regs fffffffffff88000
ccio_ioc_init() num_physpages 65536
     count_parisc_driver 2
     iova_space_size 32768
     limited iova_space_size 32768
     iov_order 15
     iova_space_size now bytes 134217728
     ioc->pdir_size 262144
ccio_ioc_init() hpa 0xfffffffffff88000 mem 256MB IOV 128MB (27 bits)
ccio_ioc_init() pdir 0000000010a80000 size 40000
 base 0000000010a80000
ccio_ioc_init() res_size 0x1000
ccio_ioc_init() res_map 00000000109e4000 size 1000
 chainid_shift 0x13
ccio_init_resource(res=3D00000000109e3858, name=3DGSC Bus [8/], ioaddr=3D=
fffffffffff88078)
ccio_init_resource() res->start fffffffff1000000
ccio_init_resource() res->end fffffffff17fffff
ccio_init_resource() res->end + 1  fffffffff1800000
ccio_init_resource() claimed CCIO bus address space (fffffffff1000000, ff=
fffffff17fffff)
ccio_init_resource(res=3D00000000109e3890, name=3DGSC Bus [8/], ioaddr=3D=
fffffffffff88060)
ccio_init_resource() res->start fffffffffc000000
ccio_init_resource() res->end fffffffffff7ffff
ccio_init_resource() res->end + 1  fffffffffff80000
ccio_init_resource() claimed CCIO bus address space (fffffffffc000000, ff=
fffffffff7ffff)
Found U2 at 0xfffffffffff8a000
ccio_probe() ioc_count 1
ccio_probe() dev->hpa fffffffffff8a000
ccio_probe() ioc->ioc_regs fffffffffff8a000
ccio_ioc_init() num_physpages 65536
     count_parisc_driver 2
     iova_space_size 32768
     limited iova_space_size 32768
     iov_order 15
     iova_space_size now bytes 134217728
     ioc->pdir_size 262144
ccio_ioc_init() hpa 0xfffffffffff8a000 mem 256MB IOV 128MB (27 bits)
ccio_ioc_init() pdir 0000000010ac0000 size 40000
 base 0000000010ac0000
ccio_ioc_init() res_size 0x1000
ccio_ioc_init() res_map 00000000109e6000 size 1000
 chainid_shift 0x13
ccio_init_resource(res=3D00000000109e5858, name=3DGSC Bus [10/], ioaddr=3D=
fffffffffff8a078)
ccio_init_resource() res->start fffffffff1800000
ccio_init_resource() res->end fffffffff1ffffff
ccio_init_resource() res->end + 1  fffffffff2000000
ccio_init_resource() claimed CCIO bus address space (fffffffff1800000, ff=
fffffff1ffffff)
ccio_init_resource(res=3D00000000109e5890, name=3DGSC Bus [10/], ioaddr=3D=
fffffffffff8a060)
ccio_init_resource() res->start ffffffff00000000
ccio_init_resource() res->end ffffffffffffffff
ccio_init_resource() res->end + 1  0000000000000000
ccio_init_resource() failed to claim CCIO bus address space (ffffffff0000=
0000,
ffffffffffffffff)
ccio_init_resource() claimed CCIO bus address space (ffffffff00000000, ff=
ffffffffffffff)
Lasi version 0 at 0xffffffffffd00000 found.

even thought I have no doc to now what would means:
        res->start =3D (unsigned long)(signed) READ_U32(ioaddr) << 16; (=3D=
=3D
0x0 in 32bits)
        res->end =3D (unsigned long)(signed) (READ_U32(ioaddr + 4) << 16)=
 -
1; (=3D=3D 0xffffffff in 32bits too)

but seems that test:
        if (res->end + 1 =3D=3D res->start)
is a stuff which not love 64bit :-(

Any idea?

Thanks,
    Joel

PS: I also noticed something weird versus my c110:
Found devices:
1. U2-IOA BC Runway Port at 0xfff8a000 [10] { 12, 0x7, 0x580, 0x0000b }
...
4. U2-IOA BC Runway Port at 0xfff88000 [8] { 12, 0x7, 0x580, 0x0000b }
...
Found U2 at 0xfff8a000
...
ccio_init_resource(res=3D10be2434, name=3DGSC Bus [10/], ioaddr=3Dfff8a07=
8)
ccio_init_resource() claimed CCIO bus address space (f3fc0000, f3ffffff)
ccio_init_resource(res=3D10be2450, name=3DGSC Bus [10/], ioaddr=3Dfff8a06=
0)
ccio_init_resource() claimed CCIO bus address space (f4000000, f7ffffff)
Found U2 at 0xfff88000
...
ccio_init_resource(res=3D10becc34, name=3DGSC Bus [8/], ioaddr=3Dfff88078=
)
ccio_init_resource() claimed CCIO bus address space (f3f80000, f3fbffff)
ccio_init_resource(res=3D10becc50, name=3DGSC Bus [8/], ioaddr=3Dfff88060=
)
ccio_init_resource() claimed CCIO bus address space (f8000000, ffe3ffff)
...

So there are well (2*2) resources initialized.

OTC on the d380 (32bit kernel)
Found devices:
1. U2-IOA BC Runway Port at 0xfff88000 [8] { 12, 0xf, 0x580, 0x0000b }
...
16. U2-IOA BC Runway Port at 0xfff8a000 [10] { 12, 0xf, 0x580, 0x0000b }
...
Found U2 at 0xfff88000
...
ccio_init_resource(res=3D10712c68, name=3DGSC Bus [8/], ioaddr=3Dfff88078=
)
ccio_init_resource() claimed CCIO bus address space (f1000000, f17fffff)
ccio_init_resource(res=3D10712c84, name=3DGSC Bus [8/], ioaddr=3Dfff88060=
)
ccio_init_resource() claimed CCIO bus address space (fc000000, fff7ffff)
Found U2 at 0xfff8a000
...
ccio_init_resource(res=3D1071245c, name=3DGSC Bus [10/], ioaddr=3Dfff8a07=
8)
ccio_init_resource() claimed CCIO bus address space (f1800000, f1ffffff)
ccio_init_resource(res=3D10712478, name=3DGSC Bus [10/], ioaddr=3Dfff8a06=
0)
...
if I well understand only 3 resources initialized?


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
