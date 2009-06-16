From: Lucas Nussbaum <lucas@lucas-nussbaum.net>
Subject: Re: HPPA and Squeeze
Date: Tue, 16 Jun 2009 08:25:31 +0200
Message-ID: <20090616062531.GA17957@xanadu.blop.info>
References: <20090602140734.GC26721@mx0.halon.org.uk> <20090606183600.GA425@lackof.org> <4A31FA76.20103@debian.org> <20090615173102.GC2690@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: HPPA porters <debian-hppa@lists.debian.org>,
	Debian Release <debian-release@lists.debian.org>,
	admin@debian-ports.org, linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090615173102.GC2690@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 15/06/09 at 11:31 -0600, Grant Grundler wrote:
> I was expecting a summary of specific issues from an organization
> that claims to operate transperently.  The hand waving is easy. But
> doesn't resolve problems and doesn't meet my expectation of an "open"
> organization that I've donated money, time, and materials to.
> 
> >  It's an
> > extra bad feeling we get that even the people that do respond when there
> > is a request regarding hppa porters don't know what the issues are...
> 
> Expecting me to know the state of user space components is a bit silly.
> I'm not a DD. I'm a kernel developer. Specifically IO/Device Drivers.
> 
> Carlos does know that state (toolchain/glibc) and he just wanted
> a list of issues that are driving this decision. It's a very reasonable
> question he asked.

[...]

> I can put one (and maybe two) machines on a public IP. Just ask.
> The remote console access will remain behind a fire wall.
> 
> BTW, that firewall was reviewed and approved by Lamont (a pretty well
> known DD and buildd maintainer).
> 
> Thibaut Varene (who is a DD) has offered to host HPPA buildd machines
> as well but hasn't heard any response to that offer either.

(Stepping in ; I had some HPPA-related issues in one of my packages -
ruby1.9 - so this is based on my experience with that problems)

I think that your email summarizes the problem quite well: there are
several people willing to offer buildd hosting, help after someone else
has investigated the issues, etc.
What debian-hppa currently lacks is someone that is willing to
proactively detect issues (looking at packages that failed to build, for
example), investigate them, and fix them. This can be done cooperating
with the package maintainers, but the HPPA side should take the lead.
The fact that HPPA people are asking the release team "what are the
problems you are talking about?" clearly shows that this is broken: the
HPPA people should be knowing more than the release team about HPPA
issues.

PS: if you want an HPPA-specific issue to play with,
http://experimental.debian.net/fetch.php?&pkg=ruby1.9&ver=1.9.0.1-5&arch=hppa&stamp=1213563978&file=log&as=raw
might be a good candidate.
-- 
| Lucas Nussbaum
| lucas@lucas-nussbaum.net   http://www.lucas-nussbaum.net/ |
| jabber: lucas@nussbaum.fr             GPG: 1024D/023B3F4F |
