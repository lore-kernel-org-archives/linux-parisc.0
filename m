From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: parisc: flush pages through tmpalias space
Date: Sat, 1 Jan 2011 14:00:53 -0500
Message-ID: <20110101190052.GA19156@hiauly1.hia.nrc.ca>
References: <1293034931.3019.8.camel@mulgrave.site> <20101229042346.GA973@hiauly1.hia.nrc.ca> <1293634281.2803.4.camel@fuzzy> <20101230155640.GA7058@hiauly1.hia.nrc.ca> <20101230160944.GA7360@hiauly1.hia.nrc.ca> <20110101183108.GA19035@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110101183108.GA19035@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 01 Jan 2011, John David Anglin wrote:

> mmap(0x406b1000, 28672, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x158000) = 0x406b1000
> 
> This is from glibc.

In arch_get_unmapped_area(), it says:

	/* Might want to check for cache aliasing issues for MAP_FIXED case
	 * like ARM or MIPS ??? --BenH.
	 */
	if (flags & MAP_FIXED)
		return addr;

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
