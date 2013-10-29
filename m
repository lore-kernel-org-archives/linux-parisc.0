From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: Short notice: =?UTF-8?Q?ipmi=5Fsi=20kills=20C=38=30=30=30?=
Date: Tue, 29 Oct 2013 11:41:08 +0100
Message-ID: <236d3862441c13623a9fde73e6988591@sf-mail.de>
References: <2698496.oieJ4Vatqf@caliban.sf-tec.de>
 <20131026191720.5282c0c3@marga.jer-c2.orkz.net>
 <20131028105612.GB19852@alpha.franken.de>
 <20131029093706.GA6255@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20131029093706.GA6255@alpha.franken.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Am 29.10.2013 10:37, schrieb Thomas Bogendoerfer:
> On Mon, Oct 28, 2013 at 11:56:12AM +0100, Thomas Bogendoerfer wrote:
>> On Sat, Oct 26, 2013 at 07:17:20PM +0200, Jeroen Roovers wrote:
>> > > I did "modprobe ipmi_si" on my C8000 (kernel 3.11.6), which
>> > > immediately broke the machine. I have no backtrace yet, but I'll try
>> > > to get one next week. In case someone has such a machine and the mood
>> > > to debug this already??? ;)
>> >
>> > [  730.964000] ipmi message handler version 39.2
>> > [  731.092000] IPMI System Interface driver.
>> > [  731.148000] ipmi_si: Adding default-specified kcs state
>> > machine[  731.224000] ipmi_si: Trying default-specified kcs state
>> > machine at i/o address 0xca2, slave address 0x0, irq 0 <Cpu0>
>> 
>> looks like stupid ISA auto probing is turned on, when ipmi is loaded
>> as a module :-( I'll have a look.
> 
> my patch went into 3.12-rc1 so it's expected that 3.11.6 crashes 
> without it.

Oops, sorry, I misread the git log. I've now applied that patch to 
3.11.6 and the module loads fine. Am I supposed to see anything in the 
sysfs that I can query now?

Eike
