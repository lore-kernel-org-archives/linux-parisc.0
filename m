From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: Short notice: ipmi_si kills C8000
Date: Mon, 28 Oct 2013 11:56:12 +0100
Message-ID: <20131028105612.GB19852@alpha.franken.de>
References: <2698496.oieJ4Vatqf@caliban.sf-tec.de>
 <20131026191720.5282c0c3@marga.jer-c2.orkz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, Rolf Eike Beer <eike@sf-mail.de>
To: Jeroen Roovers <jer@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20131026191720.5282c0c3@marga.jer-c2.orkz.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Oct 26, 2013 at 07:17:20PM +0200, Jeroen Roovers wrote:
> > I did "modprobe ipmi_si" on my C8000 (kernel 3.11.6), which
> > immediately broke the machine. I have no backtrace yet, but I'll try
> > to get one next week. In case someone has such a machine and the mood
> > to debug this already??? ;)
> 
> [  730.964000] ipmi message handler version 39.2
> [  731.092000] IPMI System Interface driver.
> [  731.148000] ipmi_si: Adding default-specified kcs state
> machine[  731.224000] ipmi_si: Trying default-specified kcs state
> machine at i/o address 0xca2, slave address 0x0, irq 0 <Cpu0>

looks like stupid ISA auto probing is turned on, when ipmi is loaded
as a module :-( I'll have a look.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
