From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: ccio_clear_io_tlb() and __raw_write() more question?
Date: Wed, 16 Jan 2008 06:03:16 -0700
Message-ID: <20080116130316.GL18741@parisc-linux.org>
References: <JUQMH1$0E837D5F7A1526B30DCF5BF1A8BE2816@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	Grant Grundler <grundler@parisc-linux.org>
To: rubisher <rubisher@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <JUQMH1$0E837D5F7A1526B30DCF5BF1A8BE2816@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Jan 16, 2008 at 01:53:25PM +0100, rubisher wrote:
> So my worry is that this data write could be cached and btw the actual
> CMD_TLB_PURGE operation could be delay untill this entry would be purged?

f-space is uncached.

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
