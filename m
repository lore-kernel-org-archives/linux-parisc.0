Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id F294A487A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 15 Nov 2003 15:56:43 -0700 (MST)
Date: Sat, 15 Nov 2003 22:56:41 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C110 builtin nic slow?
In-Reply-To: <3FB68167.10106@tiscali.be>
Message-ID: <Pine.LNX.4.58.0311152220070.16980@sal.ucc.ie>
References: <3F969FFE00009EA4@ocpmta2.freegates.net> <3F969FFE00009F73@ocpmta2.freegates.net>
 <20031110173525.GC24664@colo.lackof.org> <3FB0DC01.6070701@tiscali.be>
 <20031112032230.GB12000@colo.lackof.org> <3FB68167.10106@tiscali.be>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Sat, 15 Nov 2003, Joel Soete wrote:

> Hi Grant,
>
> I quiet sure now that the pb come from the 2d nic of my pc.
>
> It is a:
> 00:0b.0 Ethernet controller: 3Com Corporation 3c905B 100BaseTX [Cyclone]
> (rev 24)
>
> I with google, I find back a mail of Andrew Morton in which he mentioned
> a diag tool for this nic (<http://www.scyld.com/diag/>). I launch it:
> # ./vortex-diag -aem
> [...]
> Transceiver type in use:  10baseT.
>   MAC settings: full-duplex.
>                 ^^^^^^^^^^^^
>   Station address set to 00:10:4b:63:2e:bf.
>   Configuration options 000a.
> Saved EEPROM settings of a 3Com Vortex/Boomerang:
>   3Com Node Address 00:10:4B:63:2E:BF (used as a unique ID only).
>   OEM Station address 00:10:4B:63:2E:BF (used as the ethernet address).
>    Device ID 9055,  Manufacturer ID 6d50.
>    Manufacture date (MM/DD/YYYY) 3/17/1998, division 6, product NK.
>    No BIOS ROM is present.
>   Transceiver selection: 10baseT.
>     Options: force full duplex, link beat required.
>              ^^^^^^^^^^^^^^^^^
>   PCI Subsystem IDs: Vendor 10b7 Device 9055.
> [...]
>
> So i will continue to see how to set it up in half-duplex (would it not
> be the default in 10BT?)

How is it connected?
Is it connected to a Switch (with Full-Duplex support, not a regular Hub)?
Or is it connected to another PC via a Cross-Over cable?

If either of them is true, then 10BaseT will auto-negotiate Full-Duplex,
of both ends support it.
It's usually safe with 10BaseT only cards, but it's might come to some
little problems if some cheap 100BaseTx cards are involved (more complex
auto-negotiation involved, some cheap cards don't do it correctly).
Then you might have to force it to 10Mbit, 100Mbit, Full or Half-Duplex
manually.

However I don't see why the network card should be *automatically* forced
to Full-Duplex, since 'forced' implies that is was done manually!


Actually if one end point uses Full-Duplex and the other end uses
Half-Duplex, there should be no connection possible. The same for
the situation when one side uses 10Mbit and the other is set to
explicitly use 100MBit.

The only situation where such a decreased network performance occurs
is IMHO that your have a cheap network equipment.
IE. a dodgy network cable that isn't properly shielded or doesn't use all
8 wires, and/or cheap network cards that don't test whether the network
connection/cable is capable of supporting Full-Duplex reliably.

In this (worst case) scenario there will be a lot of packet drop on
the physical layer and the network cards will re-send the ethernet
packets autmatically (usually) without notifying you. You will see
decreased network performace as you mentioned it.
Unfortunately I have seen this a couple of times in my life, especially
in the old 10Base2/5 days with broken terminators or tranceivers, but also
with 10BaseT, and even more so with 100Mbit and low-quality network cables.

greetings, Max


PS: oh, yes, another possible problem might be an IRQ conflict (which is
rather unlikely on PA-RISC). It would cause also degraded network
performance.
