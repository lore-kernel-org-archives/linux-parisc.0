From: Michael S. Zick <mszick@Wolf-01>
To: "John Marvin" <jsm@udlkern.fc.hp.com>
Subject: Re: [parisc-linux] 720 - some progress
Date: Mon, 1 Oct 2001 11:06:07 -0500
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: <parisc-linux@lists.parisc-linux.org>
Message-Id: <01100111060700.00856@Wolf-01>
List-ID: <linux-parisc.vger.kernel.org>



John;

Thanks a lot for the explanation - I am not surprised that the hardware
is more complex in its operation than the documentation tries to describe.
I have left the full text of your explanation attached so that future
readers of the mailing list archives don't get "half the story".

The ability to NOT EXECUTE the instruction returned to from a fault handler
might come in handy to somebody, someday.

What I was concerned about was the chance that the instruction addressed
by iaoq[1] was a branch (or taken conditional branch) instruction.  

Which, as you point out, could only happen if the MFCTL instruction was 
in the delay slot of a branch instruction.  (Has the compiler been told to
prohibit MFCTL in the delay slot? Not relavent here.)

With the description given in the documentation, then the queue state 
returned would have to be:

regs->iaoq[0] == branch instruction address
regs->iaoq[1] == target instruction address

I.E: That the hardware instruction address prediction was done prior to the
point in the hardware the address queue snapshot is taken on a fault.

The point you make describes instruction address prediction being done
after the point in the hardware flow that the address queue snapshot is
taken.

I.E:
regs->iaoq[0] == branch instruction address
regs->iaoq[1] == branch instruction address + 4

Is a just fine thing to do - the branch instruction will be executed with
the result that whatever was pointed to by iaoq[1] would be replaced by the 
target address (or ignored) in the process.

Certainly a complexity beyond printed documentation.
Anywho - its in the mail archives now for anyone that needs the
information.

Again, Thanks for the extra effort on these details.
Mike

> Date: Sunday, September 30, 2001 2:12 AM
> 
> > It looks (reads) as if it possible to return to the faulting instruction
> > (MFCTL in this case) without executing it.  If so, then adjusting the
> > instruction (and space) queues within the fault handler can be avoided;
> > also avoiding problems with finding the correct "following instruction"
> > address.
> 
> Using the nullify method you talk about does work, but the normal
> convention is to advance the pc queue (there are some performance
> advantages, particularly in the case where the instruction we are
> emulating is in the delay slot of a branch).  The problem you describe
> finding the following instruction doesn't exist.  You are correct about
> the space queue though, but only in the case for a delay slot in the
> branch to the gateway page.  The correct method of advancing the queue is
> the one that has been proposed in the various patches, i.e.:
> 
> 	regs->iaoq[0] = regs->iaoq[1];
> 	regs->iaoq[1] += 4;
> 
> To be perfectly correct, this should be added:
> 
> 	regs->iasq[0] = regs->iasq[1];
> 
> But, again, that last is only necessary if someone actually puts a mfctl
> in the delay slot of the branch to the gateway page (a kernel call) and
> since kernel calls are already provided, we know that no such thing
> actually happens, nor is it likely to happen unless someone handcodes
> their own kernel call. I would put the line in though.
> 
> Here is why there is not a problem advancing the queue as above:
> the only way that "regs->iaoq[1] += 4" would do the wrong thing would
> be if we were emulating a branch instruction. Since we know we are
> emulating a mfctl instruction, this is not the case. Note that if
> someone needs to emulate a branch instruction, computing the new
> value of iaoq[1] would be part of that emulation.
> 
> John Marvin
> jsm@fc.hp.com
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
