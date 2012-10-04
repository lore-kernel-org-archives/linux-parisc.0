From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: what's parisc execve_wrapper doing in the end?
Date: Thu, 4 Oct 2012 09:30:16 -0400
Message-ID: <CAE2sS1jrFOgwt3xRsnDv5uQ7kYx16vy+nEeK5oGpD3Yd-7fVfQ@mail.gmail.com>
References: <20121004045150.GH23473@ZenIV.linux.org.uk>
	<20121004051359.GA24664@ZenIV.linux.org.uk>
	<1349344936.2706.10.camel@dabdike.int.hansenpartnership.com>
	<20121004122201.GI23473@ZenIV.linux.org.uk>
	<1349355474.2706.21.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1349355474.2706.21.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Oct 4, 2012 at 8:57 AM, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>> Unless I'm missing something really subtle, it looks like HPUX compat had
>> been very noticably broken since at least 2002.  Comments?
>
> I think it probably has.  I don't believe there's anyone left with hpux
> binaries actually checking it.

Was the HPUX support ever completed?

I had HPUX/Linux dual-boot on one of my systems and I was never able
to run an HPUX binary correctly.

Someone with the time and inclination is all that is missing to
cleanup the rotten HPUX bits.

There is no need to keep any of it around, that's what version control is for.

Cheers,
Carlos.
