From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] CONFIG_DISCONTIGMEM, try 2
Date: 06 Jul 2004 13:02:33 -0500
Message-ID: <1089136958.1767.534.camel@mulgrave>
References: <20040706071459.GA567@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040706071459.GA567@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, 2004-07-06 at 02:15, Randolph Chung wrote:
> Since we put all memory into ZONE_DMA, the comment is wrong -- ZONE_DMA
> memory can in fact be >4GB. So, either we partition the memory so that
> it adheres to the above constraint, otherwise we will need to redo the
> pgd/pmd layouts a bit. jejb: comments? :) (In fact this will be a
> problem without CONFIG_DISCONTIGMEM if we have a machine that 
> supported >4GB of contiguous memory)

Actually, no, we always planned to stop ZONE_DMA at 4GB for this reason
even if it has an IOMMU (this is a fairly standard risc trick, I
think).  What we're trying to do is to save space in the PGD/PMD pages
by using "short" pointers. if we know that PTE pages are allocated only
in the first 4GB of memory, then we can point to them with only 32 bits
(even on a 64 bit machine).

We could save space by shifting the pointers before dereferencing. 
Since the PTE/PMD pages are page aligned, we don't actually need the
lower 12 bits of the pointer.  Although we currently use those bits for
page flags, all we're really interested in are valid and present bits so
with a bit of shifting, we could make these short pointers address up to
42 bits, which is over the range of even the pa8800's physical memory
capabilities (40 bits).

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
