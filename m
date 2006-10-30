From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] [RFC] vdso for parisc-linux
Date: Mon, 30 Oct 2006 11:25:09 -0500
Message-ID: <119aab440610300825l4cfd056fi21738f63f3d99d72@mail.gmail.com>
References: <4544A34A.6080700@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Randolph Chung" <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4544A34A.6080700@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 10/29/06, Randolph Chung <randolph@tausq.org> wrote:
> At kyle's urging, i've started an initial implementation of vdso support
>   for parisc-linux. I've attached what I have so far for some initial
> comments. This is primarily based on the ppc vdso infrastructure.

Awesome work, thanks for working on a vDSO initial implementation!

> Some things to consider:
> 1) The vdso object need to be mapped to userspace apps at some "default"
> location. In fact the kernel will look for an available vma using
> get_unmapped_area(). Right now I've arbitrarily picked 0x8000'0000. This
> should be reviewed.... one idea is to just map them at at the same place
> that shared libs are mapped (near 0x4000'0000). The bigger concern is
> whether we should make the mapping with MAP_SHARED so that the shared
> area is mapped congruent in all userspace apps that use the vdso. ppc
> doesn't do this.

Users may enable or disable the vDSO on their system as a
configuration option. Therefore glibc can't rely on the vDSO being
present. How would this effect a prelinking implementation for hppa? I
think I would rather see the vDSO at a high address, and enable
MAP_SHARED. What is wrong with enabling MAP_SHARED?

> 2) our mmu_context_t used to be a single int that stores the space id of
> the current process. This has been extended into a struct that stores
> the space id and the vdso base address

This is good, we need the vdso base.

> 4) I haven't hooked up all the actual vdso functions yet, but with this
> patch userspace can see the functions exposed from the kernel, we can
> use gdb to put breakpoints in the vdso, etc.

You use the word "can", but have you tried to put breakpoints in the
vDSO code pages?

> 5) We need to figure out which functions we want to expose. Several
> other archs expose gettimeofday and clock_get_time via vdso. For us,
> atomic ops are also prime candidates. Several archs also use the vdso to
> provide a cleaner signal trampoline interface. The latter mostly
> requires somebody to write up all the proper cfi instructions into
> sigtramp.S

atomic ops are *not* prime candidates for vDSO's, I was wrong about
this. There are special requirements for the atomic operations which
require access to kernel locks, no scheduling, and no signals.  All of
these are impossible to do if gdb can write to code, thus we put the
atomic ops on the gateway page (which has the aforementioned special
properties).

The rest of your suggestions are great. Signal trampoline handlers are
#1 on the list of cleanups. We already know HPUX does something
similar.

> As part of testing this, I also noticed that our gas does not support
> cfi directives that were added to binutils some time ago. I've submitted
> a patch for this.
>
> glibc will need some work to get this to work. As a first step we need a
> dl-sysdep.h that defines:
>   #define NEED_DL_SYSINFO_DSO     1

Thanks!

> If you use upstream glibc this is already enabled for all targets, but
> debian glibc will need this added if you want to test.
>
> Anyway, please let me know if you have any comments.

What testing do we need to do before you check this into git?

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
