Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "Craig D. Lansing" <lansing@beldar.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.16-pa24 crashes on c3k 
In-Reply-To: Message from "Craig D. Lansing" <lansing@beldar.com>
   of "Sun, 30 Dec 2001 21:38:01 EST." <003601c191a4$2b55ec80$0101a8c0@pogo>
References: <20011225090742.8E013482B@dsl2.external.hp.com>  <003601c191a4$2b55ec80$0101a8c0@pogo> 
Date: Mon, 31 Dec 2001 10:22:09 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20011231172209.ABAD1482C@dsl2.external.hp.com>
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

"Craig D. Lansing" wrote:
> Did you ever get this resolved? 

Well, for the systems I can test (A500/C3000), yes.
IIRC, Thomas Bogendoerf said he fixed it for B132 and C200.

> I saw Tom's reply that it could be related to /boot extending beyond 2GB,

In general yes. But given recent kernel changes around PCI/EISA HBA numbering
I'd say it's a kernel problem.

> J2240, I have tried 32-2.4.16-pa24 and pa29 and am getting stack dumps
> similar to yours.  I have tried the pre-compiled kernels and creating from
> source to no avail.  The general steps are:
> 
> 1. Download kernel or kernel source
> 2. Compile if from source
> 3. Copy vmlinux***, System.map.***, and Config.*** to /boot
> 4. Link vmlinux to vmlinux***
> 5. Edit /etc/palo.conf
> 6. run palo (no args)

You don't need to run palo again. It doesn't hurt either.
Just point /boot/vmlinux (or whatever palo.conf says) to the new kernel.

Just a few more nits interesting to other kernel developers.
I hope Ryan or Thomas can sort this out for you.

> Linux version 2.4.9-32 (root@paer) (gcc version 3.0.2 (Debian)) #1 Fri Nov
> 30 19:36:30 MST 2001
...
> model   9000/782/J2240
...
> Found devices:
> 1. U2-IOA BC Runway Port (12) at 0xfff88000 [8], versions 0x580, 0xf, 0xb
> 2. unknown device (13) at 0xfc000000 [8/0], versions 0x5d, 0x3, 0xa
> 3. SummitHawk Dino RS-232 (10) at 0xfc003000 [8/0/63], versions 0x5d, 0x0,
> 0x8c
> 4. Dino PCI Bridge (13) at 0xfc004000 [8/4], versions 0x680, 0x3, 0xa
> 5. SummitHawk 230 Core BA (11) at 0xffd00000 [8/12], versions 0x5c, 0x0,
> 0x81,
> additional addresses: 0xffc00000
> 6. SummitHawk 230 Core Centronics (10) at 0xffd02000 [8/12/0], versions
> 0x5c, 0x
> 0, 0x74,  additional addresses: 0xffd03000
> 7. SummitHawk 230 Core Audio (10) at 0xffd04000 [8/12/1], versions 0x5c,
> 0x4, 0x
> 7b
> 8. SummitHawk 230 Core SCSI (10) at 0xffd06000 [8/12/5], versions 0x5c, 0x0,
> 0x8
> 2
> 9. SummitHawk 230 Core PS/2 Port (10) at 0xffd08000 [8/12/7], versions 0x5c,
> 0x0
> , 0x84
> 10. SummitHawk 230 Core PS/2 Port (10) at 0xffd08100 [8/12/8], versions
> 0x5c, 0x
> 0, 0x84
> 11. U2-IOA BC GSC+ Port (7) at 0xfc03f000 [8/63], versions 0x501, 0x1, 0xc
> 12. U2-IOA BC Runway Port (12) at 0xfff8a000 [10], versions 0x580, 0xf, 0xb
> 13. Cujo PCI Bridge (13) at 0xf1604000 [10/4], versions 0x682, 0x1, 0xa,
> additi
> onal addresses: 0xf6000000
> 14. SummitHawk Dino RS-232 (10) at 0xf1607000 [10/4/63], versions 0x5d, 0x0,
> 0x8
> c
> 15. U2-IOA BC GSC+ Port (7) at 0xf163f000 [10/63], versions 0x501, 0x1, 0xc
> 16. SummitHawk U+ (0) at 0xfffa0000 [32], versions 0x5b5, 0x0, 0x4
> 17. SummitHawk U+ (0) at 0xfffa2000 [34], versions 0x5b5, 0x0, 0x4
> 18. SummitHawk Memory (1) at 0xfffb1000 [49], versions 0x83, 0x0, 0x9
> CONFIG_SMP=n  ignoring additional CPUs
> Warning : device (0, 0x5b5, 0x0, 0x4) NOT claimed by CPU
> CPU(s): 1 x PA8200 (PCX-U+) at 236.000000 MHz
> ccio found U2 at 0xfff88000
> io_io_low: 0xf8000000
> 19. unknown device (13) at 0xfc000000 [8/0], versions 0x5d, 0x3, 0xa
> 20. SummitHawk Dino RS-232 (10) at 0xfc003000 [8/0/63], versions 0x5d, 0x0,
> 0x8c
> 21. Dino PCI Bridge (13) at 0xfc004000 [8/4], versions 0x680, 0x3, 0xa

I think the devices showing up twice has been fixed in 2.4.16 kernels.

> 22. SummitHawk 230 Core BA (11) at 0xffd00000 [8/12], versions 0x5c, 0x0,
> 0x81,
>  additional addresses: 0xffc00000
> 23. SummitHawk 230 Core Centronics (10) at 0xffd02000 [8/12/0], versions
> 0x5c, 0
> x0, 0x74,  additional addresses: 0xffd03000
> 24. SummitHawk 230 Core Audio (10) at 0xffd04000 [8/12/1], versions 0x5c,
> 0x4, 0
> x7b
> 25. SummitHawk 230 Core SCSI (10) at 0xffd06000 [8/12/5], versions 0x5c,
> 0x0, 0x
> 82
> 26. SummitHawk 230 Core PS/2 Port (10) at 0xffd08000 [8/12/7], versions
> 0x5c, 0x
> 0, 0x84
> 27. SummitHawk 230 Core PS/2 Port (10) at 0xffd08100 [8/12/8], versions
> 0x5c, 0x
> 0, 0x84
> 28. U2-IOA BC GSC+ Port (7) at 0xfc03f000 [8/63], versions 0x501, 0x1, 0xc
> ccio found U2 at 0xfff8a000
> io_io_low: 0xf1600000
> 29. Cujo PCI Bridge (13) at 0xf1604000 [10/4], versions 0x682, 0x1, 0xa,
> additi
> onal addresses: 0xf6000000
> 30. SummitHawk Dino RS-232 (10) at 0xf1607000 [10/4/63], versions 0x5d, 0x0,
> 0x8
> c
> 31. U2-IOA BC GSC+ Port (7) at 0xf163f000 [10/63], versions 0x501, 0x1, 0xc
> Lasi version 0 at 0xffd00000 found.
> Cujo version unknown found at 0xfc000000

hmm...another nit. We should know the version by now.

> Dino version 3.1 found at 0xfc004000
> Cujo version 2.0 found at 0xf1604000
> Enabling Cujo 2.0 bug workaround
> POSIX conformance testing by UNIFIX
> Linux NET4.0 for Linux 2.4
> Based upon Swansea University Computer Society NET3.039
> Starting kswapd v1.8
> parport_init_chip: initialize bidirectional-mode.
> parport0: PC-style at 0xffd02800, irq 88 [PCSPP,TRISTATE]
> STI PCI ROM enabled at 0xf1ff0000
> PCI graphic ROM found at f1ff0000 (64 kB), fb @ f6000000 (32 MB)
> PCI region 0: f6000000 with 32768 kB
> PCI region 1: 00000000 with 0 kB
> PCI region 2: 00000000 with 0 kB
> PCI region 3: 00000000 with 0 kB
> PCI region 4: 00000000 with 0 kB
> PCI region 5: 00000000 with 0 kB
> PCI region 6: f1ff0000 with 64 kB
> PCI region 7: 00000000 with 0 kB
> PCI region 8: 00000000 with 0 kB
> PCI region 9: 00000000 with 0 kB
> PCI region 10: 00000000 with 0 kB
> PCI region 11: 00000000 with 0 kB
> Trying PCI STI ROM at f1ff0000, PCI hpa at f6000000
> I'm not trying to set up the PCI graphic card now... It would freeze your
> machin
> e
> Unable to handle STI device 'Hewlett-Packard Company A4977A Visualize EG'

This should work now too.
Or at least it's only know to NOT work with the C3000.

grant
