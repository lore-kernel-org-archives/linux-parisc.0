From: "Craig D. Lansing" <clansing@charter.net>
Subject: RE: [parisc-linux] J2240 - Almost there....
Date: Sat, 31 Dec 2005 23:21:06 -0500
Message-ID: <000a01c60e8a$cac5bc70$3401a8c0@POGO>
References: <20051231180820.GA22653@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: "'Grant Grundler'" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051231180820.GA22653@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Duh!!!  Can you tell that it has been a long time since I've had a "real"
computer to play with?

Anyway, I now have a dual-boot (HP-UX 10 / Debian Linux) J2240.

Here's what SAM thinks is in the system:
Toshiba CD-ROM SCSI drive
IBM DDRS-39130WS (9GB disk)
IBM DDRS-39130WS (9GB disk)
FDDI (lan1)
100Base-T (lan0)
Cards
	Built-in RS-232 Interface
	Ultra2 Wide SCSI
	Built-in Parallel Interface
	Built-in Keyboard/Mouse
	Built-in RS-232 Interface (yes, another one)
Device List
	I/O Adapter
	PCI Bus Bridge - GSCtoPCI
	PCI(10110019) -- 3
	PCI FDDI Adapter
	PCI Bus Bridge - GSCtoPCI
	Ultra2 Wide SCSI
	IBM DDRS-39130WS
	IBM DDRS-39130WS
	Initiator
	PCI(10110019) -- Built-in #2
	Core I/O Adapter
	Built-in Parallel Interface
	Audio Interface
	Built-in SCSI
	Toshiba CD-ROM SCSI Drive
	C1537A 12 GB DDS3 Data Compression Tape Drive
	Initiator
	Built-in Keyboard/Mouse
	I/O Adapter
	PCI Bus Bridge - GSCtoPCI
	PCI(103c1005) -- 0
	Built-in RS-232 Interface
	Processor
	Processor
	Memory
		

Thanks for the help!!!!


-----Original Message-----
From: Grant Grundler [mailto:grundler@parisc-linux.org] 
Sent: Saturday, December 31, 2005 1:08 PM
To: Craig D. Lansing
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] J2240 - Almost there....

On Sat, Dec 31, 2005 at 11:21:48AM -0500, Craig D. Lansing wrote:
> If I could remember the
> root password (ergh!), I could poke around in SAM on the HP-UX partition.

You don't need to remember the root login.
Answer "Y" to "Interact with ISL" type "hpux -is" at the ISL prompt.

You'll be root in single user mode.

"There is no such thing as computer security without physical security."

grant

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
