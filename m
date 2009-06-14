From: Thibaut VARENE <varenet@debian.org>
Subject: Re: HPPA and Squeeze
Date: Sun, 14 Jun 2009 20:29:14 +0200
Message-ID: <7d01f9f00906141129h35e90347r90fb5e415654544d@mail.gmail.com>
References: <20090602140734.GC26721@mx0.halon.org.uk>
	 <20090606183600.GA425@lackof.org> <4A31FA76.20103@debian.org>
	 <9905faa50906120053u3f58af9fubac865a921ff4eaa@mail.gmail.com>
	 <9905faa50906120055n2626c787q7c112b9ca1bf1311@mail.gmail.com>
	 <1244816185.4184.3.camel@mulgrave.site>
	 <20090612153544.GA27867@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Bart Schelstraete <bart@schelstraete.org>,
	HPPA porters <debian-hppa@lists.debian.org>,
	Debian Release <debian-release@lists.debian.org>,
	admin@debian-ports.org, linux-parisc@vger.kernel.org
To: dann frazier <dannf@dannf.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090612153544.GA27867@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jun 12, 2009 at 5:35 PM, dann frazier<dannf@dannf.org> wrote:
> On Fri, Jun 12, 2009 at 09:16:25AM -0500, James Bottomley wrote:

>> It seems to be related to what machine you actually have.
>
> And the load - buildds for unstable seem to trip over issues that we
> don't see elsewhere.

"Workload" more to the point. Almost all my parisc boxen have been
running BOINC for years and never puked on it. I'm quite convinced the
issues buildds are suffering are much less random than people believe.
It's more likely that they are very uncommon corner cases.

FWIW, afaik "lafayette" - the autobuilder I recently provided - seems
to be running mostly fine. And as far as I (as the local admin) am
concerned, I believe my "response" time to problems (such as when the
first hardware that was committed to this autobuilder failed beyond
salvation and had to be entirely replaced) is acceptable. Let me know
if that weren't true ;-)

HTH
T-Bone

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
