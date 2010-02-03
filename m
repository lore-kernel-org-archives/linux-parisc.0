From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: futex wait failure
Date: Tue, 2 Feb 2010 22:44:21 -0500
Message-ID: <20100203034420.GA8520@hiauly1.hia.nrc.ca>
References: <20100108211733.852134EF4@hiauly1.hia.nrc.ca> <4B689634.8060408@gmx.de>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	Kyle McMartin <kyle@mcmartin.ca>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4B689634.8060408@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 02 Feb 2010, Helge Deller wrote:

> I wonder if we have some problems with the LWS code path in the kernel
> regarding atomic locking with futexes?
>
> In arch/parisc/kernel/syscall.S we use a lock table called lws_lock_start[]
> to guard the LWS code against other competing userspace processes.
> I wonder if this really enough, esp. since we do implement futex syscalls
> (e.g. clone/exit calls uses futex functions to change userspace values
> because of CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID).
>
> Do we maybe need to protect the LWS code path with the same locking table 
> as the
> generic kernel? Atomicity of futexes writing to userspace are not in sync
> with the locking of the LWS/lws_lock_start[] code.
>
> I tried to come up with a patch for that which I attached here, but sadly
> it hangs as soon as the init process is started on a 64bit/SMP kernel.
> So either my thinking here is stupid, or I do have a stupid coding bug.
>
> Furthermore, the coding for futex_atomic_op_inuser() in
> arch/parisc/include/asm/futex.h seems to miss real functionality.
> I didn't looked closer into this though.

While locking may be a problem, it is not the main reason the minifail
program fails.  The program fails on my c3750 with a 32-bit UP kernel.
There is no locking in this kernel.  The LWS code relies on the scheduler
for atomicity.

I tried disabling interrupts around the crucial three instructions but
it didn't help.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
