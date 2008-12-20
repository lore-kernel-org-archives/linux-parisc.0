From: Kyle McMartin <kyle@infradead.org>
Subject: Re: HPMC bus timeout on C3600
Date: Sat, 20 Dec 2008 17:21:00 -0500
Message-ID: <20081220222100.GB12880@bombadil.infradead.org>
References: <20081220133915.4c167e09@bleh.bxl.tuxicoman.be> <20081220221653.GA12880@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081220221653.GA12880@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Dec 20, 2008 at 05:16:53PM -0500, Kyle McMartin wrote:
> you can try hacking elroy to set softfail mode on that bus, which will
> result in a timeout on the pci bus to return -1 (like what x86 and most
> other architectures do) rather than hang the box, but it really likely
> means a driver bug.

untested and all that jazz.

diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index a28c894..a34f759 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -1341,7 +1341,7 @@ lba_hw_init(struct lba_device *d)
 
 	/* Set HF mode as the default (vs. -1 mode). */
         stat = READ_REG32(d->hba.base_addr + LBA_STAT_CTL);
-	WRITE_REG32(stat | HF_ENABLE, d->hba.base_addr + LBA_STAT_CTL);
+	WRITE_REG32(stat & ~HF_ENABLE, d->hba.base_addr + LBA_STAT_CTL);
 
 	/*
 	** Writing a zero to STAT_CTL.rf (bit 0) will clear reset signal
