Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "James Braid" <james.braid@peace.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Dodgy SCSI in L2000 
In-Reply-To: Message from "James Braid" <james.braid@peace.com>
   of "Tue, 07 May 2002 19:00:40 +1200." <000201c1f594$e5bc6aa0$5e01000a@bongo>
References: <000201c1f594$e5bc6aa0$5e01000a@bongo> 
Date: Tue, 07 May 2002 17:50:47 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020507235047.6A2B6482A@dsl2.external.hp.com>
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

"James Braid" wrote:
> 2.4.18-pa24, and
> 2.4.18-pa23 

ok - those are running mostly ok on the A500.
Still have stability problems.

Our best 2.4.18 kernel so far is the non-SMP kernel I built for -pa7.
See ftp.parisc-linux.org/kernels/a500.

> > This suggests something is wrong with that device.
> > Are all RAID0 disks internal? Or connected to external box?
> > I see further down they seem to be working fine individually.
> 
> All disks are internal disks in the hotswap cage thing, connected to the
> core I/O board (? not sure if that's what its called , it's a big board
> with 3 SCSI cables on it and the ethernet jack/external SCSI). All the
> disks are plugged into this, two disks per cable, and the DVD on its own
> cable.

This still sounds like a problem with the cable or termination.

> 00:01.0 SCSI storage controller: LSI Logic / Symbios Logic (formerly
> NCR) 53c896 (rev 05)
...
> 00:01.1 SCSI storage controller: LSI Logic / Symbios Logic (formerly
> NCR) 53c896 (rev 05)

yeah - this is the same thing.

...
> The Qlogic cards I put in as I was going to move the scsi drives onto
...

I don't expect the extra cards to cause any problems.

...
> I will try again with dbench on just one disk at a time as well.

That sounds like a good idea.

Another general warning: we haven't tested L2000 as much as other boxes.

I've taken a quick look at sym53c8xx driver and the first routine
I look at has a sequence I don't like to see:
static void ncr_chip_reset (ncb_p np)
{
	OUTB (nc_istat, SRST);
	UDELAY (10);
	OUTB (nc_istat, 0);
}

This sequence is fine when using IO port space but not OK
for MMIO space. (posted write preceding a udelay and nothing
to force the clearing of SRST down).

Can you try a kernel with SCSI_NCR_IOMAPPED=y?

grant
