Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tyke.pjc.net (public1-leed3-5-cust141.leed.broadband.ntl.com [80.0.5.141])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8FE96482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 May 2002 10:24:40 -0600 (MDT)
Date: Wed, 29 May 2002 17:24:38 +0100
From: Patrick Caulfield <patrick@tykepenguin.com>
To: parisc-linux@lists.parisc-linux.org
Cc: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] kdb_v21 branch updated to -pa26, and kallsyms cross-compile
Message-ID: <20020529162438.GJ9919@tykepenguin.com>
References: <20020527001321.A6629@systemhalted> <20020528142736.GA9288@tykepenguin.com> <20020528132933.B31214@systemhalted> <20020529075131.GC9919@tykepenguin.com> <20020529082107.A2794@systemhalted> <20020529141231.GG9919@tykepenguin.com> <20020529110118.A3691@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
In-Reply-To: <20020529110118.A3691@systemhalted>
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

On Wed, May 29, 2002 at 11:01:18AM -0400, Carlos O'Donell Jr. wrote:
> >
> 
> You can't always copy a .config from kernel to kernel. The kernel source
> dictates what will be _in_ the .config. I usually run 'make mrproper'
> and then have 'make oldconfig' or 'make ???config' recreate the config files
> to suit the material in the kernel.
> 
> When switching to a new source tree I recommend:
> make mrproper
> make oldconfig
> make menuconfig (to suit your tastes)

Oh, I'm doing that. I just tried it again, it was either that or throw it out
of the window.

Is there parisc version of the kdb patch I could try applying to a kernel
source I know works maybe ?

> As for the endless 'Stack pointer and cr30 do not correspond!'....
> 
> I believe that is a bug in traps.c and I have code to give a proper dump.
> I haven't been able to get anyone who knows to explain how the dump_stack in 
> traps should _really_ work :)

Thanks, I'll try that out.
 
> AFAI understand the following works (I've tested it on my kernels with what 
> looks to be a successfull dump while doing some bad things (props to Bame
> for helping me out) ;)
> 
> BTW, what led me to this solution is that the printk in the else is
> completely bogus... so I rewrote the else.
> 
> Q: When do you get 'Stack pointer and cr30 do not correspond'?

When it hits my buggy code :-) 

patrick
