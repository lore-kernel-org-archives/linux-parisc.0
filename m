From: Kurt Roeckx <kurt@roeckx.be>
Subject: Re: HPPA and Squeeze
Date: Fri, 19 Jun 2009 17:15:26 +0200
Message-ID: <20090619151526.GA30984@roeckx.be>
References: <4A3B2AC4.90105@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: "debian-hppa@lists.debian.org" <debian-hppa@lists.debian.org>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Debian Release <debian-release@lists.debian.org>
To: Luk Claes <luk@debian.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A3B2AC4.90105@debian.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I take a regular look at various arches why packages are not
correctly built.  hppa is the most annoying arch for me. If you
look at the stats you will notice that it's almost always
the lowest in the stats.  The reason it more or less keeps up is
because I put alot of time in looking at the state of the
packages and that packages get retried alot by the buildd
maintainer.

One of the most annoying things about it is that packages only
get uploaded 2 or 3 times a week.  This has as effect that alot
of packages fail to build because others haven't been uploaded
yet.  Alot of packages are uninstallable, and are basicly waiting
for others to be built/uploaded.  With only 2/3 uploads a week
this means that packages are uninstallable for _weeks_.  By the
time the first reason has been fixed, something else already make
it uninstallable again.  And I guess this is also the reason
the release team always needs to take a look at why something
is uninstallable on hppa.  I can deal with this, but because of
this reason, hppa is a low priority port for me.

So it's my understanding that the porters have no idea about the
problems.  So I will start to mail you about problems as soon
as I see them and they look like porting issues specific
to hppa.

Here is a list of packages that failed to build because of instability
on the buildds today:
package     | buildd   | error
qgit        | penalosa | make: *** [install] Segmentation fault
acpica-unix | peri     | make: *** [install] Segmentation fault


This are probabaly porting issues, they atleast seems to
only affect hppa:
package        | error
rt-tests       | PTHREAD_PRIO_INHERIT undeclared (NPTL support?)
insighttoolkit | undefined references
axis	       | #531995: Cannot override the final method from ResourceBundle
petsc	       | petscvariables: No such file or directory

Logs can be found at
https://buildd.debian.org/build.cgi?arch=hppa;pkg=$package


Kurt

On Fri, Jun 19, 2009 at 08:05:56AM +0200, Luk Claes wrote:
> Hmm...
> 
> It's right that some of my comments are rather harsh, though you must
> know that I'm not speaking from a personal perspective.
> 
> Personally (and as Release Manager), I would be very happy to have a
> good working hppa port for Squeeze and beyond.
> 
> I made sure that the hppa port was included into Lenny even when the
> Debian System Administrators (DSA), package maintainers, release team
> members an others were shouting to drop it. I thought it was unfair to
> drop the port just before the release. They accepted my decision as long
> as I would make it clear that it was a *big* exception not to be taken
> lightly. At the time java support was completely dropped, buildds were
> crashing every other day and support for other programing languages
> looked poor and the port was still using linuxthreads as the latest of
> all ports.
> 
> After the release of Lenny there were still not much signs of
> improvement to the reliability of the buildds and the move to ntpl (that
> was going to solve almost all issues the maintainers had) seemed to not
> happen and not going to solve everything. The only surprising
> improvement was the regained java support.
> 
> It's quite disturbing in my honest opinion that only after us starting a
> thread like this one that we get to know the status of some of the
> porting efforts and lots of vocal support, but not many visible
> improvements. Instead of making sure that there is visibile improvement
> after that, this pattern seems to repeat itself which is not looking
> very promising. I'm sorry if my and others' frustration is ventilated in
> some of the mails. The issues with the buildds are lasting for years
> already with lots of time spent by DSA and others.
> 
> I still hope that the hppa porters can prove us wrong, fix the kernel
> issues (which are the probable cause of the unreliability of the
> buildds), finalise the ntpl move and stay on top of porting issues in
> Debian in the future.
> 
> Please let us now focus on improving the status of the hppa port in
> general and the buildds in particular!
> 
> Cheers
> 
> Luk
> 
> 
> -- 
> To UNSUBSCRIBE, email to debian-release-REQUEST@lists.debian.org
> with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
> 
