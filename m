From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: SCSI bug
Date: Sun, 21 Feb 2016 11:07:56 -0800
Message-ID: <1456081676.2340.10.camel@HansenPartnership.com>
References: <28D5FC66-A9E6-4F3E-A8AC-F9E68A6BC543@bell.net>
	 <82D4BF6F-05CF-4441-9530-79475BFF84F3@bell.net>
	 <E2C8DBC2-F0AD-4C78-BD63-9C85B387E284@bell.net> <56C8E1AC.3030409@gmx.de>
	 <038473FE-9E6D-4F03-BBD4-9844B7B529E1@bell.net>
	 <9C42B388-96D5-412A-BAC3-14E93415CA21@bell.net>
	 <1456026424.2268.5.camel@HansenPartnership.com>
	 <14EF1F4E-8045-4990-B29E-D489E82B1929@bell.net>
	 <1456078381.2340.5.camel@HansenPartnership.com>
	 <D14AFC12-8245-4862-9FFA-92A4F114FC41@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Helge Deller <deller@gmx.de>,
	linux-parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <D14AFC12-8245-4862-9FFA-92A4F114FC41@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2016-02-21 at 13:43 -0500, John David Anglin wrote:
> I verified that commit 54efd50bfd873e2dbf784e0b21a8027ba4299a3e in
> linux-block fails to
> boot and commit 41609892701e26724b8617201f43254cadf2e7ae (blk-cgroup:
> Drop unlikely
> before IS_ERR(_OR_NULL)) does boot successfully.  Commit
> 41609892701e26724b8617201f43254cadf2e7ae
> is previous commit in tree.
> 
> I don't believe that the change can be reverted from Linus' tree as
> this commit allowed other
> stuff to be removed (see second paragraph of commit description).

OK, can you just verify you can boot 4.5-rc5 without the sata_sil24
driver?

My theory, based on what Helge produced is that this commit is building
a large transfer list > 65535 and then splitting it wrongly.  I think
the problem is that it's not respecting the DMA boundary, so Helge sees
a transfer size of 69632 which I think slops over on both sides,
requiring 3 segments to describe.  However, the merge code thinks we
only need two (because the length is < 2*65536).  The reason we only
see this with ATA drivers is because virtually no SCSI drivers set the
DMA boundary.  Most ATA drivers require a dma boundary of 65535.

James

