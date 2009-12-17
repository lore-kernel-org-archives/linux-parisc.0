From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [git patches] xfs and block fixes for virtually indexed arches
Date: Thu, 17 Dec 2009 19:45:55 +0100
Message-ID: <87zl5hsal8.fsf@basil.nowhere.org>
References: <20091216043618.GB9104@hera.kernel.org>
	<20091217132256.GO28962@bombadil.infradead.org>
	<alpine.LFD.2.00.0912170811130.15740@localhost.localdomain>
	<20091217163036.GE2123@thunk.org>
	<20091217171025.GB10431@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: tytso@mit.edu, Linus Torvalds <torvalds@linux-foundation.org>,
	Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091217171025.GB10431@infradead.org> (Christoph Hellwig's message of "Thu, 17 Dec 2009 12:10:25 -0500")
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Christoph Hellwig <hch@infradead.org> writes:

> On Thu, Dec 17, 2009 at 11:30:36AM -0500, tytso@mit.edu wrote:
>> That's because apparently the iSCSI and DMA blocks assume that they
>> have Real Pages (tm) passed to block I/O requests, and apparently XFS
>> ran into problems when sending vmalloc'ed pages.  I don't know if this
>> is a problem if we pass the bio layer addresses coming from the SLAB
>> allocator, but oral tradition seems to indicate this is problematic,
>> although no one has given me the full chapter and verse explanation
>> about why this is so.
>
> Actually at least iscsi now has a workaround for that by checking for
> PageSlab.  Back when we deal with the XFS issue that check was only
> available with debug options enabled.  I tried to sort it out by
> agreeing with the block and iscsi folks that either

DRBD has the same workaround as well:

        if (disable_sendpage || (page_count(page) < 1) || PageSlab(page))

But it seems like a gross hack to me. Perhaps this should be 
passed as some sort of BIO attribute?

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only.
