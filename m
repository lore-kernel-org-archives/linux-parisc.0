From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] PA8800/ZX1 support committed to 2.6.7-rc2-pa2
Date: Sat, 5 Jun 2004 16:21:37 -0600
Message-ID: <20040605222137.GF8098@colo.lackof.org>
References: <20040604202546.GC18574@colo.lackof.org>
	<20040605065126.GA28343@colo.lackof.org>
	<1086444652.1999.20.camel@mulgrave>
	<20040605210515.GA8098@colo.lackof.org>
	<1086470366.1999.36.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: James Bottomley <James.Bottomley@steeleye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1086470366.1999.36.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Jun 05, 2004 at 04:19:24PM -0500, James Bottomley wrote:
> On Sat, 2004-06-05 at 16:05, Grant Grundler wrote:
> The pa8800 only has a 750k/750k VIPT cache, that's smaller than my
> raven.  The 32M L2 cache is PIPT, which doesn't suffer from aliasing or
> address remapping effects---in fact, the PA engineers probably arranged
> for a fdc not to flush it because there's no point; the only coherency
> problems the PIPT cache has is with I/O, which is supposed to be fully
> coherent in the ZX1, isn't it.

Yes - especially since I haven't attempted to add any special support
for 64-bit cards. The "IOMMU Bypass" mode on ZX1 is worth implementing
for 64-bit cards and I might in fact require it for graphics and
infiniband support.


> Thus, we'd only pick up a caching
> problems like you describe from the VIPT caches.

ok.

> > Any good ideas on how to prove IO is coherent?
> 
> Well, yes, but not without driver magic.  You program a device to take a
> piece of data in and rewrite it to a different buffer, then you compare
> buffers (making sure the first had a pattern in it and the second was
> completely clear).

tg3 driver infact has such a test...let me think about that some more.
I might hack the test to be more exhaustive.

> Well, it could be an I/O coherency problem, but if you have one of
> those, I'm surprised it boots at all.

For that bug, one could occasionally end up with a stale IO TLB entry.
And I'm wondering if that's possible when "swapping in" different
parts of an executable binary. To date, I'm under the impression
only executable pages are seeing this problem.  If it were IO,
I should be seeing it with data too - ie .c file cause errors.
Maybe I just need to exercize it more to make that happen.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
