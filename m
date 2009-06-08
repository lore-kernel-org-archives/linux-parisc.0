From: Neil McGovern <maulkin@halon.org.uk>
Subject: Re: HPPA and Squeeze
Date: Mon, 8 Jun 2009 22:26:06 +0100
Message-ID: <20090608212606.GC19894@halon.org.uk>
References: <20090602140734.GC26721@mx0.halon.org.uk> <20090606183600.GA425@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: HPPA porters <debian-hppa@lists.debian.org>,
	linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <20090606183600.GA425@lackof.org>
Resent-Message-ID: <YkDrzzVsh4I.A.HtC.4WYLKB@liszt>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

Firstly, thanks for your mail, apologies that I haven't replied sooner,
we've had EU and local elections, so I've been busy runnign around with
leaflets, knocking on doors, kissing babies etc. like any politician. No
expenses though...

On Sat, Jun 06, 2009 at 12:36:01PM -0600, Grant Grundler wrote:
> Carlos O'Donnell asked some questions in response to [0] and I never
> saw any response.  Can an attendee of the above meeting please reply
> this email from Carlos?
>     http://lists.debian.org/debian-release/2009/04/msg00303.html
> 

I'm not sure what replies you'd like... there's certainly been some
follow ups to that mail.

> I also never got a response to my offer here:
>     http://lists.debian.org/debian-release/2009/04/msg00339.html
> 

Indeed, and that's worrying. I would have expected a HPPA porter (if
indeed one still exists) to have replied to that.

> Quite a few serious hppa specific bugs have been fixed upstream over
> the past 6 months. This is worth revisiting.
> 
> Is upstream stable enough for a buildd?  I don't know since I'm not aware
> of any attempts to run a buildd with those kernels.
> 

Neither do we, we're not HPPA porters :)
We did go through this before with newer kernels, and it didn't help
FWIW.

> Is the answer to that question still germane?

Ish. We still have the issue that you can't actually buy HPPAs any more,
and various bits and pieces from the Arch Requalification list.

[change of order by me below]
> Also, I'd like to ask HPPA debs be kept in "testing" staging area,
> just never promoted when the release is cut.  This will let people
> continue using HPPA without having to suffer with the !hppa breakage
> that lives in unstable. 

> (that's all I personally care about - I don't care about "stable"
> releases.)

This is one of the major problems for the port. Testing exists to create
the next stable release. Essentially, testing *is* the next stable,
except that it's a little volatile for a number of months... :)

> Can we have the minutes for this meeting?

I'm afraid they're not publicly available, but I will be posting a
mail to d-d-a real-soon-now(tm), apologies for the delays in this, it
was a rather full meeting.

Hope this helps,
Neil
-- 
A. Because it breaks the logical sequence of discussion
Q. Why is top posting bad?
gpg key - http://www.halon.org.uk/pubkey.txt ; the.earth.li A40F862E
