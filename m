From: James Bottomley <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] PA8800/ZX1 support committed to 2.6.7-rc2-pa2
Date: 05 Jun 2004 16:19:24 -0500
Message-ID: <1086470366.1999.36.camel@mulgrave>
References: <20040604202546.GC18574@colo.lackof.org>
	<20040605065126.GA28343@colo.lackof.org>
	<1086444652.1999.20.camel@mulgrave>
	<20040605210515.GA8098@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040605210515.GA8098@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, 2004-06-05 at 16:05, Grant Grundler wrote:
> Well, I can only point at the difference in cache size.

The pa8800 only has a 750k/750k VIPT cache, that's smaller than my
raven.  The 32M L2 cache is PIPT, which doesn't suffer from aliasing or
address remapping effects---in fact, the PA engineers probably arranged
for a fdc not to flush it because there's no point; the only coherency
problems the PIPT cache has is with I/O, which is supposed to be fully
coherent in the ZX1, isn't it.  Thus, we'd only pick up a caching
problems like you describe from the VIPT caches.

> > My money would be on an additional architectural requirement of the
> > PA8800 (maybe even an existing PA one that the <PA8800 just don't need)
> > that we don't respect.
> 
> yes - and we've changed chipsets too.
> 
> Any good ideas on how to prove IO is coherent?

Well, yes, but not without driver magic.  You program a device to take a
piece of data in and rewrite it to a different buffer, then you compare
buffers (making sure the first had a pattern in it and the second was
completely clear).

> It might be the same problem that Naresh described as "SCSI DMA problems".
> I just happen to be using NFS Root instead.
> 
> But I found one bug in Naresh's port that might explain his problem
> (wasn't flushing IO TLB properly). It would be interesting to hear
> if 2.6.7-rc2-pa3 works better for him.

Well, it could be an I/O coherency problem, but if you have one of
those, I'm surprised it boots at all.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
