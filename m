From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Let's Try Something New(tm)
Date: Sat, 17 Feb 2007 08:02:01 -0600
Message-ID: <1171720921.3379.11.camel__49117.7414231517$1416624290$gmane$org@mulgrave.il.steeleye.com>
References: <20070217064648.GA2880@athena.road.mcmartin.ca>
	<20070217103018.GD26273@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070217103018.GD26273@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, 2007-02-17 at 03:30 -0700, Grant Grundler wrote:
> And yes, the fact that SMP is broken bothers me too.
> I've spent some time looking at the cpu_possible_map patch pointed
> out by james bottomly (IIRC) and I haven't figure out why that
> has the impact that it does.

Let me go over it one more time for the record, since the problem has
really only been outlined on IRC.

In the 2.6.18 timeframe Nick Piggin introduced a bug into the smp tuning
system with commit 5c1e176781f43bc902a51e5832f789756bff911b

What he's doing is trying to ensure /sbin/init doesn't start (or get
scheduled) on an isolated CPU.  However, he built this change on
cpu_online_map, which contains precisely the boot cpu at the point
sched_init_smp() is called.  The result was that init was restricted to
the boot CPU, as was everything that inherited its cpus_allowed from
init (i.e. every other process).  I think it may only have been parisc
that was affected like this, since we hotplug boot our cpus.

Post 2.6.19 the bug was spotted and fixed by Nathan Lynch with commit
e5e5673f828623e58a401862b33173591faaeaff.  When this commit was applied
parisc began hanging in the SMP boot sequence.

However, this patch is not the *cause* of the problem.  If you back port
it to 2.6.19-pa0 (which has the piggin bug) you'll see that it boots
just fine SMP and correctly schedules on all CPUs.

So, what happened is that the bug which is causing our SMP boot hangs
got introduced somewhere between 2.6.19 and the Lynch bug fix, but we
didn't spot it because parisc was only scheduling on the boot CPU and it
didn't show up.

Analysis of my system shows that it's occurring when a shell script dots
in another shell script (i.e. it could be a fork or signal bug).  Also
reverting all 30 commits affecting sched.c during the window doesn't fix
it.  Unfortunately, the tree isn't really in a good enough state to try
to bisect it.

> I also haven't had time to dig more into why the schedule is
> only running things on CPU 0.

Hopefully the above explains that.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
