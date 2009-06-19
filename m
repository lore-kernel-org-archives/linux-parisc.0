From: Luk Claes <luk@debian.org>
Subject: HPPA and Squeeze
Date: Fri, 19 Jun 2009 08:05:56 +0200
Message-ID: <4A3B2AC4.90105@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	Debian Release <debian-release@lists.debian.org>
To: "debian-hppa@lists.debian.org" <debian-hppa@lists.debian.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hmm...

It's right that some of my comments are rather harsh, though you must
know that I'm not speaking from a personal perspective.

Personally (and as Release Manager), I would be very happy to have a
good working hppa port for Squeeze and beyond.

I made sure that the hppa port was included into Lenny even when the
Debian System Administrators (DSA), package maintainers, release team
members an others were shouting to drop it. I thought it was unfair to
drop the port just before the release. They accepted my decision as long
as I would make it clear that it was a *big* exception not to be taken
lightly. At the time java support was completely dropped, buildds were
crashing every other day and support for other programing languages
looked poor and the port was still using linuxthreads as the latest of
all ports.

After the release of Lenny there were still not much signs of
improvement to the reliability of the buildds and the move to ntpl (that
was going to solve almost all issues the maintainers had) seemed to not
happen and not going to solve everything. The only surprising
improvement was the regained java support.

It's quite disturbing in my honest opinion that only after us starting a
thread like this one that we get to know the status of some of the
porting efforts and lots of vocal support, but not many visible
improvements. Instead of making sure that there is visibile improvement
after that, this pattern seems to repeat itself which is not looking
very promising. I'm sorry if my and others' frustration is ventilated in
some of the mails. The issues with the buildds are lasting for years
already with lots of time spent by DSA and others.

I still hope that the hppa porters can prove us wrong, fix the kernel
issues (which are the probable cause of the unreliability of the
buildds), finalise the ntpl move and stay on top of porting issues in
Debian in the future.

Please let us now focus on improving the status of the hppa port in
general and the buildds in particular!

Cheers

Luk
