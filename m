From: "M. Grabert" <xam@cs.ucc.ie>
Subject: Re: [parisc-linux] Re: 2.6.4-rc1-pa3 siimage/NS87415 IDE progess (and
	another mystery)!
Date: Mon, 12 Jul 2004 05:19:35 +0100
Message-ID: <20040712041935.GA10211@sal.ucc.ie>
References: <Pine.LNX.4.58.0403040044200.14527@sal.ucc.ie>
	<20040309063629.GM1113@tausq.org>
	<Pine.LNX.4.58.0403090656070.13701@sal.ucc.ie>
	<20040309072917.GN1113@tausq.org>
	<Pine.LNX.4.58.0403091401480.16082@sal.ucc.ie>
	<20040711221829.GA27835@colo.lackof.org>
	<20040711231401.GW546@tausq.org> <20040711233439.GX546@tausq.org>
	<20040712033752.GA10163@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
To: Randolph Chung <randolph@tausq.org>,
 Grant Grundler <grundler@parisc-linux.org>,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040712033752.GA10163@sal.ucc.ie>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Sorry, there was a typo:

On Mon, Jul 12, 2004 at 04:37:52AM +0100, xam wrote:
>
> hdparm -c /dev/hda showed DMA was turned on, and I even set it on
> again (hdparm -c 1), just to be sure, but it didn't make any
> difference in performance :(

I meant 'hdparm -d' of course ...

BTW, what are the supported DMA modes of the NS87415?
The kernel just reports this:

  DMA zone: 262144 pages, LIFO batch:16
    ide0: BM-DMA at 0x0a00-0x0a07, BIOS settings: hda:pio, hdb:pio
    ide1: BM-DMA at 0x0a08-0x0a0f, BIOS settings: hdc:pio, hdd:pio
  hda: 234441648 sectors (120034 MB) w/2048KiB Cache, CHS=16383/255/63, (U)DMA
          
I suppose BM-DMA means BusMaster-DMA, but does the NS87415 support any
Ultra-DMA modes, or only Multi-Word DMA?
A 'hdparm -i /dev/hda' says this about the hdd settings/capabilities:

  PIO modes:  pio0 pio1 pio2 pio3 pio4
  DMA modes:  mdma0 mdma1 *mdma2
  UDMA modes: udma0 udma1 udma2 udma3 udma4 udma5

Here's the performance table for pio/mdma/udma:

   pio0    3.33 MB/s
   pio1    5.22 MB/s
   pio2    8.33 MB/s
   pio3   11.11 MB/s
   pio4   16.67 MB/s
  mdma0    4.16 MB/s
  mdma1   13.33 MB/s
  mdma2   16.67 MB/s
  mdma3   33.33 MB/s
  udma0   16.67 MB/s
  udma1   25.00 MB/s
  udma2   33.33 MB/s
  udma3   44.44 MB/s
  udma4   66.67 MB/s
  udma5  100.00 MB/s
  udma6  133.33 MB/s

According to the current setting (mdma2), I should get about 16 MB/s
(the hard disk specified 'sustained data transfer rate' is >40 MB/s).
However with a 2.4 kernel I only get 3.3 MB/s and with a 2.6 kernel
I get just about 3.0 MB/s, which suggests it's running in 'pio0' mode.

Also there is a significant CPU load whenever I do a read/write access to
the IDE hard disk (compared to the CPU load when I access the SCSI disks),
which might be another indication that it's still using PIO and not DMA.


Final question:

Is 
  'hdparm -c 1' (enable 32bit I/O)
and
  'hdparm -u 1' (unmasq_irq)
useful/implemented on PA-RISC?


Greetings,
   Max
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
