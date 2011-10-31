From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: futex: Use same lock set as lws calls
Date: Sun, 30 Oct 2011 21:36:05 -0400
Message-ID: <BLU0-SMTP39F6756368C783FB821D4297D60@phx.gbl>
References: <20111009204010.GA22374@hiauly1.hia.nrc.ca> <CADZpyizJwcEFNLZyhd74wDyFvrgNpD6j+2cRhjR7ZkL0xTWAgA@mail.gmail.com> <BLU0-SMTP13C59771871C90183AFBCB97D10@phx.gbl> <2746859.nK5NlKbf2R@donald.sf-tec.de> <BLU0-SMTP8183F951B80BB9F5455EB297D10@phx.gbl> <CADZpyizsC-eSgCSyK52-Ns12z+mWUpFB8JH2dC2C7J_3EnGR5Q@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CADZpyizsC-eSgCSyK52-Ns12z+mWUpFB8JH2dC2C7J_3EnGR5Q@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 30-Oct-11, at 8:21 PM, Carlos O'Donell wrote:

> On Sun, Oct 30, 2011 at 12:13 PM, John David Anglin
> <dave.anglin@bell.net> wrote:
>> On 30-Oct-11, at 11:31 AM, Rolf Eike Beer wrote:
>>
>>> John David Anglin wrote:
>>>
>>>> This problem is fixed in the GCC trunk and 4.4, 4.5 and 4.6  
>>>> branches.
>>>> libmpfr4-3.1.0 now passes all tests.
>>>
>>> Can we get a link to a bug or a commit so we could easily put this  
>>> into
>>> the
>>> gentoo patchset for local usage until a new version is released?
>>
>>
>> The trunk patch is on the gcc-patches list:
>> http://gcc.gnu.org/ml/gcc-patches/2011-10/msg02758.html
>>
>> There are two variants of the patch:
>> http://gcc.gnu.org/viewcvs?view=revision&revision=180655
>> http://gcc.gnu.org/viewcvs?view=revision&revision=180662
>>
>> The first is for 4.7.  The latter applies to 4.4, 4.5 and 4.6.
>
> Awesome! Great work Dave! :-)

Thanks, but this fix wasn't that hard...  I had a little trouble with  
the testing
due to other issues.  Many GCC bugs are much harder.  Things are easy
when the compilation bug is clear.

I integrated Guy's patch into debian 2.13-10 today and I was going to do
a build, but then I discovered it builds using 4.4.  So, I patched 4.4  
with the
above change, and will rebuild 2.13 when it's done.  Hopefully, this  
will
fix the udev bug which is blocking many python builds.  I'm interested  
to
see if the glibc testsuite results will be better.

It's a bit unclear how extensively TLS variables are used, but maybe  
fixing
this will make it easier to resolve the remaining pthread bugs.

I've been wondering how much is left to install to glibc head?

Dave
--
John David Anglin	dave.anglin@bell.net



