From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] The problem on the PA8800 is all in the data-cache.
Date: Wed, 26 Jul 2006 16:54:39 -0500
Message-ID: <1153950879.3446.49.camel@mulgrave.il.steeleye.com>
References: <119aab440607221050w3b6a949j49862c2766d5c7ef@mail.gmail.com>
	<1153708426.1235.11.camel@mulgrave.il.steeleye.com>
	<7d01f9f00607231954m7b9992e8r6148bb26b7b461da@mail.gmail.com>
	<20060724033223.GE29603@parisc-linux.org>
	<7d01f9f00607232115n18865924s4f07f64d84e45dce@mail.gmail.com>
	<1153750204.1235.18.camel@mulgrave.il.steeleye.com>
	<20060724163228.GA22560@colo.lackof.org>
	<1153839113.3452.28.camel@mulgrave.il.steeleye.com>
	<20060725161345.GA13707@hiauly1.hia.nrc.ca>
	<1153844239.3452.29.camel@mulgrave.il.steeleye.com>
	<20060725220235.GB28294@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 Thibaut VARENE <T-Bone@parisc-linux.org>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>,
 Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060725220235.GB28294@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, 2006-07-25 at 16:02 -0600, Grant Grundler wrote:
> You misheard. I'll be poking at this again in the near future.
> I've gotten the code to modify diag registers done.
> I just need to test the L2 disable and write a wrapper that
> does the necessary I/D cache flushing.

Actually, I found a different way to prove the theory.

In linux, we're careful about sequential accesses to memory (i.e. only
the user or the kernel may touch a page) to avoid the dirty line
aliasing which bites on all architectures.  However, the kernel takes
this care in almost every place, principally because we don't
necessarily know if the user line is dirty or not.  Thus it's possible
to use this guarantee to make the kernel fully equivalently mapped.

The primary engine of this guarantee is the kmap/kunmap (also _atomic).
When we come into a kmap region, we're guaranteed that the user mappings
have been flushed, so really all we have to do is flush the kernel
mappings when we leave.

This flush kernel mapping is a simple two line addition to highmem.h and
with it (as demonstration code), the pa8800 works reliably.

This fix is a gross O(1) one.  There will still be O(2) regions where
this guarantee needs to be fixed up independent of kmap/kunmap.
However, the O(1) fix gets pa8800 to the point where sshd works and we
get only the occasional segfault (I've only found one so far in an hour
of stress testing).

The other thing that will be contributing to O(2) effects is cache
movein.  Even though we flush the page, the CPU is entitled to move it
back into cache if it finds a TLB entry, so we have to begin purging the
TLB entries as we do this as well.

The final problem (once we have the O(2) effects all sorted) will be to
get this upstream.  The kmap API is supposed not to care about coherence
effects, now I'm making it, so I can sell this to the arch maintainers
as eliminating a lot of the kmap/flush_kernel_dcache_page/kunmap that we
do today ... I hope.

James



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
