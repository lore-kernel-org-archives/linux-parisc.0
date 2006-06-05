From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] User space locks -- what's wrong
Date: Mon, 5 Jun 2006 10:40:33 -0400
Message-ID: <20060605144033.GD1335@skunkworks.cabal.ca>
References: <200606042355.k54Ntw0R026812@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200606042355.k54Ntw0R026812@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jun 04, 2006 at 07:55:58PM -0400, John David Anglin wrote:
> I'm about to throw the following change to the garbage heap since it
> doesn't work as expected, particularly with SMP kernels.
> 
> The problem is I still see occasional libstdc++ and libjava testsuite
> failures in pthread process intensive tests.  In particular, I'm getting
> timeouts on tests that didn't timeout before.
>

I don't suppose we could test this using locks based on Carlos'
light-weight-syscalls? This would have the added 
 
> The enclosed change is based on ideas presented in the paper,
> "Implementing Spinlocks on the Intel Itanium Architecture and PA-RISC".
>

The changes look fine to me.
 
> The main issue that the change tries to address is that spinning
> indefinitely in user space on a UP kernel just burns cycles.  So, the
> change is to spin awhile and then sleep.  This seemed to work with
> the test application in the paper, but in practice it seems to cause
> more test failures that just spinning, particularly on SMP kernels.
> I suspect that on SMP kernels we sometimes end up with all threads
> sleeping.
> 

That's absolutely bizarre. Can you include steps for us toolchain
newbies to reproduce this? I'd love to try and trace down why this is
occuring. It could be a problem indicative of something very funky
occuring in our kernel.

> I've tried various sleep routines including sched_yield, and other
> optimizations, but they don't seem to make a difference.  The trick
> to dirty the cacheline presented in the paper didn't help performance
> as measured by the Appendix F program.  I also didn't see
> and difference in performance using the ",co" completer.  Possibly,
> this is because I only tested on coherent PA 2.0 machines.
> 

I suspect a majority of this is because we aren't running
optimally as it is. I suspect if we were performing as well as HPUX
the minor details would make more of a difference.

Cheers,
	Kyle
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
