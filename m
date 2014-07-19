From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Implementing 64bit atomic gcc built-ins
Date: Fri, 18 Jul 2014 20:30:35 -0400
Message-ID: <BLU436-SMTP1543CF527E5DA5476D4B7A997F20@phx.gbl>
References: <e85c925befea4de68fe6f0d292300eee@tuxicoman.be> <1405545383.3165.34.camel@dabdike.int.hansenpartnership.com> <CAE2sS1i8ncnP135uKo1w6+S_JHV6T6_7mR9Pj-jzt9Wk-s_JQw@mail.gmail.com> <f6a350becc52f31a47a279ea1c557c54@tuxicoman.be>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <f6a350becc52f31a47a279ea1c557c54@tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 17-Jul-14, at 4:44 AM, Guy Martin wrote:

> Reviewing HPPA 1.1 specs, I see that the FPU has 64bit registers.
> Can't we use those registers to perform 64bit atomic load and store ?
>
> As far as I can see, FLDDX and FSTDX should be able to do the job.
> Unless there is something I'm missing about the FPU :)

The main inefficiency is that one needs to copy a value through memory  
to
get a value in a general register into a floating point register,  
etc.  Probably,
for this technique, it would be most efficient to pass the values in  
floating
point registers.

Most people are running PA 2.0 machines now and these have 64-bit  
registers
and 64-bit loads and stores.  Problem is we don't have a proper 64-bit  
context
on these machines like hpux.  So, we don't save/restore everything on an
interruption.  However, it might be possible to use 64-bit operations  
in the region
where interrupts are disabled.  Note that interruptions are still  
possible in this
region but it might be we don't care about the values in this case.

Dave
--
John David Anglin	dave.anglin@bell.net



