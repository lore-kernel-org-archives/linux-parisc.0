Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Duraid Madina <Duraid@unsw.edu.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] shiny new rp2430 (A400) won't boot :-( 
In-Reply-To: Message from Duraid Madina <Duraid@unsw.edu.au>
   of "Wed, 10 Apr 2002 14:53:32 +1000." <200204100453.g3A4rWV04513@parallel.hpc.unsw.edu.au>
References: <200204100453.g3A4rWV04513@parallel.hpc.unsw.edu.au> 
Date: Tue, 09 Apr 2002 23:24:12 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020410052412.B6F9E4832@dsl2.external.hp.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Duraid Madina wrote:
> Hi all,
> 
> 	My nice new rp2430 (looks like an A400, but has a PA-8700 at 650MHz
> inside, not sure if this is the only difference..) arrived this morning.

uhm...it *is* an A-class - see the model string ;^)

> 	Unfortunately, it doesn't boot!

Right - we have some general issue with PA8700. J6700 doesn't boot either.
While Thomas Bogendoerf was at a recent show (CeBIT?), he had access to
a J6700 to work on. Thomas concluded it was a DMA issue but I couldn't
figure out what exactly. One PA8700/Astro interaction bug workaround was
committed to CVS but I'm convinced that wasn't the issue.

> 	For the record, as soon as I power on this system, the 'Attention'
> and 'Fault' lights flash, but I have no idea if this is normal, or if not,
> why they're flashing.

It's normal because no one has written the PAT PDC code to update
chassis logs/leds. Since I'm rarely in the computer room where my
A500 lives, it's never bothered me.

> 	A transcript of the boot session is attached. I hope someone can
> help me out here!
...
>    Model: hp server rp2430 (model string 9000/800/A400-6X)


hehe...some things don't change despite marketing's efforts to
confuse people.

> 
> PROCESSOR INFORMATION
> 
>                        HVERSION  SVERSION              Processor
>   Processor   Speed     Model    Model/Op  CVERSION      State
>   ---------  --------  --------  --------  --------  -------------
>       0      650  MHz   0x05e1    0x0491     2.  3   Active               

Only 2.2 CPU had interaction problems with Astro.

....
> Linux version 2.4.9-64 (root@paer) (gcc version 3.0) #1 Fri Nov 30 20:18:56
> MST 2001
...
> Check Chassis and Console Logs for error messages.
> 
> 0x0000007000FF6292 000000F0 F0000000 - type  0 = Data Field Unused
> 0x5800087000FF6292 00006603 0A041F29 - type 11 = Timestamp 04/10/2002

This is an HPMC. HW didn't like something and died.


> P.S. I believe that *once* (assuming I wasn't dreaming) the above firmware
> 'SYSTEM ALERT' message didn't appear - instead, Linux, having gotten to the
> same point (sym53c875...) simply hung. I made a point of waiting quite some
> time (thinking perhaps the hard drive was taking its sweet time powering up)
> so I'm pretty sure it really was 'hung.'

It's possible whatever "normally" cause the HPMC simpled wedged up the
system in a way that didn't cause anything to go fatal.
I suspect the same problem is still occurring.

> P.P.S. When I turn my system on, the 'Power' and 'Remote' LEDs glow solid,
> but the 'Run', 'Attention' and 'Fault' lights also flash, until the 'SYSTEM
> ALERT' appears, at which point the 'Run' light goes dark. Any ideas?

It's the state that the firmware left it in. I'm pretty sure
linux doesn't do anything with them.

grant
