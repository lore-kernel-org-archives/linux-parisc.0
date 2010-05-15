From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: futex.c and EWOULDBLOCK vs. EAGAIN patch
Date: Sat, 15 May 2010 07:24:54 -0400
Message-ID: <AANLkTil6dX7fq-1R0pyjp5XHLyuQyGwcuB1Q9FG8gqGS@mail.gmail.com>
References: <4BE86174.1080008@gmx.de> <20100514192015.GB14840@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100514192015.GB14840@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, May 14, 2010 at 3:20 PM, Grant Grundler
<grundler@parisc-linux.org> wrote:
> On Mon, May 10, 2010 at 09:41:40PM +0200, Helge Deller wrote:
>> Since PARISC is the only Linux architecture which has different values
>> for EAGAIN and EWOULDBLOCK, we are running in various issues.
>>
>> One of them is, that e.g. glibc checks for EAGAIN instead of EWOULDBLOCK
>> (and vise versa) in nptl/pthread_mutex_trylock.c. This doesn't hurt
>> other architectures, but it hurts parisc.
>>
>> I was planning to send the patch below to linux kernel mailing list.
>> But before I do it, I would like to get feedback from the kernel
>> hackers here on the list.
>>
>> What do you think?
>
> Do it.
> We kept them distinct to enable support for HPUX binaries.
> This is never going to happen.

Grant, does this mean you endorse purging the kernel of all uses of
EWOULDBLOCK (with the exception of the header file used by userspace)?

FWIW I think this is the right approach.

>> Is this patch useful?
>
> Yes.
>
>> Or will people just call me an idiot if I ask if this patch could be applied?
>> If you think it's useful, maybe another patch description would be more appropriate?
>
> Could we just equate like other arcthitectures so the kernel only ever
> returns one of those and not both?

There are ABI issues that I would like to discuss before you send your
patch upstream.

Once you change the kernel EWOULDBLOCK to be equal to EAGAIN, you have
broken the ABI.

A kernel syscall that used to return EWOULDBLOCK, now returns EAGAIN.

An application that checked only for EWOULDBLOCK might fail now that
EAGAIN is being returned.

Is this a concern? I don't think it is. The POSIX standard, in all
cases I could find, says the functions return "EAGAIN or EWOULDBLOCK",
meaning that a conforming program must check for both.

The alternative to Helge's patch is a glibc patch to check the return
of *every* syscall and convert EWOULDBLOCK to EAGAIN. This approach
has a cost to our syscall fast path. Therefore I am not as inclined to
follow this approach.

Cheers,
Carlos.
