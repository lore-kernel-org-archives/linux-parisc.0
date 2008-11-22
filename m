From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Fri, 21 Nov 2008 22:57:54 -0700
Message-ID: <20081122055754.GB12724@colo.lackof.org>
References: <20081120035103.E1C62431A@hiauly1.hia.nrc.ca> <20081120165701.52A09431A@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: James.Bottomley@HansenPartnership.com, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081120165701.52A09431A@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Nov 20, 2008 at 11:57:00AM -0500, John David Anglin wrote:
> > VFS: Cannot open root device "sda3" or unknown-block(0,0)
> > Please append a correct "root=" boot option; here are the available partitions:
> > DEBUG_BLOCK_EXT_DEVT is enabled, you need to specify explicit textual name for "root=" boot option.
> > Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
> > Rebooting in 5 seconds..
> 
> I would guess this is because the kernel is in the palo partition.  2.6.27
> doesn't have this problem...

I'm not seeing this with 2.6.28-rc3 or 2.6.28-rc5.
But I don't have DEBUG_BLOCK_EXT_DEVT enabled either.

The palo partition is just another ext2 filesystem from the kernel
point of view.

Maybe the full device pathname (e.g. root=/dev/sda3) is required?
It fully failed to associate sda3 with a known block device.

hth,
grant
