From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Mysterious hangs with parisc (a
	send_group_sig_info() analysis)
Date: Sun, 23 Jul 2006 22:16:31 -0600
Message-ID: <20060724041631.GB24411@colo.lackof.org>
References: <20060624015935.GJ12481@quicksilver.road.mcmartin.ca>
	<119aab440607221029h1acda159mf4c4e5baca2f0c1e@mail.gmail.com>
	<44C2A23C.8000509@tiscali.be>
	<200607221849.18925.mszick@morethan.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: "Michael S. Zick" <mszick@morethan.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200607221849.18925.mszick@morethan.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Jul 22, 2006 at 06:49:18PM -0500, Michael S. Zick wrote:
> The assumption here is that the flag bit in an external variable
> is always in-sync with the interrupt status bit in the register.

The flag bit is generally the value _before_ we attempted to acquire a lock.
I'm really not comfortable with passing in a zero flags value.
I'd need to review alot more code to be happy we aren't breaking
something else that uses __raw_spin_lock.

...
> A general purpose, like we don't know what state the interrupts
> are in, and we don't want to trust an external flag bit;
> 
> Looks like:
> 
> Busy_Loop:
>    Save current interrupt status to the external variable;
>    Enable interrupts; /* a nop if already enabled */
>    Cpu_relax; /* Long enough to recognize pending interrupts */
>    Restore interrupt status from external variable;

I'm ok with this for two reasons:
1) I'm not sure looking at the _previous_ state is the intent
2) branch in perf path is always a bad thing (after cacheline misses).

However, I don't know if there is a reason to instead look at
the previous state.

> Our redefining Cpu_relax to a pair of nops was for machines that
> delay recognizing interrupts for an instruction after changing
> the status bit.  We also included an asm comment in Cpu_relax
> just in case we wanted to see that it had not gotten optimized away.

the asm comment is a good idea.

> Same reason the mb() was redefined as an asm comment that could
> be identified by inspection.

*nod*.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
