Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lefou.zayda.com (unknown [204.99.158.177])
	by dsl2.external.hp.com (Postfix) with ESMTP id 212EB482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Sep 2001 23:43:56 -0600 (MDT)
Received: from localhost (sonny@localhost)
	by lefou.zayda.com (8.9.3/8.9.3) with ESMTP id XAA15249
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Sep 2001 23:43:54 -0600
Date: Wed, 19 Sep 2001 23:43:54 -0600 (MDT)
From: Sonny Cook <sonny@aspersion.org>
To: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] linux and hp 735/125 fs corruption
In-Reply-To: <20010916115518.A1399@middle.of.nowhere>
Message-ID: <Pine.LNX.4.33.0109192331150.14604-100000@lefou>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sun, 16 Sep 2001 thunder7@xs4all.nl wrote:
A snippet from my logs--this is from one of the times that the problem
happened first the logs for my scsi stuff:

Aug 24 20:56:34 geordi kernel: SCSI subsystem driver Revision: 1.00
Aug 24 20:56:34 geordi kernel: sim700: Configuring 53c700 (SCSI-ID 7) at
f0825100, IRQ 86, options 1
Aug 24 20:56:35 geordi kernel: scsi0: Revision 0x0
Aug 24 20:56:35 geordi kernel: scsi0: test 1 completed ok.
Aug 24 20:56:35 geordi kernel: scsi0 : LASI/Simple 53c7xx
Aug 24 20:56:35 geordi kernel:   Vendor: SEAGATE   Model: ST32151N
Rev:  HP01
Aug 24 20:56:35 geordi kernel:   Type:   Direct-Access ANSI SCSI revision:
02
Aug 24 20:56:35 geordi kernel: Detected scsi disk sda at scsi0, channel 0, id 1, lun 0
Aug 24 20:56:35 geordi kernel: SCSI device sda: 4194685 512-byte hdwr sectors (2148 MB)
Aug 24 20:56:35 geordi kernel: Partition check:
Aug 24 20:56:35 geordi kernel:  sda: sda1 sda2
Aug 24 20:56:35 geordi kernel: linear personality registered
Aug 24 20:56:35 geordi kernel: raid0 personality registered
Aug 24 20:56:35 geordi kernel: raid1 personality registered
Aug 24 20:56:35 geordi kernel: raid5 personality registered
Aug 24 20:56:35 geordi kernel: raid5: measuring checksumming speed
Aug 24 20:56:35 geordi kernel:    8regs     :    86.487 MB/sec
Aug 24 20:56:35 geordi kernel:    8regs_prefetch:    86.487 MB/sec
Aug 24 20:56:35 geordi kernel:    32regs    :    94.488 MB/sec
Aug 24 20:56:35 geordi kernel:    32regs_prefetch:    94.488 MB/sec
Aug 24 20:56:35 geordi kernel: raid5: using function: 32regs_prefetch (94.488 MB/sec)

And then the errors:

Aug 24 21:04:17 geordi kernel: attempt to access beyond end of device
Aug 24 21:04:17 geordi kernel: 08:02: rw=0, want=1490348228, limit=2079077
Aug 24 21:04:17 geordi kernel: attempt to access beyond end of device
Aug 24 21:04:17 geordi kernel: 08:02: rw=0, want=13683948, limit=2079077
Aug 24 21:04:17 geordi kernel: attempt to access beyond end of device
Aug 24 21:04:17 geordi kernel: 08:02: rw=0, want=1237161376, limit=2079077
Aug 24 21:04:17 geordi kernel: attempt to access beyond end of device
Aug 24 21:04:17 geordi kernel: 08:02: rw=0, want=746694036, limit=2079077
Aug 24 21:04:20 geordi kernel: (device sd(8,2)): ext2_free_blocks: Freeing
block
s not in datazone - block = 1769104416, count = 1
Aug 24 21:04:20 geordi kernel: Remounting filesystem read-only
Aug 24 21:04:20 geordi last message repeated 108 times

Any ideas???

> On Sun, Sep 16, 2001 at 01:45:53AM -0600, Sonny Cook wrote:
> >
> > I am baffeled.  I haven't been able to find any information on this
> > subject, other than to note that 2.4.0 has been blamed for fs corruption
> > on some systems.
> >
> I have seen lots of disk-corruption on my C200+, both with 2.4.0 and
> with 2.4.9-pa{16|18|20} but it always seems to start with some
> scsi-error. By the time the partition is remounted r/o, things like
> complete linux-kernel source trees are crosslinked and corrupted. So
> far, I've not lost anything really essential, but having all the links
> in /etc/rc2.d/ removed wasn't that much fun.
>
> Do you have any messages in the log-files?
>
> Good luck,
> Jurriaan
>
