Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 14 Jan 2003 09:52:03 -0700
To: jsoe0708@tiscali.be
Cc: Randolph Chung <tausq@debian.org>,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] new gcc-default for hppa
Message-ID: <20030114165202.GA32537@dsl2.external.hp.com>
References: <20030113193826.GA1938@dsl2.external.hp.com> <3DED9A660000572D@ocpmta3.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3DED9A660000572D@ocpmta3.freegates.net>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Tue, Jan 14, 2003 at 07:57:01AM +0100, jsoe0708@tiscali.be wrote:
> Linux Tulip driver version 0.9.15-pre12 (Aug 9, 2002)
> tulip0: no phy info, aborting mtable build
> tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
> eth0: Digital DS21143 Tulip rev 65 at 0xf00, 00:30:D3:01:5A:3B, IRQ 66.
> tulip1:  EEPROM default media type Autosense.
> tulip1:  Index #0 - Media MII (#11) described by a 21142 MII PHY (3) block.
> tulip_mii_recover: 100 ms
> tulip1:  MII transceiver #1 config 3100 status 7849 advertising 0101.
> tulip1:  Advertising 01e1 on PHY 1, previously advertising 0101.
> eth1: Digital DS21143 Tulip rev 65 at 0x12100, 00:30:6E:06:23:D0, IRQ 130.
> Uniform Multi-Platform E-IDE driver Revision: 7.00beta-2.4
> ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
> ....
> 
> No chance, as you can see, the two interfaces are of the same time.

I'll assume you meant same "type". They only happen to be the same rev
of the same device - mounted on different boards and wired
up to the PHY differently. ie they excercise slighly different code
paths in the tulip media init code path. This sounds more like a
bug in tulip driver than a compiler bug.

I've not tried add-on tulip's in my c3k (only minor differences to b2k).
I believe (but am not 100% sure right now) that gcc-3.2 built kernels
worked on that box.  I am sure gcc-3.2 built 2.4 kernels worked on a500.

Also, can you compare your .config with the one in 2.4.20-pa14.tgz
(ftp.p-l.o/kernels/c3000) or a default .config if that's closer?

BTW, one can safely enable MMIO on the b2k and perhaps either
(a) avoid the crash or (b) get an accurate IP on where in the code
it's crashing. "inb" has too many levels of indirection to see
exactly where in tulip it's crashing.

> (I also have a b180 but the buildin NIC is also "Digital DS21143 Tulip rev
> 65" :( )

Interesting. My b180 has:
grundler@debian:~$ lspci
00:01.0 SCSI storage controller: LSI Logic / Symbios Logic (formerly
NCR) 53c875 (rev 14)
00:01.1 SCSI storage controller: LSI Logic / Symbios Logic (formerly
NCR) 53c875 (rev 14)
00:02.0 Ethernet controller: Intel Corp. 82557/8/9 [Ethernet Pro 100]
(rev 01)
00:13.0 SCSI storage controller: LSI Logic / Symbios Logic (formerly
NCR) 53c875 (rev 04)
00:14.0 Ethernet controller: Digital Equipment Corporation DECchip
21142/43 (rev 30)

For the record, 21143 is the eth0. I use the eepro100 card for
local private subnet.

hth,
grant
