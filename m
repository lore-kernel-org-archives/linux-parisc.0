From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] PA8800/ZX1 support committed to 2.6.7-rc2-pa2
Date: Sat, 5 Jun 2004 00:51:26 -0600
Message-ID: <20040605065126.GA28343@colo.lackof.org>
References: <20040604202546.GC18574@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040604202546.GC18574@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Jun 04, 2004 at 02:25:46PM -0600, Grant Grundler wrote:
> I've committed PA8800/ZX1 support. It's obviously not complete
> and more notes are here:
> http://lists.parisc-linux.org/pipermail/parisc-linux-cvs/2004-June/034204.html

One of the errata I forgot to mention was Segmentation faults
or other transient failures. The failures are typically
segfaults but could "internal errors" to gcc or mis-reference
header in cpp. In all cases transient - ie not reproducible
on retry.

On the pa8800 machine, a "time make -j2" of the kernel would fail
in ~10 seconds. "time make" would fail anywhere from 30 seconds
to 6 minutes after starting. Re-starting the job would let it run
another chunk in time.

To me, it all suggest the PA8800 32M L2 cache isn't being
flushed when it might need to be. I don't think it's a new
problem. Just an old one that's easier to reproduce with
the bigger cache.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
