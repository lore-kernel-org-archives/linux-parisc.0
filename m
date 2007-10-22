From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [patch 2/2] backport of sba sg list management
	to ccio-dma
Date: Sun, 21 Oct 2007 22:39:09 -0600
Message-ID: <20071022043909.GC11869__48712.1801860214$1416624648$gmane$org@colo.lackof.org>
References: <4714E800.50709@scarlet.be>
	<20071017184416.GB11502@fattire.cabal.ca>
	<471A3928.8040603@scarlet.be>
	<20071020172328.GI10429@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: Joel Soete <soete.joel@scarlet.be>,
 parisc-linux@parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20071020172328.GI10429@fattire.cabal.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Oct 20, 2007 at 01:23:28PM -0400, Kyle McMartin wrote:
> On Sat, Oct 20, 2007 at 05:21:44PM +0000, Joel Soete wrote:
> > Hello Kyle,
> > 
> > Hppay that you finaly receive it ;-)
> > (btw sorry for boucing)
> > 
> 
> I've looked over the code, and it looks fine to me. Will wait for an ack
> from Grant though, since I have no ability to test ccio :/

We both have access to the FtC test ring - but I think we are also both
too lazy to build a kernel and test it on a remote box. :)

In general I'm ok with this code since I trust Joel is testing
it with both NIC and storage devices and I'm too lazy to.

Some comments/requests/ideas below but nothing critical.

Apologies that I'm cut/pasting from the mailing list archive:
    http://lists.parisc-linux.org/pipermail/parisc-linux/2007-October/031998.html

I didn't have the original mail in my inbox anymore.


+static CCIO_INLINE int
+get_iovp_order(unsigned long size)
+{
+	int order;
+
+	size = (size - 1) >> (IOVP_SHIFT - 1);
+	order = -1;
+	do {
+		size >>= 1;
+		order++;
+	} while (size);
+	return order;
+}

Would this be faster if written to use "ffs()"?


...
+#define ROUNDUP(x, y)		((x + ((y)-1)) & ~((y)-1))

ROUNDUP got replace in SBA with ALIGN(). Please use ALIGN instead.


...
+	} else {
+		/*
+		** Search the resource bit map on well-aligned values.
+		** "o" is the alignment.
+		** We need the alignment to invalidate I/O TLB using
+		** xxx HW features in the unmap path.
+		*/
+		unsigned long o = 1 << get_iovp_order(pages_wanted << IOVP_SHIFT);
+		uint bitshiftcnt = ROUNDUP(ioc->res_bitshift, o);
+		unsigned long mask;

CCIO doesn't have this feature AFAIK. The comment only applies to SBA.
Please remove the second sentence of the comment.
Searching on "well-aligned" values is still a good idea.


NOTE: Each 8 consecutive CCIO IO PDIR mappings land on the same IO TLB entry.

To avoid thrashing the IO TLB, ideally CCIO code will do the following:

o map_sg (ie storage devices) use 8 bit alignment (ie each mapping start
 on a new byte boundary).  Traditional block storage can complete the
 IOs out of order and in parallel (via different controllers). This
 would thrash one IO TLB entry if 8 seperate 4K DMA mappings are inflight
 at the same time.

o map_single() (ie NICs) to just use the next available bit for a given
  PCI device.  NIC DMA patterns (at least for a given stream) are linear.
  The ccio_map_single() should track the last bitmap octet used for both
  DMA_TO_DEVICE and FROM_DEVICE for each PCI device.
  Once that octet is "used", find the next 8 bit field in the bitmap that
  is available.

For a single NIC and one or two SCSI controllers, this probably doesn't
make much difference unless you start measuring latency. Throughput
should be nearly the same.

My guess is the biggest perf gain will come from reducing the number
of "sync" ops by implementing DELAYED_RESOURCE_CNT. 


...
 #ifdef CCIO_SEARCH_TIME
+	udelay(100);

Did you want to keep udelay() call?


...
+#else /* DELAYED_RESOURCE_CNT == 0 */
+
+	ccio_free_range(ioc, iova, size);
+
+	/* force fdc's to be visible now */
+	asm volatile("sync" :: );
+
+#endif /* DELAYED_RESOURCE_CNT == 0 */

Does the asm("sync") need to be outside the #endif ?
Please make sure "sync" is called exactly once IFF 
the IO PDIR is modified.


...
+#ifdef CCIO_MAP_STATS
+		ioc->usg_pages += sg_dma_len(sglist) >> IOVP_SHIFT;
+		ioc->usingle_calls--;   /* kluge since call is unmap_sg() */
+#endif

I wouldn't add MAP_STATS here.
They aren't enabled in SBA becuase they impact performance too much.
I expect that will always be true and would seriously consider removing
MAP_STATS code from SBA as well. Timing the bitmap search is
probably the only critical bit of info that really matters. 
And that's for developement/testing only.

hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
