From: Matthew Evanson <debianuser@twosillies.com>
Subject: Re: [parisc-linux] Debian 4.0 and PCI issues?
Date: Thu, 19 Apr 2007 21:57:28 -0400
Message-ID: <1177034230.3648.14.camel__44444.0927858979$1416624334$gmane$org@tablet.twosillies.com>
References: <1176602689.4621884127120@www.twosillies.com>
	<20070419060418.GB16953@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070419060418.GB16953@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, 2007-04-19 at 00:04 -0600, Grant Grundler wrote:
> On Sat, Apr 14, 2007 at 10:04:49PM -0400, Matthew Evanson wrote:
> > I was wondering if others have had success running Debian 4.0 (or 3.1 testing)
> > on a C class workstation (specifically C180) with PCI hardware.
> 
> Not that many people are running the older generation workstations.
> BTW, which kernel version is Debian 3.1 testing? Is this the 2.6.18-?

When I first installed 3.1 testing, it had been 2.6.15-.  I upgraded
that in place to 4.0 and it is 2.6.18-.  Both versions exhibited the
problem.

> > Background:
> > * Own a C180 with the buggy GSCtoPCI hardware (per note A4190A-01)
> > * Installed a Compaq quad port PCI ethernet card in the box
> > * System failed to boot due to firmware lockout
> > * Modified firmware to bypass error and allow booting
> 
> Can you describe how you did that?
> Maybe even add it someplace to wiki.parisc-linux.org?
> Or just mail it to me off list and I'll add it.

Yeah, I'd be happy to describe that and post it to the wiki.  Are you
looking for how I approached the problem overall or something more
simplistic (i.e. bytes changed in the firmware).  I suppose there could
be some value in both.

> > * When Linux probes the PCI bus, errors are reported and device is unusable.
> > 
> > Errors thrown are:
> 
> Can you capture the console output with a serial console and post it?
> Can you also post "lspci -v"  and "lspci -vt" output using the kernel
> that did boot?

I'm not set up for a serial console... I'll do that in the next day or
two and post the results at that time.  I also intend to boot with the
original firmware, the stock kernel, and no PCI cards to see if the
kernel still complains on PCI bus probe.

Here's the output for lspci -vt:

        
        -[0000:00]---03.0-[0000:01]--+-04.0  Intel Corporation 82557/8/9 [Ethernet Pro 100]
                                     +-05.0  Intel Corporation 82557/8/9 [Ethernet Pro 100]
                                     +-06.0  Intel Corporation 82557/8/9 [Ethernet Pro 100]
                                     \-07.0  Intel Corporation 82557/8/9 [Ethernet Pro 100]
        
and lspci -v:


        00:03.0 PCI bridge: Digital Equipment Corporation DECchip 21154 (rev 05) (prog-if 00 [Normal decode])
                Flags: bus master, fast Back2Back, medium devsel, latency 255
                Bus: primary=00, secondary=01, subordinate=01, sec-latency=255
                I/O behind bridge: 00000000-00000fff
                Memory behind bridge: f2800000-f2bfffff
                Prefetchable memory behind bridge: 00000000f2c00000-00000000f2cfffff
                Capabilities: [dc] Power Management version 1
        
        01:04.0 Ethernet controller: Intel Corporation 82557/8/9 [Ethernet Pro 100] (rev 05)
                Subsystem: Compaq Computer Corporation NC3131 Fast Ethernet NIC (dual port)
                Flags: bus master, medium devsel, latency 255, IRQ 27
                Memory at f2c00000 (32-bit, prefetchable) [size=4K]
                I/O ports at 10000 [size=32]
                Memory at f2800000 (32-bit, non-prefetchable) [size=1M]
                Capabilities: [dc] Power Management version 1
        
        01:05.0 Ethernet controller: Intel Corporation 82557/8/9 [Ethernet Pro 100] (rev 05)
                Subsystem: Compaq Computer Corporation NC3131 Fast Ethernet NIC (dual port)
                Flags: bus master, medium devsel, latency 255, IRQ 28
                Memory at f2c01000 (32-bit, prefetchable) [size=4K]
                I/O ports at 10020 [size=32]
                Memory at f2900000 (32-bit, non-prefetchable) [size=1M]
                Capabilities: [dc] Power Management version 1
        
        01:06.0 Ethernet controller: Intel Corporation 82557/8/9 [Ethernet Pro 100] (rev 05)
                Subsystem: Compaq Computer Corporation NC3132 Fast Ethernet Module (dual port)
                Flags: bus master, medium devsel, latency 255, IRQ 29
                Memory at f2c02000 (32-bit, prefetchable) [size=4K]
                I/O ports at 10040 [size=32]
                Memory at f2a00000 (32-bit, non-prefetchable) [size=1M]
        
        01:07.0 Ethernet controller: Intel Corporation 82557/8/9 [Ethernet Pro 100] (rev 05)
                Subsystem: Compaq Computer Corporation NC3132 Fast Ethernet Module (dual port)
                Flags: bus master, medium devsel, latency 255, IRQ 30
                Memory at f2c03000 (32-bit, prefetchable) [size=4K]
                I/O ports at 10060 [size=32]
                Memory at f2b00000 (32-bit, non-prefetchable) [size=1M]


> > FYI, I do understand the potential for corruption of data running in this
> > configuration but the way in which this machine will be utilized is low risk.
> 
> ok. For NICs, it's probably OK as long as you disable checksum offloading.
> Packets with data that triggers the corruption will just keep getting resent.
> I guess the connection will timeout at that point. So you won't have to
> worry about silently missing the problem.

Thanks for sharing that background.

--matt
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
