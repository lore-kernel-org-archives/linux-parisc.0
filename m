From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Re: + parisc-add-ptr-compatpatch.patch added to
	-mm tree
Date: Sun, 9 Apr 2006 10:09:07 -0400
Message-ID: <119aab440604090709u4aab76a7u45cf79542c57138c@mail.gmail.com>
References: <200602220102.k1M12Jje015527@shell0.pdx.osdl.net>
	<20060222010459.GE26809@quicksilver.road.mcmartin.ca>
	<20060221172126.2db4adef.akpm@osdl.org>
	<20060222091356.GA27449@elte.hu>
	<20060409001100.GD30539@quicksilver.road.mcmartin.ca>
	<20060409053716.GA18611@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 Andrew Morton <akpm@osdl.org>,
 parisc-linux@lists.parisc-linux.org
To: "Ingo Molnar" <mingo@elte.hu>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060409053716.GA18611@elte.hu>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 4/9/06, Ingo Molnar <mingo@elte.hu> wrote:
> > Due to a complete lack of useful atomic operations on parisc, the way
> > I envisioned implementing the routines was serializing all futex ops
> > on a kernel spinlock. Since it's a userspace address, we couldn't use
> > an atomic hash unless we found the physical address behind it, so just
> > one spinlock would do... Of course, I'm probably missing something
> > critical here, though.
>
> if userspace doesnt do atomic ops then the solution should be relatively
> easy: make glibc always call into the kernel, and then the kernel-level
> futex.h ops can be implemented in a lockless manner (i.e. not even a
> spinlock is needed) and you'll get (pretty scalable) futex
> functionality. The in-kernel futex hash-bucket spinlocks take care of
> locking.

HPPA has a light-weight kernel syscall that does
atomic-compare-and-swap, and indeed this is what we use for our NPTL
implementation. We can use that *or* call into the kernel for
arbitration. The atomic-compare-and-swap also uses a hash-bucket of
spinlocks on SMP systems. We hash on a virtual address so it scales
nicely. Not forever though. Some analysis to see which is faster
should be done. I think we will always win with the light-weight
syscall.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
