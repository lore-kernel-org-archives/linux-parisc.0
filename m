Received: from rhirst.linuxcare.com (sleepie.demon.co.uk [194.222.23.208])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id LAA31180
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 11:48:36 -0700
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id A5740B007; Wed, 15 Nov 2000 18:48:08 +0000 (GMT)
Date: Wed, 15 Nov 2000 18:48:08 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@puffin.external.hp.com
Message-ID: <20001115184808.P32715@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Single-stepping
List-ID: <linux-parisc.vger.kernel.org>

(Oops, CC-ed to the wrong list first time!)

Hi John,
  I've been helping Alan Modra out with kernel changes to support
single stepping for gdb.  Paul Bame suggested I bounced our ideas
off you in case you (or anyone else) had any comments.  I havn't
actually committed my changes yet.

The basic approach is to use the recovery counter to generate
a trap every instruction.  The scheme is complicated because a
suspended process may or may not return to user space via an RFI.

If it was suspended as a result of an interrupt then we can
simply set PSW bit R in the tasks saved registers and it will
get loaded by the RFI.  On every task switch I set the
recovery counter to 0, just in case the new process is being
single-stepped.

If a process is suspended during a syscall, then there is no
RFI on the return path to userland, and we have to handle things
differently.  I have changed the syscall return path such that
it loads the recovery counter with 3 before updating the PSW
with a value from the tasks saved registers.  If that PSW has
the R bit set, then the count of 3 will generate a trap on the
first instruction following the branch back to user space.
Note that PSW wasn't previously restored on the syscall return
path.

To avoid further complications of interrupts during the three
instructions when the recovery counter is decrementing, whenever
we set the R bit, we also clear the I bit to disable interrupts.

Nullified instructions are handled by the controlling process
manually moving the childs IAOQ over the instruction without
actually setting it running, because the recovery counter isn't
decremented for nullified instructions.

I need to do some more testing before committing this, but would
welcome any comments on the basic approach taken, areas I have
mis-understood, or problems with it that might not yet have
occurred to me.

Thanks,
  Richard
