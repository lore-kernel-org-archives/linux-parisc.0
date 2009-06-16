From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: HPPA and Squeeze
Date: Tue, 16 Jun 2009 14:50:27 -0600
Message-ID: <20090616205027.GB25380@lackof.org>
References: <20090602140734.GC26721@mx0.halon.org.uk> <20090606183600.GA425@lackof.org> <4A31FA76.20103@debian.org> <20090615173102.GC2690@lackof.org> <20090616062531.GA17957@xanadu.blop.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	HPPA porters <debian-hppa@lists.debian.org>,
	Debian Release <debian-release@lists.debian.org>,
	admin@debian-ports.org, linux-parisc@vger.kernel.org
To: Lucas Nussbaum <lucas@lucas-nussbaum.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090616062531.GA17957@xanadu.blop.info>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jun 16, 2009 at 08:25:31AM +0200, Lucas Nussbaum wrote:
...
> > BTW, that firewall was reviewed and approved by Lamont (a pretty well
> > known DD and buildd maintainer).
> > 
> > Thibaut Varene (who is a DD) has offered to host HPPA buildd machines
> > as well but hasn't heard any response to that offer either.
> 
> (Stepping in ; I had some HPPA-related issues in one of my packages -
> ruby1.9 - so this is based on my experience with that problems)
> 
> I think that your email summarizes the problem quite well: there are
> several people willing to offer buildd hosting, help after someone else
> has investigated the issues, etc.
> What debian-hppa currently lacks is someone that is willing to
> proactively detect issues (looking at packages that failed to build, for
> example), investigate them, and fix them. This can be done cooperating
> with the package maintainers, but the HPPA side should take the lead.

Yup - this is definitely true. debian-hppa needed alot of prodding to
look at buildd failures.

> The fact that HPPA people are asking the release team "what are the
> problems you are talking about?" clearly shows that this is broken: the
> HPPA people should be knowing more than the release team about HPPA
> issues.

Generalizing one person's response (mine) to represent the group is wrong.

However I agree the release team has no one who cares about HPPA involved.
And yes, it's up to the release team to track bugs and determine
the viability of a release based on outstanding bugs.

As I said before, I'm ok with NOT having a "stable" HPPA release.
If someone disagrees, then they need to participate in the release
team and help debian-hppa focus on critical buildd failures. ie generate
the nag mail listing the HPPA-specific issues that need to be resolved.


> PS: if you want an HPPA-specific issue to play with,
> http://experimental.debian.net/fetch.php?&pkg=ruby1.9&ver=1.9.0.1-5&arch=hppa&stamp=1213563978&file=log&as=raw
> might be a good candidate.

This did take a long time to resolve. Helge described the root cause
(ruby did not support LinuxThreads implementation correctly) and
resolution plan (migrate HPPA to NTPL).

No phase of this problem sounds trivial to debug or resolve.
Based on this, I can argue the HPPA response is reasonable even
if is unsatisfactory and frustrating to you (as package maintainer).

Do you have another HPPA specific issue?
Or maybe just remind the list how to find those issues?
(Teach a man to fish...)

thanks,
grant
