From: "Michael S. Zick" <mszick@wolfbutter.com>
Subject: Re: copy_user_page_asm suggested 64bit improvment [Was:
	[parisc-linux] clear user page test]
Date: Fri, 31 Dec 2004 14:26:13 -0600
Message-ID: <200412311426.13425.mszick@wolfbutter.com>
References: <418A80E8000124B5@mail-6-bnl.tiscali.it>
	<41CFE6B1.6010707@tiscali.be> <1104160093.5295.8.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-2022-jp"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1104160093.5295.8.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon December 27 2004 09:08, James Bottomley wrote:
> On Mon, 2004-12-27 at 10:40 +0000, Joel Soete wrote:
> > Should be why it was removed but as far as I didn't find any explanation (that's obvious: that's nearly impossible to explain all 
> > details of implementation ;-)
> 
> I haven't time to look through the patch, but I can explain what the
> pdtlb's are about in pacache.S.
> 
> Both copy_user_page_asm and __clear_user_page_asm use something called
> the tmpalias mapping.  This is a 8MB reserved area that's used to prime
> the user space cache.  What you do is to set up a temporary mapping for
> the target of the copy which is congruent to the user space address
> somewhere in the tmpalias region.  Then when you do the copy, the user
> alias is automatically up to date as well (because the cache sees the
> collision by virtue of its congruence properties).
> 
> It's a nice idea, but we've never been able to make it work in practise,
> because the user page we're copying can be an executable page, and this
> scheme only makes the d-cache correct.  If we had a way of telling
> whether it's a data page or and instruction page, we could make it work.
> That's why the mechanism is #if 0'd out.
> 
Group,
I have been following this thread with interest.  Let me share my observations.

Changes in the instruction sequence of this kernel code path makes a user
observable difference in execution timings.

<bold-statement attribute="General-OS-Design">
    This path should not be within the set of user observable execution times.
</bold-statement>

Conditions, general:
The copy of a "user page" :: presumed to mean "copy of a page assigned
to user space".  Possible refinement: "copy of a page assigned to a specific
user's space".

Page must contain zeros on return.

Contents of system caches must correspond to contents of page (zeros).

On entry, it is unknown if page is currently Data, Executable (Instruction),
Both, or Neither.
Having a means to determine the exact, prior, usages of a page on entry
to this path would be nice; but logic and design can overcome this lack.

HP, PA-RISC has only i-cache and d-cache hardware.  It does not have
s-cache hardware.

A page assigned to user space may be assigned to more than one,
specific, user's space.

A page assigned to user space may also be assigned to kernel space.

For a 'dual assigned' page (assigned to both user space and kernel space) 
the following must hold:

A)  (Kernel Instruction) and (User Instruction)::
        MUST NOT also be assigned: (User Data)
        MAY OPTIONALLY be assigned: (Kernel Data)

B)  (Kernel Data) and (User Data)::
        MUST NOT also be assigned: (Kernel Instruction)
        MAY OPTIONALLY be assigned: (User Instruction)

The above requirements are independent of the implementation of
such assignments.  
Memory management hardware that allows 'dual assignment' is rare.  
Memory management software that allows 'dual assignment' by 
constructing a 'page alias' is common.

Condition (A :: 'MUST NOT') protects kernel provided, common code, 
from user modification.

Condition (A :: 'MAY OPTIONALLY') allows the kernel to:
    1) Dynamically alter the code provided to user space in general.
    2) Dynamically alter the code provided to a specific user's space.  
        NOTE: Such operation would trigger a 'copy on write' code path.  
        NOTE: The (shared) source page of 'copy on write' is not modified.
        NOTE: The destination page of 'copy on write' comes from the free pool.

Condition (B :: 'MUST NOT') protects the kernel from user insertion or 
modification of kernel code.

Condition (B :: 'MAY OPTIONALLY') supports the provision of 'executable
stack' in user space in the absence of s-cache hardware.

For a system that supports the provision of 'user, executable stack' the
following must hold:

C) (User Instruction) and (User Data) and (User Stack)::
        MUST meet condition (B)
        MUST NOT be shared among users: thou shall not share your stack.

D) (User Data) and (User Heap)::
        MUST NOT also be assigned: (Kernel Instruction)
        MUST NOT also be assigned: (User Instruction)
        MAY OPTIONALLY share disjoint address sub-ranges of the overall
        address range '((User Instruction) and (User Data) and (User Stack))'
        ON EITHER CONDITION OF:
        1) Attributes of the disjoint address sub-ranges are also disjoint.
        2) Software design can guarantee behavior the same as sub-condition(1).

Condition (C :: 'MUST NOT') 'copy on write' code path is never used.

Condition (D :: 'MUST NOT') Differs from (Condition C) by non-compliance with
(Condition B).

Condition (D :: 'MAY OPTIONALLY') Guarantees the distinction between (Condition
C) and (Condition D) when (Condition D) address area is shared among users in
the absence of separate (Condition C) and (Condition D) address spaces.
NOTE: A (Condition D) area my trigger a 'copy on write' code path; A (Condition
C) area MUST NOT trigger a 'copy on write" code path.

<All-Other-Combinations>

1) A page received from (any) free pool is guaranteed to contain only zeros.
2) A page received from (any) free pool is guaranteed to not have any 'user
space' cache representations.

</All-Other-Combinations>

NOTE: Zeroing a page received from (any) free pool is not 'user observable'
for the simple reason that it never happens.

<Page-Return-To-Free-Pool>

Pages which are intended to be added to the free pool, are not directly returned
to the free pool. 
Instead they are returned to a kernel space, free pool management, daemon.  It
is this daemon that makes the <All-Other-Combinations> guarantee.

NOTE: Zeroing a page on return to (any) free pool is not 'user observable' only
the 'add to free pool incoming queue' is in the 'user observable' code path.

NOTE: Pages handled by this daemon may have both d-cache and i-cache
representations.  But the code which deals with this situation is not 'user 
observable' because the entire 'return to free pool' operation is not 'user
observable'.

</Page-Return-To-Free-Pool>

<Non-Free-Pool-Pages>

<Non-rhetorical Question="What user pages can be both Instruction and Data?" />

(Condition B - 'MAY OPTIONALLY') pages: 

Dual Assigned : (I.E: Transition from 'shared' to 'private')
In-Use portion is copied ('user observable') - Not-Used portion is not copied.
It can be guaranteed to already be zero since it hasn't been used.
The 'write' side of the copy instructions does any 'cache priming'.

(Condition C) pages:

NOTE: Never shared, therefore never copied.

NOTE: Extending the pages present for an executable stack does not
have 'user observable' zeroing since the new page source is the free pool.

NOTE: Trimming 'zombie' stack extensions under general memory pressure
(I.E: Free pool exhausted @ new page request pending) would generate 'user
observable' execution time while a page on the 'add to free pool incoming
queue' was cleared.
This corner case can be postponed by using 'preemptive trimming' implemented
in the free pool management daemon.

</Non-Free-Pool-Pages>

Q.E.D: Zeroing a page with the destination of user space assignment need not
be a 'user observable' execution time.

There should be additional gains made in 'copy-[to|from]-user' when these four
conditions are enforced.

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
