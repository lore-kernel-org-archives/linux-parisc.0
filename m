From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Wed, 19 Nov 2008 22:51:03 -0500 (EST)
Message-ID: <20081120035103.E1C62431A@hiauly1.hia.nrc.ca>
References: <1227061902.10371.11.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, linux-parisc@vger.kernel.org
To: James.Bottomley@HansenPartnership.com (James Bottomley)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1227061902.10371.11.camel@localhost.localdomain> from "James Bottomley" at Nov 19, 2008 11:31:42 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Why don't we compare configs?  This is mine for ion:
> 
> http://parisc-linux.org/~jejb/config-2.6.28-rc5-ion
> 
> I suspect we have some nasty interaction in the device driver subsystem
> (ion, the pa8900, isn't running either USB or PDC stable).

I tried this on what was ior:

HARD Booted.
palo ipl 1.14 root@penalosa Wed Oct  8 15:04:37 UTC 2008

Partition Start(MB) End(MB) Id Type
1               1     101   f0 Palo
2             102    1082   82 swap
3            1083   34726   83 ext2

PALO(F0) partition contains:
PALO is formatted EXT2/3
Command line for kernel: 'root=/dev/sda3 panic=5 console=ttyS1 palo_kernel=1/vmlinux'
Selected kernel: /vmlinux from partition 1

...

VFS: Cannot open root device "sda3" or unknown-block(0,0)
Please append a correct "root=" boot option; here are the available partitions:
DEBUG_BLOCK_EXT_DEVT is enabled, you need to specify explicit textual name for "root=" boot option.
Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
Rebooting in 5 seconds..

What's missing?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
