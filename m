From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH] parisc: futex: Use same lock set as lws calls
Date: Mon, 17 Oct 2011 23:21:45 -0400
Message-ID: <CADZpyizSBKcyt5VW8DsAvpzgOGZoTDpdpny9tEdsUgxJ2JoNNQ@mail.gmail.com>
References: <20111009204010.GA22374@hiauly1.hia.nrc.ca>
	<20111017152358.GA3518@glitch>
	<CADZpyixDV_OD+YM+u2EMWqY91u_WtGGMM0J3fAofp99q+OWYnA@mail.gmail.com>
	<4E9C6F9E.5000605@bell.net>
	<4E9C9643.6030309@systemhalted.org>
	<4E9C9971.5090806@bell.net>
	<CADZpyix9K0mfbGdDPMA-+D8vgoyTBtakX0K8JS6viVOvHz8Q3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Guy Martin <gmsoft@gentoo.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CADZpyix9K0mfbGdDPMA-+D8vgoyTBtakX0K8JS6viVOvHz8Q3w@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Oct 17, 2011 at 11:01 PM, Carlos O'Donell
<carlos@systemhalted.org> wrote:
> On Mon, Oct 17, 2011 at 5:09 PM, John David Anglin <dave.anglin@bell.net> wrote:
>>> What patch is this? I don't remember it. URL?
>>>
>> http://www.cygwin.com/ml/libc-ports/2010-08/msg00001.html
>
> Thanks! I'll poke at this tomorrow.

I remember what happened here. I championed the idea that this patch
should be generic for all targets, or at least for all of ports.

Guy was good enough to give it a shot but Ulrich shot it down.

Unfortunately the patch lost momentum and I never applied the original.

I've just applied this patch and I'll run it through some testing.

Guy,

Did you eventually get a version that helped just libc-ports avoid
these issues of header duplication?

Cheers,
Carlos.
