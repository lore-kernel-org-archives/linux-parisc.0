From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: HPMC bus timeout on C3600
Date: Thu, 25 Dec 2008 14:36:25 -0700
Message-ID: <20081225213625.GA7716@colo.lackof.org>
References: <20081220133915.4c167e09@bleh.bxl.tuxicoman.be> <20081220221653.GA12880@bombadil.infradead.org> <20081220222100.GB12880@bombadil.infradead.org> <20081221081206.GC2047@colo.lackof.org> <20081222224023.2488f2ef@tuxicoman.be> <20081222214743.GC30144@bombadil.infradead.org> <20081222234948.776edb1b@tuxicoman.be> <20081225080606.GA11032@colo.lackof.org> <20081225165750.29c5974c@bleh.bxl.tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	Kyle McMartin <kyle@infradead.org>,
	linux-parisc@vger.kernel.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081225165750.29c5974c@bleh.bxl.tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Dec 25, 2008 at 04:57:50PM +0100, Guy Martin wrote:
> On Thu, 25 Dec 2008 01:06:06 -0700
> Grant Grundler <grundler@parisc-linux.org> wrote:
> 
> > [ 1589.466507] Badness at fs/buffer.c:1186
> > 
> > Technically, this isn't a panic. This is a "WARN_ON".
> > I didn't see any panic's after that either.
> 
> Yes sorry. The system is still usable after the WARN_ON occurs. So no
> panic.
> 
> Because of this, wouldn't it be a good idea to commit Kyle's patch ?

I don't think kyle intended to commit that patch. He just wanted to
collect more info.

HPMC is 99% (for parisc-linux at least) of the time a driver bug.
So having the system crash on IO errors (including DMA map/unmap bugs)
is good for getting bugs reported and the state of the IOMMU and PCI
Host controller to debug the problem.

On the other hand, users often don't care about those details even if they
see (like you did) the device isn't working right. They can more easily
track down which device/drivers are having problems and remove them from
the config.

> To me it seems better to have a running system with failure messages
> being log rather than an ugly and barely understandable HPMC.

While I agree with your characterization of HPMCs, I don't want to trade
HPMC dumps for kernel logs.  HPMC provides info we can't otherwise get.

HPMCs might be more useful if the symbol name of every kernel address
in the dump were printed.  Given the System.map, it should be
possible to do something like:
    hpmc_symbols System.map < HPMC_dump.txt > HPMC_symbols.txt

The program "a.c" already exists to do a symbol lookup given an kernel
address and System.map file:
    http://cvs.parisc-linux.org/build-tools/

> > The file system warning us that the sata disk it was
> > talking failed an IO. 
> > 
> > However, this is likely to be some other issue with the SATA
> > controller. Can you post more details about the config?
> > o "lspci -v"
> > o hdparm -i /dev/sd<X>
> 
> Here it is :
> 
> 01:04.0 Mass storage controller: Silicon Image, Inc. SiI 3112 [SATALink/SATARaid] Serial ATA Controller (rev 02)

Ok...so this is the sata_sil driver.

>         Subsystem: Silicon Image, Inc. SiI 3112 SATALink Controller
>         Flags: bus master, 66MHz, medium devsel, latency 240, IRQ 21
>         I/O ports at 12400 [size=8]
>         I/O ports at 12300 [size=4]
>         I/O ports at 12200 [size=8]
>         I/O ports at 12100 [size=4]
>         I/O ports at 12000 [size=16]
>         Memory at fb807000 (32-bit, non-prefetchable) [size=512]
>         Expansion ROM at fb880000 [disabled] [size=512K]
>         Capabilities: [60] Power Management version 2
>         Kernel modules: sata_sil
> 
>  
> /dev/sdc:
> 
>  Model=WDC WD5000AAKS-00TMA0                   , FwRev=12.01C01, SerialNo=     WD-WMAPW1390228
>  Config={ HardSect NotMFM HdSw>15uSec SpinMotCtl Fixed DTR>5Mbs FmtGapReq }
>  RawCHS=16383/16/63, TrkSize=0, SectSize=0, ECCbytes=50
>  BuffType=unknown, BuffSize=16384kB, MaxMultSect=16, MultSect=?0?
>  CurCHS=16383/16/63, CurSects=16514064, LBA=yes, LBAsects=976773168
>  IORDY=on/off, tPIO={min:120,w/IORDY:120}, tDMA={min:120,rec:120}
>  PIO modes:  pio0 pio3 pio4 
>  DMA modes:  mdma0 mdma1 mdma2 
>  UDMA modes: udma0 udma1 udma2 udma3 udma4 *udma5 udma6 
>  AdvancedPM=no WriteCache=disabled
>  Drive conforms to: Unspecified:  ATA/ATAPI-1,2,3,4,5,6,7
>  * signifies the current active mode

Ok - looks normal.

> I'd like to add that I've been using the exact same card and hard drive
> on one of my x86 box for month without any issue.

That doesn't mean the driver and chip operate 100% correctly.
Has anyone run exhaustive tests to detect data corruption with this card?

Looking at the sil_interrupt() code, it seems a PCI Master abort was
sometimes expected when reading the bmdma2 register:
	u32 bmdma2 = readl(mmio_base + sil_port[ap->port_no].bmdma2);
	...
	if (bmdma2 == 0xffffffff ||
	    !(bmdma2 & (SIL_DMA_COMPLETE | SIL_DMA_SATA_IRQ)))
		continue;


Also, older X86 platforms generally don't have an IOMMU (newer ones will)
and thus can't validate DMA transactions. I don't have the impression that's
the problem here though. But someone needs to decode the "Word2" of the
HPMC dump that you already provided.


> Also I've reproduce the problem again and this time I've had this message right before the "end_request" line :
> [  163.039983] timer_interrupt(CPU 0): delayed! cycles EB5EE1E6 rem 36AE6  next/now 706F7328/5BCE550E

Error handlers sometimes don't play nicely with interrupts.
I don't know enough about the error handling cases to track this down.

> Anything else I can do/provide to troubleshoot this ?

Two things:
o consider posting some of the original findings on linux-ide and see if
  anyone has tested this controller on PPC or IA64.  I'm looking for any
  other architecture that has "hard fail" behavior like parisc does.
  Testing on any other Big Endian HW would be worth hearing about too.

o write a quick and dirty "hpmc_symbols" script as described above and 
  run it on the HPMC you provided earlier.

Debugging this further wil probably require modifying the sata_sil driver 
to log (e.g. ktrace) it's activities while under test.

hth,
grant
