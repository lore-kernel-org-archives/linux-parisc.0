Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 17A7D4841
	for <parisc-linux@lists.parisc-linux.org>; Sun, 16 Nov 2003 09:52:59 -0700 (MST)
Message-ID: <3FB7AB6D.80309@tiscali.be>
Date: Sun, 16 Nov 2003 16:53:01 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C110 builtin nic slow?
References: <3F969FFE00009EA4@ocpmta2.freegates.net> <3F969FFE00009F73@ocpmta2.freegates.net> <20031110173525.GC24664@colo.lackof.org> <3FB0DC01.6070701@tiscali.be> <20031112032230.GB12000@colo.lackof.org> <3FB68167.10106@tiscali.be> <Pine.LNX.4.58.0311152220070.16980@sal.ucc.ie>
In-Reply-To: <Pine.LNX.4.58.0311152220070.16980@sal.ucc.ie>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Hi Max,

M. Grabert wrote:
> On Sat, 15 Nov 2003, Joel Soete wrote:
> 
> 
>>Hi Grant,
>>
>>I quiet sure now that the pb come from the 2d nic of my pc.
>>
>>It is a:
>>00:0b.0 Ethernet controller: 3Com Corporation 3c905B 100BaseTX [Cyclone]
>>(rev 24)
>>
>>I with google, I find back a mail of Andrew Morton in which he mentioned
>>a diag tool for this nic (<http://www.scyld.com/diag/>). I launch it:
>># ./vortex-diag -aem
>>[...]
>>Transceiver type in use:  10baseT.
>>  MAC settings: full-duplex.
>>                ^^^^^^^^^^^^
>>  Station address set to 00:10:4b:63:2e:bf.
>>  Configuration options 000a.
>>Saved EEPROM settings of a 3Com Vortex/Boomerang:
>>  3Com Node Address 00:10:4B:63:2E:BF (used as a unique ID only).
>>  OEM Station address 00:10:4B:63:2E:BF (used as the ethernet address).
>>   Device ID 9055,  Manufacturer ID 6d50.
>>   Manufacture date (MM/DD/YYYY) 3/17/1998, division 6, product NK.
>>   No BIOS ROM is present.
>>  Transceiver selection: 10baseT.
>>    Options: force full duplex, link beat required.
>>             ^^^^^^^^^^^^^^^^^
>>  PCI Subsystem IDs: Vendor 10b7 Device 9055.
>>[...]
>>
>>So i will continue to see how to set it up in half-duplex (would it not
>>be the default in 10BT?)
> 
> 
> How is it connected?
> Is it connected to a Switch (with Full-Duplex support, not a regular Hub)?
> Or is it connected to another PC via a Cross-Over cable?
> 
A cross-cable (of high quality).
btw I bring back my office 'thinkpad' (win2k) at home, connect it with 
the same cable to c110's nic and ftp my last kernel src (about 30mb): 
ftp stat showing about 800k/s; that is normal.
I use so the same cable to connect 'thinkpab' to my 3com nic and do the 
same ftp: ftp hang after 600k?

> If either of them is true, then 10BaseT will auto-negotiate Full-Duplex,
> of both ends support it.
> It's usually safe with 10BaseT only cards, but it's might come to some
> little problems if some cheap 100BaseTx cards are involved (more complex
> auto-negotiation involved, some cheap cards don't do it correctly).
> Then you might have to force it to 10Mbit, 100Mbit, Full or Half-Duplex
> manually.
> 
many strange things occurs with this card:
* I don't see it initialized in dmesg as the other nic (even though it 
is well configure (ifconfig :) )
* mii-tool shows:
eth1: 10 Mbit, half duplex, no link
                             ^^^^^^^
even though:
  # ping hpalin
PING hpalin (172.16.248.45): 56 data bytes
64 bytes from 172.16.248.45: icmp_seq=0 ttl=64 time=0.4 ms
64 bytes from 172.16.248.45: icmp_seq=1 ttl=64 time=0.4 ms
64 bytes from 172.16.248.45: icmp_seq=2 ttl=64 time=0.4 ms
64 bytes from 172.16.248.45: icmp_seq=3 ttl=64 time=0.4 ms

--- hpalin ping statistics ---
4 packets transmitted, 4 packets received, 0% packet loss
round-trip min/avg/max = 0.4/0.4/0.4 ms
or
  # ping hpalin -s 3000
PING hpalin (172.16.248.45): 3000 data bytes
3008 bytes from 172.16.248.45: icmp_seq=0 ttl=64 time=5.7 ms
3008 bytes from 172.16.248.45: icmp_seq=1 ttl=64 time=5.6 ms
3008 bytes from 172.16.248.45: icmp_seq=2 ttl=64 time=5.6 ms
3008 bytes from 172.16.248.45: icmp_seq=3 ttl=64 time=5.6 ms
3008 bytes from 172.16.248.45: icmp_seq=4 ttl=64 time=5.6 ms
3008 bytes from 172.16.248.45: icmp_seq=5 ttl=64 time=5.6 ms
3008 bytes from 172.16.248.45: icmp_seq=6 ttl=64 time=5.6 ms
3008 bytes from 172.16.248.45: icmp_seq=7 ttl=64 time=5.6 ms
3008 bytes from 172.16.248.45: icmp_seq=8 ttl=64 time=5.6 ms
3008 bytes from 172.16.248.45: icmp_seq=9 ttl=64 time=5.6 ms

--- hpalin ping statistics ---
10 packets transmitted, 10 packets received, 0% packet loss

* above mentioned tools (vortex-diag) also mentioned:
[...]
  Basic mode status register 0x3000 ... 3000.
    Link status: not established.
    Capable of  100baseTx 10baseT-FD.
    Unable to perform Auto-negotiation, negotiation not complete.
  This transceiver has no vendor identification.
  I'm advertising 3000:
    Advertising no additional info pages.
    Using an unknown (non 802.3) encapsulation.
  Link partner capability is 3000:.
    Negotiation did not complete.

I need so definitely to force 10baseT-hd but I don't yet find how (I 
lost my isp connection during my last evening research :( ).

> However I don't see why the network card should be *automatically* forced
> to Full-Duplex, since 'forced' implies that is was done manually!
> 
As explain above, it is not the only one incoherencies :(; a cheap bug? 
(afaik it is not the standard to 'force fd' when autoneg failed?)
> 
> Actually if one end point uses Full-Duplex and the other end uses
> Half-Duplex, there should be no connection possible.
By experience (recently we have to fix to 100-fd all server nic and 
related switch ports to avoid such autoneg pb, only with some supplier 
nic not hp :) ), I wouldn't say 'no connection' but well degraded 
connection ;)

> The same for
> the situation when one side uses 10Mbit and the other is set to
> explicitly use 100MBit.
> 
In this case, iirc there are well no connection possible.

> The only situation where such a decreased network performance occurs
> is IMHO that your have a cheap network equipment.
> IE. a dodgy network cable that isn't properly shielded or doesn't use all
> 8 wires, and/or cheap network cards that don't test whether the network
> connection/cable is capable of supporting Full-Duplex reliably.
> 
I don't know if they were cheap but a bit old now:
[...]
Saved EEPROM settings of a 3Com Vortex/Boomerang:
  3Com Node Address 00:10:4B:63:2E:BF (used as a unique ID only).
  OEM Station address 00:10:4B:63:2E:BF (used as the ethernet address).
   Device ID 9055,  Manufacturer ID 6d50.
   Manufacture date (MM/DD/YYYY) 3/17/1998, division 6, product NK.
[...]

> In this (worst case) scenario there will be a lot of packet drop on
> the physical layer and the network cards will re-send the ethernet
> packets autmatically (usually) without notifying you. You will see
> decreased network performace as you mentioned it.
> Unfortunately I have seen this a couple of times in my life, especially
> in the old 10Base2/5 days with broken terminators or tranceivers, but also
> with 10BaseT, and even more so with 100Mbit and low-quality network cables.
> 
> greetings, Max
> 
> 
> PS: oh, yes, another possible problem might be an IRQ conflict (which is
> rather unlikely on PA-RISC). It would cause also degraded network
> performance.
> 
That is the first thing I check:
  # cat /proc/pci
PCI devices found:
[...]
   Bus  0, device   7, function  2:
     USB Controller: Intel Corp. 82371AB/EB/MB PIIX4 USB (rev 1).
       IRQ 10.
       Master Capable.  Latency=64.
       I/O at 0xd000 [0xd01f].
   Bus  0, device   7, function  3:
     Bridge: Intel Corp. 82371AB/EB/MB PIIX4 ACPI (rev 2).
       IRQ 9.
[...]
   Bus  0, device  11, function  0:
     Ethernet controller: 3Com Corporation 3c905B 100BaseTX [Cyclone] 
(rev 36).
       IRQ 9.
       Master Capable.  Latency=64.  Min Gnt=10.Max Lat=10.
       I/O at 0xe000 [0xe07f].
       Non-prefetchable 32 bit memory at 0xec006000 [0xec00607f].
   Bus  0, device  12, function  0:
     Ethernet controller: Hewlett-Packard Company J2585B HP 10/100VG PCI 
LAN Adapter (rev 0).
       IRQ 10.
       Master Capable.  Latency=64.  Min Gnt=8.Max Lat=32.
       I/O at 0xe400 [0xe4ff].
       Non-prefetchable 32 bit memory at 0xec000000 [0xec001fff].
[...]

hmm well the same irq 9 for bridge:... ACPI and nic: 3Com, should it be 
the source of pb?

Thanks for advise and attention,
	Joel
