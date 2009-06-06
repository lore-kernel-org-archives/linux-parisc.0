From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: HPPA and Squeeze
Date: Sat, 6 Jun 2009 12:36:01 -0600
Message-ID: <20090606183600.GA425@lackof.org>
References: <20090602140734.GC26721@mx0.halon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: HPPA porters <debian-hppa@lists.debian.org>,
	admin@debian-ports.org, linux-parisc@vger.kernel.org
To: Neil McGovern <neilm@debian.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090602140734.GC26721@mx0.halon.org.uk>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

+linux-parisc (hppa kernel, compiler and !debian tech forum)

Neil,
thanks for the summary. I know this is an unpleasant business in general.

On Tue, Jun 02, 2009 at 03:07:35PM +0100, Neil McGovern wrote:
> Hi,
> 
> As mentioned previously[0], the release team haven't been happy with the
> state of the HPPA port in Debian. After the release team meeting[1], it
> has been decided that unfortunatly HPPA will not be supported for
> Squeeze. This was after careful consideration, and wasn't an easy
> decision.
> 
> This means that ftpmasters will be asked to remove HPPA from testing and
> unstable from the 30th June. It is suggested that HPPA porters may wish
> to consider using debian-ports.org if they wish to continue with the
> port.
> 
> Regards,
> Neil McGovern
> 
> [0] http://lists.debian.org/debian-release/2009/04/msg00299.html

Carlos O'Donnell asked some questions in response to [0] and I never
saw any response.  Can an attendee of the above meeting please reply
this email from Carlos?
    http://lists.debian.org/debian-release/2009/04/msg00303.html

I also never got a response to my offer here:
    http://lists.debian.org/debian-release/2009/04/msg00339.html


And my response again to this question posted in [0]:
> * The machines that host the buildds still seem to have a very
> unreliable kernel. Is there any update on this?

Quite a few serious hppa specific bugs have been fixed upstream over
the past 6 months. This is worth revisiting.

Is upstream stable enough for a buildd?  I don't know since I'm not aware
of any attempts to run a buildd with those kernels.

Is the answer to that question still germane?
If so, I'm willing to setup a local buildd and try it. But I will need
more time and some commitment that if it works, hppa remain in testing
release (that's all I personally care about - I don't care about "stable"
releases.)


> [1] http://lists.debian.org/debian-project/2009/05/msg00080.html

Can we have the minutes for this meeting?

Also, I'd like to ask HPPA debs be kept in "testing" staging area,
just never promoted when the release is cut.  This will let people
continue using HPPA without having to suffer with the !hppa breakage
that lives in unstable.

thanks,
grant
