Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id AD3884840
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Nov 2003 08:16:11 -0700 (MST)
Date: Thu, 27 Nov 2003 15:16:08 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C3000 and 2.6 - need config help
In-Reply-To: <20031127061557.GE1321@colo.lackof.org>
Message-ID: <Pine.LNX.4.58.0311271450260.13181@sal.ucc.ie>
References: <Pine.LNX.4.58.0311201817470.21743@sal.ucc.ie>
 <Pine.LNX.4.58.0311270244030.9783@sal.ucc.ie> <20031127042103.GC1321@colo.lackof.org>
 <Pine.LNX.4.58.0311270423120.9783@sal.ucc.ie> <Pine.LNX.4.58.0311270444110.9783@sal.ucc.ie>
 <20031127061557.GE1321@colo.lackof.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Wed, 26 Nov 2003, Grant Grundler wrote:

> However, I just now wonder if the limiting factor is not the IDE if the
> kernel is copying data to/from kernel to user space.  Our copy_to/from_user
> could be alot more efficient (2x guesstimate) for the PA8500 CPU.
> I see max bandwidth of 4-5MB/s on a PA8600 (552Mhz) over 100BT.

The limiting factor is definitely not the IDE hard disk, it's a new
Seagate 120GB which has a sustained data transfer rate of >30MB/s.

The max. transfer rate of any 100BT network is around 5MByte/s.

Personally I also get something between 4-5MB/s from any host to any
hosy in my home network. If I do a network transfer to the C3k (IDE hard disk),
I get about 4.5MB/s, but after a while the transfer stalls for a short
time, and then continues. However I see sustained 4.5MB/s to my C3k if I
write to any of the SCSI hard disks - without any stalls.

I suppose if it tries to write the data to the IDE hard disk (3.3MB/s),
it can't keep up with the speed of the network (4.5MB/s), so it buffers
the data in the RAM. At some point the buffer is full and the kernel
delays the networks transfer until the buffer content is written to the
IDE disk.


> With a 32X CD-ROM drive in my c3k, "time dd" is only getting 925 KB/s.
> I'll guess a few more factors could be muddying the waters here.

That's equivalent to a 5-6X CD-ROM. Ouch.

[...]

Quite a lot old IDE cdroms drives don't support dma transfers.
Hower you'll get the same message if you try to enable DMA if you have a
kernel that doesn't have a driver with DMA support for your IDE chipset.

I honestly don't thing DMA works ...


 Max
