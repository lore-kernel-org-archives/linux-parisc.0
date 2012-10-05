From: John David Anglin <dave.anglin@bell.net>
Subject: Re: what's parisc execve_wrapper doing in the end?
Date: Thu, 4 Oct 2012 20:00:18 -0400
Message-ID: <BLU0-SMTP69DACA2770F3C2181A289978B0@phx.gbl>
References: <20121004045150.GH23473@ZenIV.linux.org.uk> <20121004051359.GA24664@ZenIV.linux.org.uk> <1349344936.2706.10.camel@dabdike.int.hansenpartnership.com> <20121004122201.GI23473@ZenIV.linux.org.uk> <1349355474.2706.21.camel@dabdike.int.hansenpartnership.com> <CAE2sS1jrFOgwt3xRsnDv5uQ7kYx16vy+nEeK5oGpD3Yd-7fVfQ@mail.gmail.com> <20121004140759.GK23473@ZenIV.linux.org.uk>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Parisc List <linux-parisc@vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20121004140759.GK23473@ZenIV.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 4-Oct-12, at 10:07 AM, Al Viro wrote:

> On Thu, Oct 04, 2012 at 09:30:16AM -0400, Carlos O'Donell wrote:
>> On Thu, Oct 4, 2012 at 8:57 AM, James Bottomley
>> <James.Bottomley@hansenpartnership.com> wrote:
>>>> Unless I'm missing something really subtle, it looks like HPUX  
>>>> compat had
>>>> been very noticably broken since at least 2002.  Comments?
>>>
>>> I think it probably has.  I don't believe there's anyone left with  
>>> hpux
>>> binaries actually checking it.
>>
>> Was the HPUX support ever completed?
>>
>> I had HPUX/Linux dual-boot on one of my systems and I was never able
>> to run an HPUX binary correctly.
>>
>> Someone with the time and inclination is all that is missing to
>> cleanup the rotten HPUX bits.
>>
>> There is no need to keep any of it around, that's what version  
>> control is for.
>
> FWIW, parisc seems to be the last architecture to keep such thing -  
> sparc
> and mips had dropped SunOS/Solaris/IRIX compat, iBCS* is long-dead  
> (and hadn't
> been in mainline kernel anyway).  Alpha might still be able to run  
> some OSF
> binaries, but there the situation is different - no alternative  
> syscall
> entry codepath, Linux just uses the same ABI and shares syscall  
> numbers
> where possible...


I believe the HP-UX support should be removed.

I think it unlikely that anyone will complete the HP-UX  
implementation.  For example,
HP-UX has a 64-bit context for 32-bit applications when running a wide  
PA2.0
kernel.  Linux only has a 32-bit context.  As a result, it's not  
possible to exploit the 64-bit
registers and instructions in Linux.  We also don't have a 64-bit  
linux port, so 64-bit HP-UX
support is impossible.  There are quite a few other issues.

Dave
--
John David Anglin	dave.anglin@bell.net



