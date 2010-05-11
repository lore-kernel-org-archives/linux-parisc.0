From: Helge Deller <deller@gmx.de>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Tue, 11 May 2010 22:44:03 +0200
Message-ID: <4BE9C193.5040303@gmx.de>
References: <20100412214118.46D925160@hiauly1.hia.nrc.ca> <20100413115501.307040@gmx.net> <20100419162653.GA106@hiauly1.hia.nrc.ca> <4BCDEB6E.1060408@gmx.de> <20100509124339.GA6797@hiauly1.hia.nrc.ca> <20100510095632.173760@gmx.net> <20100510145648.GA13452@hiauly1.hia.nrc.ca> <4BE85C82.4080202@gmx.de> <20100510210711.GA15723@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	carlos@systemhalted.org, gniibe@fsij.org,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100510210711.GA15723@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 05/10/2010 11:07 PM, John David Anglin wrote:
> If you find the location of the hpmc is in code modified by change,
> that would be useful information.  Possibly, there is an issue with
> the pdtlb,l instruction.

Sadly I don't have any more info than this:

High Priority Machine Check (HPMC): Code=1 regs=106f5080 (Addr=00000000)

Kernel panic - not syncing: High Priority Machine Check (HPMC)

Backtrace:

 [<1011ebc4>] show_stack+0x18/0x28

 [<10117b90>] dump_stack+0x1c/0x2c

 [<10117c18>] panic+0x78/0x1e8

 [<1011f134>] parisc_terminate+0xe4/0xfc

 [<1011f504>] handle_interruption+0x1f0/0x730

 [<10103078>] intr_check_sig+0x0/0x40


The second time the kernel did booted without problems, even though
I didn't changed anything.

Helge
