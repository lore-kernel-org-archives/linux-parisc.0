Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA29258
	for <parisc-linux@puffin.external.hp.com>; Tue, 5 Sep 2000 11:11:58 -0600
Message-Id: <200009051715.KAA23252@milano.cup.hp.com>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: Kernel panic: ccio-dma.c:ccio_alloc_range() I/O MMU is out of mapping resources 
In-reply-to: Your message of "Mon, 04 Sep 2000 02:20:18 PDT."
             <39B35B41.20C70524@uswest.net>
Date: Tue, 05 Sep 2000 10:15:28 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Ryan Bradetich wrote:
> Grant,
> 
> I was hoping  you could expand upon your comment regarding the error
> message.  I have a test case that reliably generates several of these
> messages, and I would like to see if I could fix it (If Bob Pflederer
> doesn't beat me too it :)).

Hi Ryan,
I've cc'd the list since this turned out to be fairly long and will
be of interest to a few others. Besides, if I don't understand something
right either, someone could correct me.... :^)

> I see that you have a FIXME.... but it seems that if the I/O MMU is out
> of resources, it should free up a resource (maybe via LRU) instead of a
> kernel panic?

Nope. The main problem with the code is the allocation algorithm
makes extremely poor use of available resources. This is discussed
at length below.

Secondly, since we cripple the memory available to 128MB, the sizing
of the I/O pdir is also "crippled" to a corresponding size and thus
I/O Pdir allocation won't "scale" with the system. The assumption is
a system with more I/O devices will also have more memory....but
IMHO, crippling the memory size is really a secondary issue and will
get fixed soon enough.

> Sanity Check (Just to make sure I understand the purpose of the I/O MMU).
> The I/O MMU is a cache/TLB for the U2/UTurn chip.  So if the data is
> flushed, it can always be retrieved without data loss.

That's at least partially right.  The I/O MMU *contains* a TLB to cache
I/O address space to physical address space translations. But the
translations are stored in an "I/O Page Directory" (I/O Pdir) in host
memory. The I/O TLB is a form of "cache" to avoid repeatedly fetching
translations from the I/O Pdir for every I/O <-> Memory transaction
(ie DMA).  We "flush" the TLB whenever we change the corresponding
I/O Pdir entry since the two are NOT coherent on most platforms. The
reasons for using and the mechanics of TLB fetching/flushing are
basically the same as for the CPU.

[ digression:
    We might be able to add another "FIXME" here: I think PCX-W and Uturn
    *are* coherent. Ie changes to the I/O Pdir by the PCX-W processor are
    "visible" to the Uturn chip and I *thought* (not certain) the Uturn
    would ditch the now invalid TLB entry on it's own.
]

> 
>    ** FIXME: The search algorithm only checks every
>    **        32cd bit field. So even we only need
>    **        one bit, we wouldn't see it.
>    **        Should shift the pages_mask left
>    **        some during the search in order to
>    **        take advantage of cacheing.
>    */
>    panic(__FILE__ ":" __FUNCTION__ "() I/O MMU is out of mapping
> resources\n");
> 
> 
> I also see lots of other FIXME's in this code I would like to take a
> whack at (if Bob Pflederer doesn't beat me too it :)) .. but I'd like
> to nail this one first since I have a good test case for it.

Sure. This is a generic code problem and not really specific to
U2/Uturn support. SBA (Astro/Ike) code uses the same implementation.
If someone improves this, I'll review and port the changes to sba_iommu.c.

The code uses a "resource bit map" to track which I/O Pdir entries
are (or not) in use. "In use" means the I/O Pdir entry contains a valid
physical address and a device driver is/has programmed it's device to
use this address for DMA.  ccio_alloc_range() builds a bit mask which
represents a consecutive set of I/O Pdir entries and searches the
resource bit map to locate a consecutive set of free bits.
Since I was too lazy to write a really smart *and* fast search
algorithm, I ended up with just a mostly fast one.

The "smart" part is where the search algorithm could find the
consecutive bits in some other location other than the just the
LSB (Least Significant Bits) of every 32-bit word. Since most
mappings (and thus resource bit map searches) are for 1 or 2 pages,
only 1/32 or 2/32 of "available" resources are really available.
Searching the LSB in 8-bit steps (vs 32-bits) is one simple way
of making 4x better use of the resource bit map. (I was thinking
one could use "pages_needed" local variable to determine which search
algorithm to use.) 4x better usage means either we could size the
I/O Pdir 1/4th it's current size or we are alot less likely to
hit the panic() code you quoted above.

But before hacking this to death, read the comments above ccio_alloc_range()
a few times. It's really important the implementation here be really 
"fast" (wall clock - not instruction counts). The mapping and unmapping
code paths are both called for *every* DMA transaction by every device.
This code path is just as important as the interrupt path for performance.
General things to think about when coding (in no particular order): 
i-cache "foot print" size, branches (avoid them), d-cache hit rate.

In general, I'm not too worried about shortening the "worst case" search
time since it means the I/O Pdir was not correctly sized in the first place.
I think the challenging tradeoff is between alloc/free speed and
utilization of I/O Pdir resource.

> Thanks a lot for your help!

welcome,
grant

> Ryan
> 
> 

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
