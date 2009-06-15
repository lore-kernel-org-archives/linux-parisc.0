From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: HPPA and Squeeze
Date: Mon, 15 Jun 2009 11:31:02 -0600
Message-ID: <20090615173102.GC2690@lackof.org>
References: <20090602140734.GC26721@mx0.halon.org.uk> <20090606183600.GA425@lackof.org> <4A31FA76.20103@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: HPPA porters <debian-hppa@lists.debian.org>,
	Debian Release <debian-release@lists.debian.org>,
	admin@debian-ports.org, linux-parisc@vger.kernel.org
To: Luk Claes <luk@debian.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A31FA76.20103@debian.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jun 12, 2009 at 08:49:26AM +0200, Luk Claes wrote:
> Grant Grundler wrote:
> > +linux-parisc (hppa kernel, compiler and !debian tech forum)
> > 
> > Neil,
> > thanks for the summary. I know this is an unpleasant business in general.
> > 
> > On Tue, Jun 02, 2009 at 03:07:35PM +0100, Neil McGovern wrote:
> >> Hi,
> >>
> >> As mentioned previously[0], the release team haven't been happy with the
> >> state of the HPPA port in Debian. After the release team meeting[1], it
> >> has been decided that unfortunatly HPPA will not be supported for
> >> Squeeze. This was after careful consideration, and wasn't an easy
> >> decision.
> >>
> >> This means that ftpmasters will be asked to remove HPPA from testing and
> >> unstable from the 30th June. It is suggested that HPPA porters may wish
> >> to consider using debian-ports.org if they wish to continue with the
> >> port.
> >>
> >> Regards,
> >> Neil McGovern
> >>
> >> [0] http://lists.debian.org/debian-release/2009/04/msg00299.html
> > 
> > Carlos O'Donnell asked some questions in response to [0] and I never
> > saw any response.  Can an attendee of the above meeting please reply
> > this email from Carlos?
> >
> >     http://lists.debian.org/debian-release/2009/04/msg00303.html
> 
> Note that it's wrong to assume we will come with the answers.

I was expecting a summary of specific issues from an organization
that claims to operate transperently.  The hand waving is easy. But
doesn't resolve problems and doesn't meet my expectation of an "open"
organization that I've donated money, time, and materials to.

>  It's an
> extra bad feeling we get that even the people that do respond when there
> is a request regarding hppa porters don't know what the issues are...

Expecting me to know the state of user space components is a bit silly.
I'm not a DD. I'm a kernel developer. Specifically IO/Device Drivers.

Carlos does know that state (toolchain/glibc) and he just wanted
a list of issues that are driving this decision. It's a very reasonable
question he asked.

> > I also never got a response to my offer here:
> >     http://lists.debian.org/debian-release/2009/04/msg00339.html
> 
> There was some discussion with DSA and they didn't seem willing to take
> the offer as it would be very restricted regarding access and control
> (too strongly firewalled if I remember correctly) for our administrators.

I can put one (and maybe two) machines on a public IP. Just ask.
The remote console access will remain behind a fire wall.

BTW, that firewall was reviewed and approved by Lamont (a pretty well
known DD and buildd maintainer).

Thibaut Varene (who is a DD) has offered to host HPPA buildd machines
as well but hasn't heard any response to that offer either.

> It's rather strange that you did not get any feedback in
> that regard.

Agred. Maybe the problems that need to be resolved aren't technical ones.

In any case, responding to some of the above with specific concerns
should continue this constructive dialog.

> 
> > And my response again to this question posted in [0]:
> >> * The machines that host the buildds still seem to have a very
> >> unreliable kernel. Is there any update on this?
> 
> It looks like the amount of random crashes has decreased and the amount
> of random segfaults has increased, though does not look promising after
> more than 2 years already of random issues like this.

The buildd is seeing issues most other HPPA users (including me) are
not seeing. That makes the problems quite a bit harder to resolve.

Last time I tried to set up a buildd was rather painful and exceeded
the amount of time I was willing to invest (vs contributing to other
kernel issues). This was more than 2 years ago and I'm willing to
try again IFF someone can tell me what impact that would have on
the Debian cabal that seems to be running things.

> > Is upstream stable enough for a buildd?  I don't know since I'm not aware
> > of any attempts to run a buildd with those kernels.
> 
> Rather recent kernels have been tried and like said above seem to behave
> better, but still very much subpar.

Have bugs been filed for those issues that HPPA folks can look at?
How can I find them?

> > Is the answer to that question still germane?
> > If so, I'm willing to setup a local buildd and try it. But I will need
> > more time and some commitment that if it works, hppa remain in testing
> > release (that's all I personally care about - I don't care about "stable"
> > releases.)
> 
> That's not how it works. testing is the preparation for the next stable
> release, so staying in testing means fixing any important outstanding
> porting issue and most importantly the random crashes and segfaults,
> actively making sure there are no important issues with the hppa port
> within Debian and committing to support the next stable release.

Ok. Sounds like Helge is ok with "unstable" and I'll try switching to
"unstable" instead of "testing". 


> > Can we have the minutes for this meeting?
> 
> No, I didn't even get the chance myself to read them. A summary of the
> minutes will be posted as usual in the next 'Bits from the Release Team'
> though.

Ok - can debian-hppa mailing list be CC'd when that's posted please?

> > Also, I'd like to ask HPPA debs be kept in "testing" staging area,
> > just never promoted when the release is cut.  This will let people
> > continue using HPPA without having to suffer with the !hppa breakage
> > that lives in unstable.
> 
> This will get DSA, maintainers, release team and others keep being
> frustrated that hppa issues are making their work harder

My goal is to allow these folks to ignore HPPA but still allow HPPA
to benefit from the "let bits bake in unstable before promoting".

I want to acknowledge stable releases are alot of work and I believe
Debian HPPA is sufficiently usable without that extra work.

>  and will only
> be tolerated if there will finally be a clear commitment from the hppa
> porters to deal with any present and future important porting issue in a
> reasonable time frame.
>
> The main problem we have with hppa is that important porter issues are
> not dealt with in a reasonable time frame. The random crashes and
> segfaults are lasting for years already!

As Helge said, many problems have been fixed. It's unfair to ignore that.

And open source is in general is NOT living up to the "good becuase
it was reviewed by many people" for the bulk of the code. HPPA is
suffering from this while resolving some pretty ugly arch specific issues.


> Note that we do *NOT* intend to drop hppa from unstable, it being
> mentioned at all was an unfortunate sign of the deep frustration of some...

Ok. Thanks for clarifying.

cheers,
grant
