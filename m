From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: PARISC Linux website and status update
Date: Wed, 24 Apr 2013 15:33:51 -0400
Message-ID: <CAE2sS1iCgWcEYcau8d38J7coiB8usVmv_z1wfU8YnYtN1FJJkg@mail.gmail.com>
References: <5171B347.6070600@gmx.de>
	<13691126.u1dAREQ1nW@donald.sf-tec.de>
	<CA+DQjFhDcf09ZD9SvWvX95hu1hDd-T33YV-ipAzCNr5Se-dDKw@mail.gmail.com>
	<51729CA4.2060008@gmx.de>
	<CAE2sS1gDFqtvsk3hUoKNQJ6vSTurhhx5BNNC3iLbUnq_67Xu+Q@mail.gmail.com>
	<5177E29E.1040505@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Helge Deller <deller@gmx.de>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	"debian-hppa@lists.debian.org" <debian-hppa@lists.debian.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5177E29E.1040505@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Apr 24, 2013 at 9:48 AM, John David Anglin <dave.anglin@bell.net> wrote:
> On 4/24/2013 9:18 AM, Carlos O'Donell wrote:
>>
>> On Sat, Apr 20, 2013 at 9:48 AM, Helge Deller <deller@gmx.de> wrote:
>>>
>>> So, sorry for forgetting to mention GENTOO LINUX on the website!
>>> I've fixed it now (please wait one hour until the cron job activates the
>>> changes).
>>
>> I'm using Gentoo for all my hppa hacking right now since I wanted to
>> focus on toolchain issues rather than distribution issues :/
>
> I have to say one learns a lot about toolchain issues building a
> distribution...

Absolutely. That doesn't detract from needing a stable environment
to build and test with, which gentoo provides.

> Have you played with mysql-5.5?  Testsuite appears to show some
> glibc problems (pthread_cond_timedwait).  Thoughts?

What glibc version?

We use the generic pthread_cond_timedwait implementation.

The only thought I have is that pthread_cond_timedwait in master
might try to use PI-aware mutexes and we haven't had much testing
of the PI support in hppa. So there might be some issues to review
there. I'll run the mysql-5.5 testsuite to try validate some of the
cleanup I have planned.

Cheers,
Carlos.
