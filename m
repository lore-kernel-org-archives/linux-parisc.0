From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] some other small bitops.h suggestion?
Date: Sat, 16 Apr 2005 11:27:21 -0600
Message-ID: <20050416172721.GA11765@colo.lackof.org>
References: <20050415192713.GA26321@colo.lackof.org>
	<200504152141.j3FLfMXi025954@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200504152141.j3FLfMXi025954@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Apr 15, 2005 at 05:41:22PM -0400, John David Anglin wrote:
> > My take is "volatile" is just a way to tell gcc something about the
> > code/data that it can't see. I'm not going to quibble with linus
> > about whether data is volatile or code is volatile. I think in some
> > cases it's one (e.g accessing memory mapped HW) or the other
> > (accessing shared data). Key thing is gcc be able to optimize code
> > but not remove it (especially in the latter case).
> 
> The problem here is that there are some conventions regarding the use
> of "volatile" in GCC C that are rather poorly documented.  You might
> look at this discussion regarding volatile and C++ to get a flavor
> for what I mean <http://gcc.gnu.org/ml/gcc/2005-04/msg00724.html>.

In this followup, I think Nathan Sidwell got at least one bit:
| It seems to me that threads require barriers _within_ the abstract machine,
| and currently there is no mechanism to specify just that.  Volatile is all
| we have, and AFAICT those are only ordered WRT other volatile accesses
| separated by a sequence point.

(See http://gcc.gnu.org/ml/gcc/2005-04/msg00748.html)

And that's a difference: the kernel has defined a set of barriers.
Linux kernel generally doesn't depend on current semantics of volatile
for accessing memory mapped IO.
At least I don't think it does since ia64-linux is using ld.acq
and st.rel instructions today.  While the compiler is observing
the ordering, the CPU may not.  e.g. The CPU doesn't wait for a
regular store to complete before starting sucessive ld.acq.

This is a rare for IO drivers to do this. More discussion about
volatile and acq/rel semantics in "IA-64 Linux Kernel" by
David Mosberger and Stephane Eranian.

I learned one more thing about ia64 not in the book when trying
to understand how ld.rel works WRT to fixing posted write problems
(st.rel).  I summarize it in my OLS2004 paper:
	http://iou.parisc-linux.org/ols2004/www/

See http://iou.parisc-linux.org/ols2004/www/2_2_Eh_Memory_Reads.html

  "Memory ordering imposes no constraint on non-load/store instructions."

This is critical for changing CPU state (enable/disable I-bit) or
reading CPU state (e.g. ITC).

ia64 has a weakly ordered memory subsystem but executes instructions
in order. parisc is strongly ordered for both and is less complicated
in this regard. I think because of this parisc could use volatile
keyword for telling the compiler certain instructions *must* be kept
in the stream, and then use memory barriers to constrain how the
optimizer can reorder the instruction stream.

But changing the semantics of volatile will break some code
in both the kernel and in multithreaded applications.
I strongly suspect this is going to need to fall into
the "use with caution" compiler flags (like -O4).

I'm glad they are having this discussion now *before*
widespread adoption of RDMA technologies.

hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
