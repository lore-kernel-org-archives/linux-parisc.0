Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [192.151.27.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 385C44881
	for <parisc-linux@lists.parisc-linux.org>; Wed,  3 Oct 2001 04:04:33 -0600 (MDT)
Date: Wed, 3 Oct 2001 04:04:31 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200110031004.EAA15528@udlkern.fc.hp.com>
To: mszick@pflash.com
Cc: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Delayed branching explanation
List-ID: <linux-parisc.vger.kernel.org>

> What I was concerned about was the chance that the instruction addressed
> by iaoq[1] was a branch (or taken conditional branch) instruction.  With
> the
> discription given in the documentation, then the queue state returned would
> have to be:
>
> regs->iaoq[0] == branch instruction address
> regs->iaoq[1] == target instruction address
>

No, you are forgetting about the delay slot.  The documentation is
correct, although the concept can be confusing at first.  Branches to a
target don't happen immediately, they happen after the instruction
following the branch is executed (that instruction is referred to as the
"delay slot instruction").

I'll try to explain it here. Perhaps I can explain it clearer than how
the parisc documentation explains it (then again, perhaps not :-)).

For the purposes of this explanation I am only going to consider
unconditional branches.  I am also not going to talk about the space
queue, since once you understand the operation of the offset queue, the
operation of the space queue follows fairly easily.  Also, I am going to
use "pc" (for program counter) instead of "iaoq" (for instruction address
offset queue) for easy comparison.

For comparison, let us first consider most other architectures without
delayed branching. Because they don't have delayed branching they don't
need a pc queue. So, when an instruction causes some type of fault
we have:

	pc -> faulting instruction

If we are going to emulate the faulting instruction we need to advance
the pc after the emulation, i.e. do exactly what the cpu would have
done if it had executed the instruction. If the instruction was
not a branch we would simply do:

	pc += 4

If the instruction was a branch we would do:

	pc = target of branch

On parisc, with delayed branching, we need a 2 element queue in order
to implement a 1 instruction branch delay. So, when an instruction
faults we have:

	pc[0] -> faulting instruction
	pc[1] -> next instruction to execute

pc[1] above might be equal to pc[0] + 4, but it could be something
else (it depends on whether the instruction before the faulting
instruction was a branch or not). We don't really care at this point.

If the faulting instruction is not a branch we would simply do the
following to advance the queue:

	pc[0] = pc[1]
	pc[1] += 4;

If the faulting instruction is a branch (make sure you understand
this, because it explains how a branch on parisc works) we would
do the following to advance the queue:

	pc[0] = pc[1]
	pc[1] = target of branch

i.e. the target doesn't take effect immediately, the instruction
that is now pointed to by pc[0] is executed first.

So, consider the example that was quoted above, regarding a branch being
pointed to by pc[1] when we fault.  This doesn't make a difference on how
we advance the queue.  If the instruction pointed to by pc[0] (when the
fault occurs) is not a branch, what pc[1] points to -- whether or not it is
a branch -- does not make any difference, because it has not been executed
yet.  So for example, following the explanation above, we have:

	pc[0] -> faulting instruction (non branch, e.g. mfctl)
	pc[1] -> branch instruction

When we advance the queue, according to the non branch algorithm
we get:

	pc[0] -> branch instruction
	pc[1] -> branch instruction + 4 (i.e. delay slot of branch)

When the branch instruction executes next, it does not overwrite
pc[1] without first advancing what was in pc[1] to pc[0], i.e. the
instruction following the branch gets executed before we move to
the target instruction.

Have I made things clearer or fuzzier here?

John

P.S. For extra credit, see if you can follow this:

Consider what happens if we have a branch in the delay slot of
another branch (note that in this example, neither target is
a branch), i.e:

    pc[0] -> branch1 to target1
    pc[1] -> branch2 to target2

After the first branch is executed we have:

    pc[0] -> branch2 to target2
    pc[1] -> target1

After the second branch is executed we have:

    pc[0] -> target1
    pc[1] -> target2

One more step:

    pc[0] -> target2
    pc[1] -> target2 + 4

the "cool" thing about the above sequence is that the instruction at
target1 gets executed, and then immediately we jump somewhere else, i.e.
we can execute one instruction somewhere and then immediately go somewhere
else (without having a branch at target1).  If you follow this example,
then you really understand delayed branching.

Note that the above example is the whole reason we must have a "B" bit in
the PSW (processor status word).  The B bit is set by any taken branch,
and is cleared by any other instruction.  The "gate" instruction, which is
used for privilege promotion, will fault if the B bit is set when the gate
instruction is executed.  The reason is that even though the gate
instruction can only be located on a execute only page (i.e. you can't
change the instruction sequence), you could use the above trick to execute
only the gate instruction and then return to your own code with increased
privilege if the "B" bit didn't exist.
