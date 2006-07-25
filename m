From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] The problem on the PA8800 is all in the data-cache.
Date: Tue, 25 Jul 2006 09:51:52 -0500
Message-ID: <1153839113.3452.28.camel@mulgrave.il.steeleye.com>
References: <119aab440607221050w3b6a949j49862c2766d5c7ef@mail.gmail.com>
	<1153708426.1235.11.camel@mulgrave.il.steeleye.com>
	<7d01f9f00607231954m7b9992e8r6148bb26b7b461da@mail.gmail.com>
	<20060724033223.GE29603@parisc-linux.org>
	<7d01f9f00607232115n18865924s4f07f64d84e45dce@mail.gmail.com>
	<1153750204.1235.18.camel@mulgrave.il.steeleye.com>
	<20060724163228.GA22560@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Thibaut VARENE <T-Bone@parisc-linux.org>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>,
 Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060724163228.GA22560@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, 2006-07-24 at 10:32 -0600, Grant Grundler wrote:
> While I agree in general that a PIPT cache won't have aliasing effects.
> ISTR the virtual coherence index (VCI) is part of the "physical address".
> If it's not, I'm confused how CPUs on different sockets remain coherent.
> I expect the VCI is visible across the Mckinley Bus and thus is part
> of the physical address. IOMMU is also pushing out an address that
> has VCI bits in it - so DMA remains coherent with CPU virtual addresses.
> 
> If I've got this right, then we can have aliasing in PIPT cache.
> Willy, can you check the pa8800 ERS and look for "coherence index"
> or similar, related words?

I don't believe the PIPT cache can have a coherence index, otherwise it
would be effectively VIPT (see the virtual index in a form).  A PIPT
cache is fully addressable by the physical address alone.  So, for I/O
we use the CI to evict L1 lines and the simple physaddr (without a CI)
to evict PIPT lines.  Exclusivity means that if we find the line in the
L2 we don't even need to present the physaddr and CI to the L1.
However, verifying this in docs would be a good thing ...

However, here's the kicker ... I think we can get incoherence from clean
aliases in a combined VIPT/PIPT environment.  This is impossible in a
VIPT environment, and something Linux isn't expecting in its cache
management.

The Linux theory of managing inequivalent aliases is that as long as we
ensure that we only ever have one dirty alias, we can never get
corruption (and as long as we flush the aliases before reassigning the
page, we can never get incoherence from clean lines).  However, linux is
perfectly happy to tolerate incoherence on the Kernel/User addresses
provided only one alias is dirty.  We get this in COW breaking (where we
bring in a spurious clean copy of the old page at the kernel VA) and at
other I/O related places.

However, in a combined VIPT/PIPT, there is a nasty scenario to do with
cache eviction.  In general cache lines are selected for eviction (a
process called victim selection) on a LRU basis. For a single cache
level, a clean victim is just discarded, a dirty victim is written back
to main memory. In a cache hierarchy, eviction means the line is written
from the n-1 to the n cache hierarchy.  This gives a scenario where a
clean line is actually rewritten to a lower cache in the hierarchy
rather than being discarded.  If the hierarchy is fully VIPT, this
doesn't matter.

However, if the lower cache is PIPT, it has to do alias combining like
this:  the L1 presents the tag and data to the PIPT L2 (discarding the
virtual index which the PIPT doesn't care about), so the L2 stores this
fully physically indexed and tagged).  Now, assume we have two
inequivalent aliases of the same physical line P at virtual indexes V1
(containing data D1) and V2 (containing data D2).  Even if these are
clean, you get this behaviour:  the L1 selects V1 for eviction and
writes its contents to the L2 at P (which now caches D1).  However, at a
later time the LRU algorithm selects V2 for eviction and writes the line
to the L2 at P (which now caches D2).  If the process later reads V1 for
P, it gets data D2 (an inequivalent alias incoherence of clean lines).
Theoretically, as long as the LRU algorithm is perfect, we should never
get this effect, since the oldest line should be evicted first, and that
should be the one containing the stale data.  However, my bet (which
would require doc verification in the pa8800 ers) is that the LRU isn't
perfect, so there's a tiny window, most likely to be hit on COW
breaking, where the kernel and the user get different data aliases with
the kernel one being only slightly older. If the slightly younger user
alias is selected for eviction first, we get the old kernel data in the
PIPT which is read back in when the user accesses the address again.  

Note: this scenario only works if both lines are clean ... to get the
modified D2, you have to dirty a line and then re-clean it.  i.e. write
it out and then read it back again so fast that it's still in the
imperfect LRU window.  This seems impossible until you consider that
there are lots of operations (mainly around I/O) that will cause cache
flushing of the user alias.  So the final scenario seems to be COW break
to cause the kernel alias, user write, user flush, user read all in the
imperfect LRU window (which would be incredibly rare).

This theory seems to explain all of the behaviour, why we see it so
rarely, and why it seems to happen around forks when I/O is going on in
the system.  Unfortunately it also seems to indicate that the only way
of fixing it would be to have full equivalence.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
