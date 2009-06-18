From: Luk Claes <luk@debian.org>
Subject: Re: HPPA and Squeeze
Date: Thu, 18 Jun 2009 20:16:59 +0200
Message-ID: <4A3A849B.2020702@debian.org>
References: <20090618013510.0484B4FE2@hiauly1.hia.nrc.ca>	 <4A39DFAA.30803@debian.org> <7d01f9f00906180316t1ec13cb2h435d77fefd3cc3d7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	debian-hppa@lists.debian.org, debian-release@lists.debian.org,
	linux-parisc@vger.kernel.org
To: Thibaut VARENE <varenet@debian.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <7d01f9f00906180316t1ec13cb2h435d77fefd3cc3d7@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Thibaut VARENE wrote:
> On Thu, Jun 18, 2009 at 8:33 AM, Luk Claes<luk@debian.org> wrote:
>> John David Anglin wrote:
>>>> Grant Grundler schrieb:
>>>>> On Fri, Jun 12, 2009 at 08:49:26AM +0200, Luk Claes wrote:
>>>>>> Grant Grundler wrote:
>>> I can understand the desire to trim architectures.  However, it's clear
>>> the current decision was based on some misinformation, and an unclear
>>> rational.
>> There is no desire to trim working architectures.
>>
>> It's very easy to tell there is nothing wrong when you don't have to
>> deal with unreliable build daemons, endless discussions but no visible
>> progress (except for java support) and complaints from DSA, package
>> maintainers and others.
> 
> I'm sorry, but this thread is now over 2 weeks old and we yet have to
> see a *rationale* motivating the current decision. Not some claims
> about bugs (which we still haven't been pointed at, except for the
> ruby one, which we addressed already) affecting the buildds (and that
> only you experience). Speaking of which, I'm not aware of any problem
> affecting lafayette...

lafayette is only doing non-sid to make sure we have a buildd that is
not heavy loaded and very probable to be able to build all security and
stable/oldstable updates...

> We have given you tangible elements and have answered each and every
> questions that have been raised in this thread. The release team, on
> the other hand, failed to answer the single question we've been
> asking: what's the rationale for dropping parisc?

Please read again, it's only in the beginning of the mail...

> I joined Debian many years ago because it seemed to me that it had
> proper ethics, in particular because decisions were taken
> transparently, and were properly - and openly - discussed before
> anything final was settled. I too have invested time and money into
> the project. I'm extremely disappointed with the handling of the issue
> at stake here.

I'm very disappointed at the hppa porters attitudes I must say. They
talk a lot, they assumingly work a lot behind the scenes, but they don't
seem to know what issues there are within the project nor is there any
visible progress unless we prod very hard and even then they are more
worried about the way we prod than about proving they are worthy to
support the port and show some real progress...

> Again, I would like to see a comprehensive rationale for this
> decision, so that we can at least try to address the problems at hands
> and hope for re-inclusion after squeeze. BTW, can you clarify whether
> that would be an option?

It's still an option to stay in squeeze like I told before, but we want
a clear sign that the port will be supported throughout the whole
release cycle (which honestly looks more and more like it could be the
case, though I still fail to see why randomly crashing and segfaulting
buildds and decreasing support for programming languages before Lenny
was not seen as critical enough).

Cheers

Luk
