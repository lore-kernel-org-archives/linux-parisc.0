From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH] parisc: futex: Use same lock set as lws calls
Date: Tue, 18 Oct 2011 17:22:07 -0400
Message-ID: <CADZpyixUDF-BjHHSTt4Eb_TFYX5hjBz4cuxUx0Lxc7bjMyDg9g@mail.gmail.com>
References: <20111009204010.GA22374@hiauly1.hia.nrc.ca>
	<20111017152358.GA3518@glitch>
	<CADZpyixDV_OD+YM+u2EMWqY91u_WtGGMM0J3fAofp99q+OWYnA@mail.gmail.com>
	<4E9C6F9E.5000605@bell.net>
	<4E9C9643.6030309@systemhalted.org>
	<4E9C9971.5090806@bell.net>
	<CADZpyix9K0mfbGdDPMA-+D8vgoyTBtakX0K8JS6viVOvHz8Q3w@mail.gmail.com>
	<CADZpyizSBKcyt5VW8DsAvpzgOGZoTDpdpny9tEdsUgxJ2JoNNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Guy Martin <gmsoft@gentoo.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CADZpyizSBKcyt5VW8DsAvpzgOGZoTDpdpny9tEdsUgxJ2JoNNQ@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Oct 17, 2011 at 11:21 PM, Carlos O'Donell
<carlos@systemhalted.org> wrote:
> On Mon, Oct 17, 2011 at 11:01 PM, Carlos O'Donell
> <carlos@systemhalted.org> wrote:
>> On Mon, Oct 17, 2011 at 5:09 PM, John David Anglin <dave.anglin@bell.net> wrote:
>>>> What patch is this? I don't remember it. URL?
>>>>
>>> http://www.cygwin.com/ml/libc-ports/2010-08/msg00001.html
>>
>> Thanks! I'll poke at this tomorrow.
> I've just applied this patch and I'll run it through some testing.

I've verified it matches what we have in the kernel.

I've verified that a make install-headers puts the right headers in
the right locations.

If some final testing looks good I'll commit these patches for hppa in
libc-ports with an an additional Tested-By: for my testing.

Cheers,
Carlos.
