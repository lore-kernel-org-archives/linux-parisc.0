From: "Jeff Bailey" <jbailey@raspberryginger.com>
Subject: [parisc-linux] Re: NPTL for hppa-linux is not backwards compatible
	with Linuxthreads.
Date: Mon, 19 Feb 2007 10:48:41 -0500
Message-ID: <5b2e36650702190748j1d9306e6mdbc6dc8ed210c4ab__21915.2813581333$1416624303$gmane$org@mail.gmail.com>
References: <119aab440702181143h682c78d9ra0d765b06e08a594@mail.gmail.com>
	<200702182027.00027.vapier@gentoo.org>
	<5b2e36650702190532u680731e4j71fa272806343b17@mail.gmail.com>
	<45D9C1AC.9000501@aurel32.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
Cc: matthias.klose@ubuntu.com,
 libc-ports@sourceware.org,
 Aurelien Jarno <aurel32@debian.org>,
 Roland McGrath <roland@redhat.com>,
 debian-glibc@lists.debian.org,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Aurelien Jarno" <aurelien@aurel32.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <45D9C1AC.9000501@aurel32.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 19/02/07, Aurelien Jarno <aurelien@aurel32.net> wrote:
> >> if the breakage is just in pthreads, i dont think the libc ABI needs to be
> >> bumped, just the pthread one ?  libc provides look ahead stub functions for
> >> pthreads, so it shouldnt be affected by the breakage you've mentioned with
> >> static lock initializers ...
> >>
> >> libpthread.so.0 -> libpthread.so.1
> >
> > While it's definetly Ubuntu and Debian's problem, not upstream's,
> > libpthread is bundled in the "libc6" package.  Bumping just the
> > libpthread version will make packaging hard for those distros.  If
> > there are other ABI breaking moves that need to be done that would
> > cause a bump from libc6, doing them now would help sidestep the
> > problem.
>
> Well I am thinking in splitting out libpthread.so.X from the libc6
> package if the ABI breakage is confirmed. This is still a very
> complicated transition, but I think far less packages are affected.

Well, the ABI breakage is confirmed.  I just remember people siting
some other corner case problems with the ABI they wanted to change.
Now would be a great time to change it all over if we need to do this.

> I am a bit busy right now, but I think we should put our transition
> ideas (at least for Debian, and probably Ubuntu) on a wiki, for example
> http://wiki.debian.org/HppaNptlTransition

Sounds good.  I've added doko to the cc: list.

-- 
Jeff Bailey - http://www.raspberryginger.com/jbailey/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
