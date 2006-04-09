From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [parisc-linux] Re: + parisc-add-ptr-compatpatch.patch added to
	-mm tree
Date: Sun, 9 Apr 2006 07:37:17 +0200
Message-ID: <20060409053716.GA18611@elte.hu>
References: <200602220102.k1M12Jje015527@shell0.pdx.osdl.net>
	<20060222010459.GE26809@quicksilver.road.mcmartin.ca>
	<20060221172126.2db4adef.akpm@osdl.org>
	<20060222091356.GA27449@elte.hu>
	<20060409001100.GD30539@quicksilver.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Andrew Morton <akpm@osdl.org>,
 parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060409001100.GD30539@quicksilver.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


* Kyle McMartin <kyle@mcmartin.ca> wrote:

> [Sorry about how long it has taken to get to this... I bounced it to
>  parisc-linux too, so hopefully someone else can comment as well.]
> 
> On Wed, Feb 22, 2006 at 10:13:56AM +0100, Ingo Molnar wrote:
> > There's only one complication i can imagine on PARISC: truly atomic 
> > futex_atomic_cmpxchg_inuser() is not possible in any sane way because 
> > any spinlock based cmpxchg exposes itself to userspace locking up the 
> > kernel - no good. [We could in theory do something about it by imposing 
> > some sort of deadline on the maximum time the spinning-on-userspace-lock 
> > can take - but i dont think it's worth the trouble.]
> >
> 
> Due to a complete lack of useful atomic operations on parisc, the way 
> I envisioned implementing the routines was serializing all futex ops 
> on a kernel spinlock. Since it's a userspace address, we couldn't use 
> an atomic hash unless we found the physical address behind it, so just 
> one spinlock would do... Of course, I'm probably missing something 
> critical here, though.

if userspace doesnt do atomic ops then the solution should be relatively 
easy: make glibc always call into the kernel, and then the kernel-level 
futex.h ops can be implemented in a lockless manner (i.e. not even a 
spinlock is needed) and you'll get (pretty scalable) futex 
functionality. The in-kernel futex hash-bucket spinlocks take care of 
locking.

	Ingo
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
