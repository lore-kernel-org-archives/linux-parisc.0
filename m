From: dann frazier <dannf@dannf.org>
Subject: Re: HPPA and Squeeze
Date: Fri, 12 Jun 2009 09:35:45 -0600
Message-ID: <20090612153544.GA27867@lackof.org>
References: <20090602140734.GC26721@mx0.halon.org.uk> <20090606183600.GA425@lackof.org> <4A31FA76.20103@debian.org> <9905faa50906120053u3f58af9fubac865a921ff4eaa@mail.gmail.com> <9905faa50906120055n2626c787q7c112b9ca1bf1311@mail.gmail.com> <1244816185.4184.3.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Bart Schelstraete <bart@schelstraete.org>,
	HPPA porters <debian-hppa@lists.debian.org>,
	Debian Release <debian-release@lists.debian.org>,
	admin@debian-ports.org, linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1244816185.4184.3.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jun 12, 2009 at 09:16:25AM -0500, James Bottomley wrote:
> On Fri, 2009-06-12 at 09:55 +0200, Bart Schelstraete wrote:
> > Hello all,
> > 
> >  Everybody is talking about the 'random crashes' and 'segfaults' in
> > the HPPA version.
> >  Over here I'm using the hppa on a small HP-UX workstation, and that
> > has an uptime of 542 days!.
> >  So it's not that unstable.
> >  I even need to say that I had a lot more crashes with the x86 version
> > then with the hppa version.
> 
> It seems to be related to what machine you actually have.

And the load - buildds for unstable seem to trip over issues that we
don't see elsewhere.

>   I run a B180
> as my network gateway, handling firewall, web,
> postfix/postgrey/spamassassin at quite a high volume on a domain.  I
> also used to run it with a PCMCIA wireless card just for chuckles and
> grins (although I stopped that two years ago when I got a linksys).  It
> runs debian testing and has been completely stable.  I only reboot it
> for updates and in the seven or so years I've been doing this, I haven't
> had any segfaults or crashes ... have to say I only started using debian
> kernels on it for the last four or so years, because there used to be
> big problems with the ones they built.
> 
> >  Just to say that I'm personally not so unhappy with deb hppa, and
> > that not everything is bad.
> 
> I think the main class of problem machines are anything with SMP ...
> unfortunately, I don't have one, so can't verify.

We've tried both SMP and non-SMP kernels.

-- 
dann frazier

