Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9751B4840
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Nov 2003 14:44:01 -0700 (MST)
Message-ID: <3FBE8732.2050705@tiscali.be>
Date: Fri, 21 Nov 2003 21:44:18 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Joel Soete <soete.joel@tiscali.be>
Cc: "M. Grabert" <xam@cs.ucc.ie>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C110 builtin nic slow?
References: <3F969FFE00009EA4@ocpmta2.freegates.net> <3F969FFE00009F73@ocpmta2.freegates.net> <20031110173525.GC24664@colo.lackof.org> <3FB0DC01.6070701@tiscali.be> <20031112032230.GB12000@colo.lackof.org> <3FB68167.10106@tiscali.be> <Pine.LNX.4.58.0311152220070.16980@sal.ucc.ie> <Pine.LNX.4.58.0311152313340.16980@sal.ucc.ie> <3FB7AD39.9010305@tiscali.be>
In-Reply-To: <3FB7AD39.9010305@tiscali.be>
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

Hi all,


Joel Soete wrote:
> 
> 
> M. Grabert wrote:
> 
>> Sorry to reply myself,
> 
this is me now ;)

A small follow-up: I exchange my 3com with another hp nic (the same as 
the first one).

The pb now, is that the new one become eth0 (and works fine) but the old 
one (which would be eth1) is not any-more usable (no means to configure 
to setup and configure it):
# cat /proc/pci
[...]
   Bus  0, device  11, function  0:
     Ethernet controller: Hewlett-Packard Company J2585B HP 10/100VG PCI 
LAN Ada
ter (rev 0).
       IRQ 9.
       Master Capable.  Latency=64.  Min Gnt=8.Max Lat=32.
       I/O at 0xe000 [0xe0ff].
       Non-prefetchable 32 bit memory at 0xeb000000 [0xeb001fff].
   Bus  0, device  12, function  0:
     Ethernet controller: Hewlett-Packard Company J2585B HP 10/100VG PCI 
LAN Ada
ter (#2) (rev 0).
       IRQ 10.
       Master Capable.  Latency=64.  Min Gnt=8.Max Lat=32.
       I/O at 0xe400 [0xe4ff].
       Non-prefetchable 32 bit memory at 0xeb002000 [0xeb003fff].
[...]

Any idea?

Thanks again,
	Joel
