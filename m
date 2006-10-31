From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] [RFC] vdso for parisc-linux
Date: Tue, 31 Oct 2006 14:08:33 +0800
Message-ID: <4546E861.9050909@tausq.org>
References: <4544A34A.6080700@tausq.org>
	<119aab440610300825l4cfd056fi21738f63f3d99d72@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440610300825l4cfd056fi21738f63f3d99d72@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

>> Some things to consider:
>> 1) The vdso object need to be mapped to userspace apps at some "default"
>> location. In fact the kernel will look for an available vma using
>> get_unmapped_area(). Right now I've arbitrarily picked 0x8000'0000. This
>> should be reviewed.... one idea is to just map them at at the same place
>> that shared libs are mapped (near 0x4000'0000). The bigger concern is
>> whether we should make the mapping with MAP_SHARED so that the shared
>> area is mapped congruent in all userspace apps that use the vdso. ppc
>> doesn't do this.
> 
> Users may enable or disable the vDSO on their system as a
> configuration option. Therefore glibc can't rely on the vDSO being
> present. How would this effect a prelinking implementation for hppa? I

glibc looks for a special ELF AUX header to find out about the address
of the vdso. If it's not present, then it won't call the vdso....

The implementation for this is cleaner in cvs glibc than in debian glibc.

I'm not quite sure how this interacts with prelink.

> think I would rather see the vDSO at a high address, and enable
> MAP_SHARED. What is wrong with enabling MAP_SHARED?

I can't think of one, although it needs to be marked MAY_WRITE so that
if we put a breakpoint the page will get COW'ed. Need to look at this
some more.

>> 4) I haven't hooked up all the actual vdso functions yet, but with this
>> patch userspace can see the functions exposed from the kernel, we can
>> use gdb to put breakpoints in the vdso, etc.
> 
> You use the word "can", but have you tried to put breakpoints in the
> vDSO code pages?

yes, it works.

> atomic ops are *not* prime candidates for vDSO's, I was wrong about
> this. There are special requirements for the atomic operations which
> require access to kernel locks, no scheduling, and no signals.  All of
> these are impossible to do if gdb can write to code, thus we put the
> atomic ops on the gateway page (which has the aforementioned special
> properties).

i can't quite see how lws disables scheduling... maybe you can enlighten
me :)

> The rest of your suggestions are great. Signal trampoline handlers are
> #1 on the list of cleanups. We already know HPUX does something
> similar.

Well, there are two parts:
1) Finding "sigreturn"
2) Finding the system state on the stack

Right now this is all done on parisc-linux by poking in memory using
magic constants.

On HPUX, #1 is available symbolically, but #2 still requires poking in
memory using magic constants. It is particularly nasty on HPUX because
the kernel can store state in either narrow or wide mode and the offsets
are not fixed.

>> If you use upstream glibc this is already enabled for all targets, but
>> debian glibc will need this added if you want to test.
>>
>> Anyway, please let me know if you have any comments.
> 
> What testing do we need to do before you check this into git?

What I have is just infrastructure, we need to add some functionality
into it :)

randolph
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
