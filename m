From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Thu, 20 Nov 2008 11:57:00 -0500 (EST)
Message-ID: <20081120165701.52A09431A@hiauly1.hia.nrc.ca>
References: <20081120035103.E1C62431A@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: James.Bottomley@HansenPartnership.com, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081120035103.E1C62431A@hiauly1.hia.nrc.ca> from "John David Anglin" at Nov 19, 2008 10:51:03 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> VFS: Cannot open root device "sda3" or unknown-block(0,0)
> Please append a correct "root=" boot option; here are the available partitions:
> DEBUG_BLOCK_EXT_DEVT is enabled, you need to specify explicit textual name for "root=" boot option.
> Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
> Rebooting in 5 seconds..

I would guess this is because the kernel is in the palo partition.  2.6.27
doesn't have this problem...

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
