Return-Path: <rbradetich@uswest.net>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 117C048C6
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 13 Apr 2004 18:22:40 -0600 (MDT)
Subject: Re: [parisc-linux] 2.6.5-rc2-pa2 boot panic on c110 :(
From: Ryan Bradetich <rbradetich@uswest.net>
To: Joel Soete <soete.joel@tiscali.be>
In-Reply-To: <407864F0.8090404@tiscali.be>
References: <405D95D0.9030600@tiscali.be>
	<20040321195716.GC12455@colo.lackof.org>
	<20040323045151.GA6190@colo.lackof.org> <40770BDF.10209@tiscali.be>
	<20040409211507.GB32385@colo.lackof.org> <4077B104.9030707@tiscali.be>
	<20040410181439.GA13387@colo.lackof.org> <407864F0.8090404@tiscali.be>
Content-Type: text/plain
Message-Id: <1081902152.1089.70.camel@laptop.bradetich.net>
Mime-Version: 1.0
Date: Tue, 13 Apr 2004 18:22:32 -0600
Cc: Grant Grundler <grundler@parisc-linux.org>,
	PA-RISC Linux Port <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hello Joel,

I finally had some time to compile a kernel and boot some systems today
so I tested the latest CVS head on my C200 and a J200 to see if I could
duplicate the problem you are seeing.

The J200 is basically a dual processor C100 so it should be very close
to the C110 (i.e. no PCI, EISA based, etc)  The device names are
different so I am not sure if it is close enough but I still think it is
a relevant data point.


Device list for the J200:

1. U2-IOA BC Runway Port at 0xfff88000 [8] { 12, 0x7, 0x580, 0x0000b }
2. SkyHawk 100/120 FW-SCSI at 0xf3f80000 [8/0] { 4, 0x0, 0x01f, 0x00089
}
3. SkyHawk 100/120 Core BA at 0xffd00000 [8/12] { 11, 0x0, 0x01f,
0x00081 },  additional addresses: 0xffd0c000 0xffc00000
4. SkyHawk 100/120 Core Centronics at 0xffd02000 [8/12/0] { 10, 0x0,
0x01f, 0x00074 },  additional addresses: 0xffd01000 0xffd03000
5. SkyHawk 100/120 Audio at 0xffd04000 [8/12/1] { 10, 0x0, 0x01f,
0x0007b }
6. SkyHawk 100/120 Core RS-232 at 0xffd05000 [8/12/4] { 10, 0x0, 0x01f,
0x0008c }
7. SkyHawk 100/120 Core SCSI at 0xffd06000 [8/12/5] { 10, 0x0, 0x01f,
0x00082 }
8. SkyHawk 100/120 Core LAN (802.3) at 0xffd07000 [8/12/6] { 10, 0x0,
0x01f, 0x0008a }
9. SkyHawk 100/120 Core PS/2 Port at 0xffd08000 [8/12/7] { 10, 0x0,
0x01f, 0x00084 }
10. SkyHawk 100/120 Core PS/2 Port at 0xffd08100 [8/12/8] { 10, 0x0,
0x01f, 0x00084 }
11. U2-IOA BC GSC+ Port at 0xf3fbf000 [8/63] { 7, 0x1, 0x501, 0x0000c }
12. U2-IOA BC Runway Port at 0xfff8a000 [10] { 12, 0x7, 0x580, 0x0000b }
13. HP HSC-PCI Cards at 0xf3fc0000 [10/0] { 4, 0x0, 0x004, 0x0009d }
14. Hyperdrive Optional Graphics at 0xf6000000 [10/16] { 10, 0x0, 0x005,
0x00077 }
15. SkyHawk Wax BA at 0xffe00000 [10/20] { 11, 0x0, 0x01f, 0x0008e }, 
additional addresses: 0xffe03000 0xffe06000
16. SkyHawk 100/120 Wax HIL at 0xffe01000 [10/20/1] { 10, 0x0, 0x01f,
0x00073 }
17. SkyHawk 100/120 Wax RS-232 at 0xffe02000 [10/20/2] { 10, 0x0, 0x004,
0x0008c }
18. SkyHawk 100/120 Wax EISA BA at 0xfc000000 [10/20/5] { 11, 0x0,
0x01f, 0x00090 },  additional addresses: 0xf0182000 0xf4000000
19. U2-IOA BC GSC+ Port at 0xf3fff000 [10/63] { 7, 0x1, 0x501, 0x0000c
},  additional addresses: 0xf3fc0000
20. SkyHawk 100 at 0xfffa0000 [32] { 0, 0x0, 0x585, 0x00004 }
21. Memory at 0xfffb1000 [49] { 1, 0x0, 0x049, 0x00009 }
CPU(s): 1 x PA7200 (PCX-T') at 100.000000 MHz


Would you be interested in trying the lifimage I complied and
successfully booted on both the J200 and the C110?  If the lifimage
boots on your system then we localize the problem down to possible tool
chain or .config problem (I used the defconfig).


Linux moby 2.6.5-pa6 #2 Tue Apr 13 12:01:32 MDT 2004 parisc GNU/Linux

cpu MHz         : 100.000000
model           : 9000/770/J200

Thoughts?

Thanks,

- Ryan

On Sat, 2004-04-10 at 15:19, Joel Soete wrote:
> Grant Grundler wrote:
> > On Sat, Apr 10, 2004 at 08:32:04AM +0000, Joel Soete wrote:
> > 
> >>I will so just reversed mentioned patches, check if it is the real
> >>cause of my pb.
> > 
> > 
> > ok
> > 
> 
> Well I reach to reverted it and the result is a booting and operational kernel.
> oops, my bad: I also reverted my config. Very stupid of my part, I just have re-do test; sorry
> 
> > 
> >>If yes (I don't see what else) re-apply patch hunk by hunk until it breaks 
> >>again?
> > 
> > 
> > That won't work with the changes to ccio driver. It's all or nothing.
> > 
> (I see, any way there was 2 steps for this patch and I don't have the opportunity to test the first step alone?)
> > 
> >>Any better idea?
> > 
> > 
> > I don't understand why C360 (James' machine) works and C110 (your machine)
> > does not.  C110 doesn't have PCI and maybe different keyboard/LAN.
> > Find out what is different between the two machines and see if ccio
> > changes broke one of the drivers for the different HW.
> > 
> C110's Devices						      |	C360's Devices
> 
> Raven 120 T' (Processor)  (PA7200 (PCX-T'))		      |	Raven W 360 (9000/780/????) (Processor)  (PA8500 (PCX-W))
> SkyHawk 100/120 (Memory)				      |	Raven W 360 Memory (Memory)
> SkyHawk 100/120 FW-SCSI (A DMA) (Zalon driver)		      |	Raven U/L2 Dino RS-232 (Foreign I/O Module) (Serial driver)
> Raven T' Core Centronics (Foreign I/O Module) (Parallel drive |	Raven+ w Core Centronics (Foreign I/O Module) (Paral
> Raven T' Audio (Foreign I/O Module) (Harmony driver)	      |	Raven+ w Core Audio (Foreign I/O Module) (Harmony d
> Raven T' Lasi Core RS-232 (Foreign I/O Module) (Serial driver |	Raven+ w Core RS-232 (Foreign I/O Module) (Serial d
> Raven T' Core SCSI (Foreign I/O Module) (NCR53c710 driver)    |	Raven+ w Core SCSI (Foreign I/O Module) (NCR53c710
> Raven T' Core LAN (802.3) (Foreign I/O Module) (Lasi_82596 dr |	Raven+ w Core PC Keyboard (Foreign I/O Module) (PS/
> Raven T' Core PC Keyboard (Foreign I/O Module) (PS/2 driver)  |	Raven+ w Core BA (Bus Adapter) (Lasi driver)
> Raven T' Core PC Floppy (Foreign I/O Module)		      <
> Raven T' Wax HIL (Foreign I/O Module) (HIL driver)	      <
> Raven T' Wax RS-232 (Foreign I/O Module) (Serial driver)      <
> Raven T' GSC Core Graphics (Foreign I/O Module)		      <
> Raven T' Core BA (Bus Adapter) (Lasi driver)		      <
> Raven T' Wax BA (Bus Adapter) (Wax driver)		      <
> Raven T' Wax EISA BA (Bus Adapter)			      <
> U2-IOA BC Runway Port (IOA) (x2)				U2-IOA BC Runway Port (IOA) (x2)
> 							      >	Dino PCI Bridge (Bus Bridge to Foreign Bus) (Dino driver)
> 							      >	Cujo PCI Bridge (Bus Bridge to Foreign Bus) (Dino driver)
> 							      >
> 							      >	53c875 (Symbios Logic Inc. (formerly NCR)) (SYM8xx driver)
> 							      >	DECchip 21142/43 (Digital Equipment Corporation) (Tulip drive
> 							      >	Visualize FX4 (Hewlett-Packard Company)
> 
> This is diff -y of devices list grab from web h/w db (may be c360 list could be confirmed by James with a dmesg file?)
> It help me to point out 2 big diff: scsi Zalon driver and Lasi_82596 Lan nic (I removed HIL modules simply because no device 
> available).
> 
> That said the system always became to hang when I start a large disk i/o with a find into a linux kernel for example and also by 
> accident I also start a kernel without Lasi module (and iirc the same pb occured) but in any case I could make it leave without 
> Zalon driver; or did I miss something else in my .config (so much diff between the 2 config I used).
> 
> (C110 need long hours to compile the kernel :( but that is all I have at home)
> 
> > You might need to add pdc_io_reset_devices() to ccio_ioc_init()
> > since we moved that out of the common code path.
> 
> hmm I don't see such stuff in patches I grab of jejb changes?
> Any way I see what you did in sba_hw_init() (I will so be able to reproduce it ;) )
> 
> > I don't see that
> > in CCIO driver and it's not clear to me if HIL or LAN need it on C110.
> > 
> > It *might* need pdc_io_reset() call instead (or in addition)
> > but I don't know.  Just another thing to be aware of.
> > 
> Thanks for all kind advise (it will just take me much more test and so many time before I could figure out the actual pb)
> 
> Joel
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
