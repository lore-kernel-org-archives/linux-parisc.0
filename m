From: Luk Claes <luk@debian.org>
Subject: Re: HPPA and Squeeze
Date: Fri, 12 Jun 2009 08:49:26 +0200
Message-ID: <4A31FA76.20103@debian.org>
References: <20090602140734.GC26721@mx0.halon.org.uk> <20090606183600.GA425@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Debian Release <debian-release@lists.debian.org>,
	admin@debian-ports.org, linux-parisc@vger.kernel.org
To: HPPA porters <debian-hppa@lists.debian.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090606183600.GA425@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Grant Grundler wrote:
> +linux-parisc (hppa kernel, compiler and !debian tech forum)
> 
> Neil,
> thanks for the summary. I know this is an unpleasant business in general.
> 
> On Tue, Jun 02, 2009 at 03:07:35PM +0100, Neil McGovern wrote:
>> Hi,
>>
>> As mentioned previously[0], the release team haven't been happy with the
>> state of the HPPA port in Debian. After the release team meeting[1], it
>> has been decided that unfortunatly HPPA will not be supported for
>> Squeeze. This was after careful consideration, and wasn't an easy
>> decision.
>>
>> This means that ftpmasters will be asked to remove HPPA from testing and
>> unstable from the 30th June. It is suggested that HPPA porters may wish
>> to consider using debian-ports.org if they wish to continue with the
>> port.
>>
>> Regards,
>> Neil McGovern
>>
>> [0] http://lists.debian.org/debian-release/2009/04/msg00299.html
> 
> Carlos O'Donnell asked some questions in response to [0] and I never
> saw any response.  Can an attendee of the above meeting please reply
> this email from Carlos?
>
>     http://lists.debian.org/debian-release/2009/04/msg00303.html

Note that it's wrong to assume we will come with the answers. It's an
extra bad feeling we get that even the people that do respond when there
is a request regarding hppa porters don't know what the issues are...

> I also never got a response to my offer here:
>     http://lists.debian.org/debian-release/2009/04/msg00339.html

There was some discussion with DSA and they didn't seem willing to take
the offer as it would be very restricted regarding access and control
(too strongly firewalled if I remember correctly) for our
administrators. It's rather strange that you did not get any feedback in
that regard.

> And my response again to this question posted in [0]:
>> * The machines that host the buildds still seem to have a very
>> unreliable kernel. Is there any update on this?

It looks like the amount of random crashes has decreased and the amount
of random segfaults has increased, though does not look promising after
more than 2 years already of random issues like this.

> Is upstream stable enough for a buildd?  I don't know since I'm not aware
> of any attempts to run a buildd with those kernels.

Rather recent kernels have been tried and like said above seem to behave
better, but still very much subpar.

> Is the answer to that question still germane?
> If so, I'm willing to setup a local buildd and try it. But I will need
> more time and some commitment that if it works, hppa remain in testing
> release (that's all I personally care about - I don't care about "stable"
> releases.)

That's not how it works. testing is the preparation for the next stable
release, so staying in testing means fixing any important outstanding
porting issue and most importantly the random crashes and segfaults,
actively making sure there are no important issues with the hppa port
within Debian and committing to support the next stable release.

> Can we have the minutes for this meeting?

No, I didn't even get the chance myself to read them. A summary of the
minutes will be posted as usual in the next 'Bits from the Release Team'
though.

> Also, I'd like to ask HPPA debs be kept in "testing" staging area,
> just never promoted when the release is cut.  This will let people
> continue using HPPA without having to suffer with the !hppa breakage
> that lives in unstable.

This will get DSA, maintainers, release team and others keep being
frustrated that hppa issues are making their work harder and will only
be tolerated if there will finally be a clear commitment from the hppa
porters to deal with any present and future important porting issue in a
reasonable time frame.

The main problem we have with hppa is that important porter issues are
not dealt with in a reasonable time frame. The random crashes and
segfaults are lasting for years already!

Note that we do *NOT* intend to drop hppa from unstable, it being
mentioned at all was an unfortunate sign of the deep frustration of some...

Cheers

Luk

Debian Release Manager
