Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA19692
	for <parisc-linux@puffin.external.hp.com>; Tue, 11 Jul 2000 04:26:52 -0600
Received: from nlsols1.ats.nld.alcatel.nl (localhost [127.0.0.1])
	by relay1.alcatel.be (8.10.1/8.10.1) with ESMTP id e6BASEr23163
	for <parisc-linux@thepuffingroup.com>; Tue, 11 Jul 2000 12:28:15 +0200 (MET DST)
Sender: beerse@ats.nld.alcatel.nl
Message-ID: <396AF45B.36A2ED04@ats.nld.alcatel.nl>
Date: Tue, 11 Jul 2000 12:18:03 +0200
From: Corne Beerse <beerse@ats.nld.alcatel.nl>
MIME-Version: 1.0
To: David Huggins-Daines <dhd@linuxcare.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Architecture string change
References: <87og45bqxh.fsf@linuxcare.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

David Huggins-Daines wrote:
> 
> Hi,
> 
> In keeping with the way things are done on other Linux platforms, I
> would like us to start using the following architecture strings for
> configuring our compilers:
> 
> 32-bit userland and kernel, PA1.1: hppa-linux
> 64-bit kernel, PA2.0:              hppa64-linux
> 
> I guess this means that I volunteer to update the recipes on the
> website :-)
> 
> config.guess will return a more detailed string, such as
> 'hppa2.0-unknown-linux-gnu', but these should be the canonical,
> lowest-common-denominator strings.  In particular, we should revise
> the recipes and such to use them and configure dpkg-architecture to
> set DEB_GNU_HOST_ARCH to 'hppa-linux'.
> 
> I have not been able to get a solid answer out of anyone regarding
> whether it is possible or desireable to use 'parisc-' instead of
> 'hppa-', so I will leave it as 'hppa' for the time being.  It is easy
> enough to make 'parisc' an alias for 'hppa' if we want to.
> 
> Some pros and cons of using 'parisc' vs. 'hppa':
> 
>  * Pro: hppa*-linux targets produce very different 32-bit object code,
>    as well as different 64-bit assembly code, so it may be beneficial
>    to distinguish them from other PA-RISC targets.
> 
>  * Pro: I'm told that people at HP want to use 'parisc'.  Could those
>    people please stand up :-)
> 
>  * Con: config.guess [1] will presumably return hppa*-*-linux-gnu.
> 
>  * Con: Every other operating system on PA-RISC uses hppa*-*-*.
> 
> (I know there are some more but I can't think of them right now)
> 
> Please remember that, now that we are entering userspace, any
> decisions of this sort that we make are going to stick with us
> forever. [2]
> 
>>>>>> details on [1] and [2] removed <<<<<<<<<<<<<

My 2 cents on this architecture string:
I see the string contains 4 fields. For other linux implementations, what do
these fields mean? From what I see of it, is it:
<processorfamily>-<supplier>-<operatingsystem>-<???> ??

For the processorfamily, I would say 'parisk', without the HP in the name.
That's for the next field: it is an HP processor.

Compare it with the use on other platforms: For the base PC, it would be
i386-intel-linux-gnu or i386-amd-linux-gnu if there is difference between
the 2 i386 processors between intel and linux which makes a difference in
the configuration. If there is no difference between intel and amd at this
level, leave the supplier as unknown. For the 80386 type processors, there
is no difference to linux, hence: i386-unknown-linux-gnu. For the i686 type
processors it would be i686-intel-linux-gnu for Intels pentiumII and
i686-amd-linux-gnu for the amds K6.

How is it done on other platforms as the sparc, alpha and i386?



CB



-- 
RAM = Rarely Adequate Memory
Corne' Beerse					| Alcatel Telecom Nederland
mailto:beerse@ats.nld.alcatel.nl		| Postbus 3292
talkto:+31(70)3079108 faxto:+31(70)3079191	| NL-2280 GG  Rijswijk
