Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4A3CB4840
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Nov 2003 23:15:59 -0700 (MST)
Date: Wed, 26 Nov 2003 23:15:57 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C3000 and 2.6 - need config help
Message-ID: <20031127061557.GE1321@colo.lackof.org>
References: <Pine.LNX.4.58.0311201817470.21743@sal.ucc.ie> <Pine.LNX.4.58.0311270244030.9783@sal.ucc.ie> <20031127042103.GC1321@colo.lackof.org> <Pine.LNX.4.58.0311270423120.9783@sal.ucc.ie> <Pine.LNX.4.58.0311270444110.9783@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.58.0311270444110.9783@sal.ucc.ie>
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

On Thu, Nov 27, 2003 at 04:45:49AM +0000, M. Grabert wrote:
> I forgot to mention my current IDE settings (unchanged since August):
> 
> root@beast:/home/xam# hdparm -c /dev/hda
> 
> /dev/hda:
>  IO_support   =  1 (32-bit)

The above info is either wrong or ignored.
"data" register for PC87560 is 16-bits only.
(IDE function is NS87415 compatible)

> root@beast:/home/xam# hdparm -d /dev/hda
> 
> /dev/hda:
>  using_dma    =  1 (on)

Given only 3MB/s, I find it hard to believe.
SuckyIO (PC87560UBD) Data sheet claims 16MB/s per channel. 

However, I just now wonder if the limiting factor is not the IDE if the
kernel is copying data to/from kernel to user space.  Our copy_to/from_user
could be alot more efficient (2x guesstimate) for the PA8500 CPU.
I see max bandwidth of 4-5MB/s on a PA8600 (552Mhz) over 100BT.

With a 32X CD-ROM drive in my c3k, "time dd" is only getting 925 KB/s.
I'll guess a few more factors could be muddying the waters here.

root@gggc3k:~# hdparm -i /dev/cdrom

/dev/cdrom:

 Model=CD-532E-B, FwRev=2.0A, SerialNo=
 Config={ Fixed Removeable DTR<=5Mbs DTR>10Mbs nonMagnetic }
 RawCHS=0/0/0, TrkSize=0, SectSize=0, ECCbytes=0
 BuffType=DualPortCache, BuffSize=128kB, MaxMultSect=0
 (maybe): CurCHS=0/0/0, CurSects=0, LBA=yes, LBAsects=0
 IORDY=on/off, tPIO={min:120,w/IORDY:120}, tDMA={min:120,rec:120}
 PIO modes:  pio0 pio1 pio2 pio3 pio4 
 DMA modes:  sdma0 sdma1 sdma2 mdma0 mdma1 *mdma2 
 AdvancedPM=no

 * signifies the current active mode


root@gggc3k:~# hdparm /dev/cdrom

/dev/cdrom:
 HDIO_GET_MULTCOUNT failed: Invalid argument
 IO_support   =  0 (default 16-bit)
 unmaskirq    =  0 (off)
 using_dma    =  0 (off)
 keepsettings =  0 (off)
 readonly     =  1 (on)
 readahead    =  8 (on)
 HDIO_GETGEO failed: Invalid argument

Note the mdma2 and using_dma settings don't agree.
I tried to set using_dma:

root@gggc3k:~# hdparm -d 1 /dev/cdrom

/dev/cdrom:
 setting using_dma to 1 (on)
 HDIO_SET_DMA failed: Operation not permitted
 using_dma    =  0 (off)
root@gggc3k:~# uname -a
Linux gggc3k 2.4.22-pa17 #18 Fri Nov 21 21:16:31 PST 2003 parisc GNU/Linux


BTW, I checked that CONFIG_IDEDMA_ONLYDISK is off.

grant
