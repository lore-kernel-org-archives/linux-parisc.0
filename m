Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id B5BEC487E
	for <parisc-linux@lists.parisc-linux.org>; Sat, 15 Nov 2003 12:41:22 -0700 (MST)
Message-ID: <3FB68167.10106@tiscali.be>
Date: Sat, 15 Nov 2003 19:41:27 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] C110 builtin nic slow?
References: <3F969FFE00009EA4@ocpmta2.freegates.net> <3F969FFE00009F73@ocpmta2.freegates.net> <20031110173525.GC24664@colo.lackof.org> <3FB0DC01.6070701@tiscali.be> <20031112032230.GB12000@colo.lackof.org>
In-Reply-To: <20031112032230.GB12000@colo.lackof.org>
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

Hi Grant,

I quiet sure now that the pb come from the 2d nic of my pc.

It is a:
00:0b.0 Ethernet controller: 3Com Corporation 3c905B 100BaseTX [Cyclone] 
(rev 24)

I with google, I find back a mail of Andrew Morton in which he mentioned 
a diag tool for this nic (<http://www.scyld.com/diag/>). I launch it:
# ./vortex-diag -aem
[...]
Transceiver type in use:  10baseT.
  MAC settings: full-duplex.
                ^^^^^^^^^^^^
  Station address set to 00:10:4b:63:2e:bf.
  Configuration options 000a.
Saved EEPROM settings of a 3Com Vortex/Boomerang:
  3Com Node Address 00:10:4B:63:2E:BF (used as a unique ID only).
  OEM Station address 00:10:4B:63:2E:BF (used as the ethernet address).
   Device ID 9055,  Manufacturer ID 6d50.
   Manufacture date (MM/DD/YYYY) 3/17/1998, division 6, product NK.
   No BIOS ROM is present.
  Transceiver selection: 10baseT.
    Options: force full duplex, link beat required.
             ^^^^^^^^^^^^^^^^^
  PCI Subsystem IDs: Vendor 10b7 Device 9055.
[...]

So i will continue to see how to set it up in half-duplex (would it not 
be the default in 10BT?)

Cheers,
	Joel


Grant Grundler wrote:
> On Tue, Nov 11, 2003 at 12:54:25PM +0000, Joel Soete wrote:
> ...
> 
>>but on c110 I noticed many (with rx_copybreak = 100 and rx_copybreak = 
>>1518):
>>do_page_fault() pid=882 command='netserver' type=15 address=0x0000001c
>>...
> 
> 
> hrm...this sounds familiar...I might have only run the netperf "client"
> on parisc and ran "netserver" on either ia64 or ia32 box. :^/
> 
> sorry,
> grant
> 
