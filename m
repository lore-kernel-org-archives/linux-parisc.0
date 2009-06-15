From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: HPPA and Squeeze
Date: Mon, 15 Jun 2009 10:26:56 -0600
Message-ID: <20090615162656.GA2690@lackof.org>
References: <20090602140734.GC26721@mx0.halon.org.uk> <20090606183600.GA425@lackof.org> <20090608212606.GC19894@halon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	HPPA porters <debian-hppa@lists.debian.org>,
	linux-parisc@vger.kernel.org
To: Neil McGovern <maulkin@halon.org.uk>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090608212606.GC19894@halon.org.uk>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Jun 08, 2009 at 10:26:06PM +0100, Neil McGovern wrote:
> Firstly, thanks for your mail, apologies that I haven't replied sooner,
> we've had EU and local elections, so I've been busy runnign around with
> leaflets, knocking on doors, kissing babies etc. like any politician. No
> expenses though...

No problem.

> 
> On Sat, Jun 06, 2009 at 12:36:01PM -0600, Grant Grundler wrote:
> > Carlos O'Donnell asked some questions in response to [0] and I never
> > saw any response.  Can an attendee of the above meeting please reply
> > this email from Carlos?
> >     http://lists.debian.org/debian-release/2009/04/msg00303.html
> > 
> 
> I'm not sure what replies you'd like... there's certainly been some
> follow ups to that mail.

The following questions haven't been answered in that thread:
1) Is there a list of different porting efforts?
2) What is considered proper java support? GCJ?

I've commented on the kernel side and it's looking better.
I don't know the status of the HPPA installer.

> > I also never got a response to my offer here:
> >     http://lists.debian.org/debian-release/2009/04/msg00339.html
> > 
> 
> Indeed, and that's worrying. I would have expected a HPPA porter (if
> indeed one still exists) to have replied to that.

Or they already have machines. I'm not a DD and don't aspire to be one.
So these are "in the wild" from a Debian point of view.

> > Quite a few serious hppa specific bugs have been fixed upstream over
> > the past 6 months. This is worth revisiting.
> > 
> > Is upstream stable enough for a buildd?  I don't know since I'm not aware
> > of any attempts to run a buildd with those kernels.
> 
> Neither do we, we're not HPPA porters :)
> We did go through this before with newer kernels, and it didn't help
> FWIW.
> 
> > Is the answer to that question still germane?
> 
> Ish. We still have the issue that you can't actually buy HPPAs any more,
> and various bits and pieces from the Arch Requalification list.

We can buy HPPA. Just not new ones. There are several resellers of
used HPPA gear if someone wants/needs to spend money on it.

Can you list the "various bits and pieces" specifically?

I can then prod the folks I know who might be able to do something about
if they still feel like it.


> [change of order by me below]
> > Also, I'd like to ask HPPA debs be kept in "testing" staging area,
> > just never promoted when the release is cut.  This will let people
> > continue using HPPA without having to suffer with the !hppa breakage
> > that lives in unstable. 
> 
> > (that's all I personally care about - I don't care about "stable"
> > releases.)
> 
> This is one of the major problems for the port. Testing exists to create
> the next stable release. Essentially, testing *is* the next stable,
> except that it's a little volatile for a number of months... :)

Ok.

> > Can we have the minutes for this meeting?
> 
> I'm afraid they're not publicly available, but I will be posting a
> mail to d-d-a real-soon-now(tm), apologies for the delays in this, it
> was a rather full meeting.

Given Debian is non-profit and strives to be transperent in it's operations,
this sounds like a digression in that effort.

I'm not on d-d-a. Can you please CC affected ports? (TIA)

cheers,
grant
