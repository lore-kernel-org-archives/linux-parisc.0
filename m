From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: C8000 serial port
Date: Fri, 23 Apr 2010 14:41:22 +0200
Message-ID: <20100423144122.4b83a557@borg.bxl.tuxicoman.be>
References: <20100423122701.259de41e@borg.bxl.tuxicoman.be>
	<v2h7d01f9f01004230400v9ec94077s722e677ee890d02a@mail.gmail.com>
	<20100423131546.6276c469@borg.bxl.tuxicoman.be>
	<k2t7d01f9f01004230517v902702f7x160de554d75c707f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: Thibaut VARENE <varenet@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <k2t7d01f9f01004230517v902702f7x160de554d75c707f@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


On Fri, 23 Apr 2010 14:17:26 +0200
Thibaut VARENE <varenet@parisc-linux.org> wrote:

> Oh I see. Dunno about the hardware itself. I've been told it's pretty
> new. What does lspci say? Also check lsparisc.

lspci doesn't show the serial ports :

terminator ~ # lspci
40:01.0 SCSI storage controller: LSI Logic / Symbios Logic 53c1030 PCI-X Fusion-MPT Dual Ultra320 SCSI (rev 07)
40:01.1 SCSI storage controller: LSI Logic / Symbios Logic 53c1030 PCI-X Fusion-MPT Dual Ultra320 SCSI (rev 07)
40:02.0 PCI bridge: Intel Corporation 21154 PCI-to-PCI Bridge
40:03.0 Fibre Channel: Hewlett-Packard Company Tach TL Fibre Channel Host Adapter (rev 0b)
41:04.0 Ethernet controller: Digital Equipment Corporation DECchip 21142/43 (rev 41)
41:05.0 Ethernet controller: Digital Equipment Corporation DECchip 21142/43 (rev 41)
41:06.0 Ethernet controller: Digital Equipment Corporation DECchip 21142/43 (rev 41)
41:07.0 Ethernet controller: Digital Equipment Corporation DECchip 21142/43 (rev 41)
60:01.0 USB Controller: NEC Corporation USB (rev 41)
60:01.1 USB Controller: NEC Corporation USB (rev 41)
60:01.2 USB Controller: NEC Corporation USB 2.0 (rev 02)
60:02.0 IDE interface: Silicon Image, Inc. PCI0680 Ultra ATA-133 Host Controller (rev 02)
60:03.0 Ethernet controller: Intel Corporation 82540EM Gigabit Ethernet Controller (rev 02)
80:00.0 VGA compatible controller: ATI Technologies Inc Radeon RV100 QY [Radeon 7000/VE]


lsparisc shows two unknown IO devices (17 and 18). Maybe it's those ?

terminator ~ # lsparisc --long --verbose
[0] IO Adapter: Pluto BC McKinley Port
  hversion=0x880 sversion=0x0000c
  dir: /sys/devices/parisc/0
[0:0] Foreign Bus Bridge: Mercury PCI Bridge
  hversion=0x783 sversion=0x0000a
  dir: /sys/devices/parisc/0/0:0
[0:2] Foreign Bus Bridge: Mercury PCI Bridge
  hversion=0x783 sversion=0x0000a
  dir: /sys/devices/parisc/0/0:2
[0:3] Foreign Bus Bridge: Mercury PCI Bridge
  hversion=0x783 sversion=0x0000a
  dir: /sys/devices/parisc/0/0:3
[0:4] Foreign Bus Bridge: Quicksilver AGP Bridge
  hversion=0x784 sversion=0x0000a
  dir: /sys/devices/parisc/0/0:4
[128] Processor: Crestone Peak
  hversion=0x88a sversion=0x00004
  dir: /sys/devices/parisc/128
[129] Processor: Crestone Peak
  hversion=0x88a sversion=0x00004
  dir: /sys/devices/parisc/129
[16] MC: BMC IPMI Mgmt Ctlr
  hversion=0x004 sversion=0x000c0
  dir: /sys/devices/parisc/16
[17] Foreign IO: unknown device
  hversion=0x076 sversion=0x000ad
  dir: /sys/devices/parisc/17
[18] Foreign IO: unknown device
  hversion=0x076 sversion=0x000ad
  dir: /sys/devices/parisc/18
[8] Memory: Memory
  hversion=0x0b6 sversion=0x00009
  dir: /sys/devices/parisc/8


Cheers,
  Guy
