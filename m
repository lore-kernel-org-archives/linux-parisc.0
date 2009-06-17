From: Matthias Klose <doko@debian.org>
Subject: Re: HPPA and Squeeze
Date: Thu, 18 Jun 2009 01:54:36 +0200
Message-ID: <4A39823C.8070104@debian.org>
References: <20090602140734.GC26721@mx0.halon.org.uk> <20090606183600.GA425@lackof.org> <4A31FA76.20103@debian.org> <20090615173102.GC2690@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Luk Claes <luk@debian.org>,
	HPPA porters <debian-hppa@lists.debian.org>,
	Debian Release <debian-release@lists.debian.org>,
	admin@debian-ports.org, linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090615173102.GC2690@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Grant Grundler schrieb:
> On Fri, Jun 12, 2009 at 08:49:26AM +0200, Luk Claes wrote:
>> Grant Grundler wrote:
>>> +linux-parisc (hppa kernel, compiler and !debian tech forum)
>>>
>>> Neil,
>>> thanks for the summary. I know this is an unpleasant business in general.
>>>
>>> On Tue, Jun 02, 2009 at 03:07:35PM +0100, Neil McGovern wrote:
>>>> Hi,
>>>>
>>>> As mentioned previously[0], the release team haven't been happy with the
>>>> state of the HPPA port in Debian. After the release team meeting[1], it
>>>> has been decided that unfortunatly HPPA will not be supported for
>>>> Squeeze. This was after careful consideration, and wasn't an easy
>>>> decision.
>>>>
>>>> This means that ftpmasters will be asked to remove HPPA from testing and
>>>> unstable from the 30th June. It is suggested that HPPA porters may wish
>>>> to consider using debian-ports.org if they wish to continue with the
>>>> port.
>>>>
>>>> Regards,
>>>> Neil McGovern
>>>>
>>>> [0] http://lists.debian.org/debian-release/2009/04/msg00299.html
>>> Carlos O'Donnell asked some questions in response to [0] and I never
>>> saw any response.  Can an attendee of the above meeting please reply
>>> this email from Carlos?
>>>
>>>     http://lists.debian.org/debian-release/2009/04/msg00303.html
>> Note that it's wrong to assume we will come with the answers.
> 
> I was expecting a summary of specific issues from an organization
> that claims to operate transperently.  The hand waving is easy. But
> doesn't resolve problems and doesn't meet my expectation of an "open"
> organization that I've donated money, time, and materials to.

+1. dropping hppa as a release architecture was not communicated by the release
team at all.  I did spend some time to get gcj / default-jdk working on hppa,
and some money (buying a new disk for a hppa machine) to help this port.  The
time and the money could have spent better, if d-r would have better
communicated about their intent.

hppa is not in a good shape, but there are other architectures which are not
better (sparc, mips*) from a toolchain point of view. what about these?

there are issues pointed out and not addressed like the -dev / -headers packages
 built as binary independent packages just to save disk space, which have an
impact on "slow" architectures, and which are not addressed by the release team.
would the release team mind addressing these real issues, or should we drop
"slow" architectures as well?

  Matthias

