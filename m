From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] User space locks -- what's wrong
Date: Tue, 6 Jun 2006 21:30:05 -0400
Message-ID: <119aab440606061830peac8e3ah7030b831881e6f76@mail.gmail.com>
References: <200606042355.k54Ntw0R026812@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
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

On 6/4/06, John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:
> I'm about to throw the following change to the garbage heap since it
> doesn't work as expected, particularly with SMP kernels.
>
> The problem is I still see occasional libstdc++ and libjava testsuite
> failures in pthread process intensive tests.  In particular, I'm getting
> timeouts on tests that didn't timeout before.

These could very well be related to our linuxthreads implementation?

It could be related to a problem with signals, which manifests as a
thread-manager issue, which under linuxthreads can break everything.
The thread-manager does all of it's work using a pipe and signals...
lots and lots of signals.

> The enclosed change is based on ideas presented in the paper,
> "Implementing Spinlocks on the Intel Itanium Architecture and PA-RISC".
>
> The main issue that the change tries to address is that spinning
> indefinitely in user space on a UP kernel just burns cycles.  So, the
> change is to spin awhile and then sleep.  This seemed to work with
> the test application in the paper, but in practice it seems to cause
> more test failures that just spinning, particularly on SMP kernels.
> I suspect that on SMP kernels we sometimes end up with all threads
> sleeping.
>
> I've tried various sleep routines including sched_yield, and other
> optimizations, but they don't seem to make a difference.  The trick
> to dirty the cacheline presented in the paper didn't help performance
> as measured by the Appendix F program.  I also didn't see
> and difference in performance using the ",co" completer.  Possibly,
> this is because I only tested on coherent PA 2.0 machines.
>
> Thoughts?

You've implemented almost exactly what glibc does for pthreads.
However, glibc uses nanosleep without any adverse effects.
Have you tried other syscalls instead of select?

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
