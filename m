Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id C45E44841
	for <parisc-linux@lists.parisc-linux.org>; Sun,  9 Nov 2003 21:36:57 -0700 (MST)
Date: Sun, 9 Nov 2003 21:36:54 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] C110 builtin nic slow?
Message-ID: <20031110043654.GA16478@colo.lackof.org>
References: <3F9BFB00.5090008@tiscali.be> <20031026172531.GA32146@colo.lackof.org> <3F9C3154.4060105@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F9C3154.4060105@tiscali.be>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sun, Oct 26, 2003 at 08:40:52PM +0000, Joel Soete wrote:
> hmm may be should I try to rebuild the very last src (from hp).

netperf home is netperf.org.

> More over the pkg is not available for parisc but I trust it would just 
> be rebuild for this platform?

It does run/build on parisc. I've used it before.

Note that with B180, I can only get about 1MB/s throughput max.
With C3000 I get about 5 or 6 MB/s 100BT link.
Your network performance numbers are pretty far off from that
but there might be other factors involved.

I expect mem copy routines are saturating the CPU and thrashing
the data cache.  The tulip driver copies the entire buffer from
where the card DMA'd to the skbuff in order to "bias" the buffer
by 2 bytes. This avoids un-aligned data access in the "common" TCP case.
Adding "unaligned access" macros to the "common" networking code
path has been discussed and rejected (again) in the past month or so.
Linus himself has rejected such proposals in the past too.

If you twiddle the tulip driver to NOT copy all the data for
packets > 512 bytes, the kernel will tell you when/where the network
stack makes unaligned accesses. You can fix those and keep that as
a local patch. I'd be interested in hearing the netperf (or httperf)
numbers with such a patch when compared to the current behavior.

thanks,
grant
