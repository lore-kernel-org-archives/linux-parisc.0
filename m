From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] parisc: futex: Use same lock set as lws calls
Date: Thu, 20 Oct 2011 14:16:47 -0400
Message-ID: <CAEdQ38E+4qpL+wPjWPJEQVTXGiMP4ei5vjGxfZtTJZieNUb2hg@mail.gmail.com>
References: <20111009204010.GA22374@hiauly1.hia.nrc.ca> <20111017152358.GA3518@glitch>
 <CADZpyixDV_OD+YM+u2EMWqY91u_WtGGMM0J3fAofp99q+OWYnA@mail.gmail.com>
 <4E9C6F9E.5000605@bell.net> <4E9C9643.6030309@systemhalted.org>
 <4E9C9971.5090806@bell.net> <CADZpyiwUje+SFG_jhBd=w5ezA6w9onVYQWwE3dvg6bQDH9H+3Q@mail.gmail.com>
 <CAEdQ38HicVKub3DAv2CggtMMzgNVKJ4v9PonTbAyRTHQtY_VaA@mail.gmail.com> <4EA06459.2030704@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: John David Anglin <dave.anglin@bell.net>,
	debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Guy Martin <gmsoft@gentoo.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4EA06459.2030704@systemhalted.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Oct 20, 2011 at 2:11 PM, Carlos O'Donell
<carlos@systemhalted.org> wrote:
> On 10/20/2011 1:57 PM, Matt Turner wrote:
>> On Thu, Oct 20, 2011 at 11:35 AM, Carlos O'Donell
>> <carlos@systemhalted.org> wrote:
>>> On Mon, Oct 17, 2011 at 5:09 PM, John David Anglin <dave.anglin@bell.net> wrote:
>>>>> What patch is this? I don't remember it. URL?
>>>>>
>>>> http://www.cygwin.com/ml/libc-ports/2010-08/msg00001.html
>>>
>>> This patch is now checked into glibc-ports.
>>
>> The authorship is wrong, I think. Guy wrote the patch, didn't he?
>
> Correct, I forgot to use --author, but Guy is credited in the ChangeLog.
>
> Can I change this retroactively or is it too late?
>
> Cheers,
> Carlos.

Once it's pushed to a public git repo it's too late.

This also happened last year,
http://www.cygwin.com/ml/libc-ports/2010-02/msg00014.html

Most people use `git am` which fills in the author field directly.
Otherwise, use git commit --author=... or after the patch it committed
but before it's pushed publicly, git commit --amend --author=...

Matt
