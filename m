Return-Path: <soete.joel@tiscali.be>
Received: from spoolo3.tiscali.be (spoolo3.tiscali.be [62.235.13.169])
	by dsl2.external.hp.com (Postfix) with ESMTP id D34324896
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 10 Apr 2004 15:19:44 -0600 (MDT)
Message-ID: <407864F0.8090404@tiscali.be>
Date: Sat, 10 Apr 2004 21:19:44 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] 2.6.5-rc2-pa2 boot panic on c110 :(
References: <405D95D0.9030600@tiscali.be>
	<20040321195716.GC12455@colo.lackof.org>
	<20040323045151.GA6190@colo.lackof.org> <40770BDF.10209@tiscali.be>
	<20040409211507.GB32385@colo.lackof.org>
	<4077B104.9030707@tiscali.be>
	<20040410181439.GA13387@colo.lackof.org>
In-Reply-To: <20040410181439.GA13387@colo.lackof.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: PA-RISC Linux Port <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>



Grant Grundler wrote:
> On Sat, Apr 10, 2004 at 08:32:04AM +0000, Joel Soete wrote:
> 
>>I will so just reversed mentioned patches, check if it is the real
>>cause of my pb.
> 
> 
> ok
> 

Well I reach to reverted it and the result is a booting and operational kernel.
oops, my bad: I also reverted my config. Very stupid of my part, I just have re-do test; sorry

> 
>>If yes (I don't see what else) re-apply patch hunk by hunk until it breaks 
>>again?
> 
> 
> That won't work with the changes to ccio driver. It's all or nothing.
> 
(I see, any way there was 2 steps for this patch and I don't have the opportunity to test the first step alone?)
> 
>>Any better idea?
> 
> 
> I don't understand why C360 (James' machine) works and C110 (your machine)
> does not.  C110 doesn't have PCI and maybe different keyboard/LAN.
> Find out what is different between the two machines and see if ccio
> changes broke one of the drivers for the different HW.
> 
C110's Devices						      |	C360's Devices

Raven 120 T' (Processor)  (PA7200 (PCX-T'))		      |	Raven W 360 (9000/780/????) (Processor)  (PA8500 (PCX-W))
SkyHawk 100/120 (Memory)				      |	Raven W 360 Memory (Memory)
SkyHawk 100/120 FW-SCSI (A DMA) (Zalon driver)		      |	Raven U/L2 Dino RS-232 (Foreign I/O Module) (Serial driver)
Raven T' Core Centronics (Foreign I/O Module) (Parallel drive |	Raven+ w Core Centronics (Foreign I/O Module) (Paral
Raven T' Audio (Foreign I/O Module) (Harmony driver)	      |	Raven+ w Core Audio (Foreign I/O Module) (Harmony d
Raven T' Lasi Core RS-232 (Foreign I/O Module) (Serial driver |	Raven+ w Core RS-232 (Foreign I/O Module) (Serial d
Raven T' Core SCSI (Foreign I/O Module) (NCR53c710 driver)    |	Raven+ w Core SCSI (Foreign I/O Module) (NCR53c710
Raven T' Core LAN (802.3) (Foreign I/O Module) (Lasi_82596 dr |	Raven+ w Core PC Keyboard (Foreign I/O Module) (PS/
Raven T' Core PC Keyboard (Foreign I/O Module) (PS/2 driver)  |	Raven+ w Core BA (Bus Adapter) (Lasi driver)
Raven T' Core PC Floppy (Foreign I/O Module)		      <
Raven T' Wax HIL (Foreign I/O Module) (HIL driver)	      <
Raven T' Wax RS-232 (Foreign I/O Module) (Serial driver)      <
Raven T' GSC Core Graphics (Foreign I/O Module)		      <
Raven T' Core BA (Bus Adapter) (Lasi driver)		      <
Raven T' Wax BA (Bus Adapter) (Wax driver)		      <
Raven T' Wax EISA BA (Bus Adapter)			      <
U2-IOA BC Runway Port (IOA) (x2)				U2-IOA BC Runway Port (IOA) (x2)
							      >	Dino PCI Bridge (Bus Bridge to Foreign Bus) (Dino driver)
							      >	Cujo PCI Bridge (Bus Bridge to Foreign Bus) (Dino driver)
							      >
							      >	53c875 (Symbios Logic Inc. (formerly NCR)) (SYM8xx driver)
							      >	DECchip 21142/43 (Digital Equipment Corporation) (Tulip drive
							      >	Visualize FX4 (Hewlett-Packard Company)

This is diff -y of devices list grab from web h/w db (may be c360 list could be confirmed by James with a dmesg file?)
It help me to point out 2 big diff: scsi Zalon driver and Lasi_82596 Lan nic (I removed HIL modules simply because no device 
available).

That said the system always became to hang when I start a large disk i/o with a find into a linux kernel for example and also by 
accident I also start a kernel without Lasi module (and iirc the same pb occured) but in any case I could make it leave without 
Zalon driver; or did I miss something else in my .config (so much diff between the 2 config I used).

(C110 need long hours to compile the kernel :( but that is all I have at home)

> You might need to add pdc_io_reset_devices() to ccio_ioc_init()
> since we moved that out of the common code path.

hmm I don't see such stuff in patches I grab of jejb changes?
Any way I see what you did in sba_hw_init() (I will so be able to reproduce it ;) )

> I don't see that
> in CCIO driver and it's not clear to me if HIL or LAN need it on C110.
> 
> It *might* need pdc_io_reset() call instead (or in addition)
> but I don't know.  Just another thing to be aware of.
> 
Thanks for all kind advise (it will just take me much more test and so many time before I could figure out the actual pb)

Joel
