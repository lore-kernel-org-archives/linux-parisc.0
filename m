Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA17582
	for <parisc-linux@puffin.external.hp.com>; Tue, 17 Aug 1999 15:41:25 -0600
Message-Id: <199908172142.OAA29443@adlmail.cup.hp.com>
Subject: Re: [parisc-linux] sigsetreturn (was utssys?)
Date: Tue, 17 Aug 1999 14:46:34 -0700
From: Cary Coutant <cary@cup.hp.com>
To: "Ulrich Drepper" <drepper@cygnus.com>
cc: <parisc-linux@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-ID: <linux-parisc.vger.kernel.org>

>This is what Linux uses the sa_restorer in `struct sigaction' for.  I
>think it's a better interface then sigsetreturn() so consider
>implementing it this way and not provide sigsetreturn.

My Linux manual page for sigaction states that "the sa_restorer element 
is obsolete and should not be used."

Even if it's not obsolete, how would it be used? Is the programmer 
supposed to pass the address of sigreturn() (or equivalent) every time it 
calls sigaction, or is the first time sufficient? Either way, I don't see 
how this is a better interface than sigsetreturn().

Even better would be to dispense with a user-space sigreturn() 
completely. In shared-bound programs, where procedures return either with 
a long return sequence (LDSID, MTSP, BE) or via an export stub, the 
kernel could supply an address in kernel space, and the signal handlers 
would return correctly. This is the approach we take for 64-bit HP-UX, 
where we can assume PA-RISC 2.0 and the use of BVE for returns. This 
approach would also work for a flat address space.

Then the only challenge is to identify the interrupt marker on the stack 
correctly during a stack unwind. On 32-bit HP-UX today, this is done by 
setting a special flag in the stack unwind descriptor for sigreturn(). On 
64-bit HP-UX, the kernel passes the address of a tiny unwind table for 
sigreturn() at program startup, and the runtime loader treats this as if 
sigreturn() were in a shared object of its own.

-cary
