Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 17 Mar 2003 09:38:04 -0700
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: Jan-Benedict Glaw <jbglaw@lug-owl.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] FC driver?
Message-ID: <20030317163804.GC31378@dsl2.external.hp.com>
References: <3E68A12A00002910@ocpmta3.freegates.net> <20030317111801.GF17073@lug-owl.de> <20030317161445.GA31378@dsl2.external.hp.com> <1047918143.14507.18.camel@beavis.ybsoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1047918143.14507.18.camel@beavis.ybsoft.com>
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

On Mon, Mar 17, 2003 at 09:22:23AM -0700, Ryan Bradetich wrote:
> On parisc?  I've had trouble with it running on my C200.  Maybe
> it is time to try it again.  I know Jes and Martin worked on it 
> for i386..

my bad - you are right. It still doesn' work. Details follow.

I just tried it again with:
20:00.0 PCI bridge: Digital Equipment Corporation DECchip 21154 (rev 02)
21:04.0 Fibre Channel: Hewlett-Packard Company Tach TL Fibre Channel
Host Adapter (rev 0a)
21:05.0 Fibre Channel: Hewlett-Packard Company Tach TL Fibre Channel
Host Adapter (rev 0a)

20:00.0 Class 0604: 1011:0026 (rev 02)
21:04.0 Class 0c04: 103c:1028 (rev 0a)
21:05.0 Class 0c04: 103c:1028 (rev 0a)

cpqfc driver loads but still finds no devices on the FC hub.

gsyprf11:~# modprobe cpqfc
 scsi_register allocating 6640 bytes for FC HBA
  HBA found!
  HostAdapter->PciDev->irq = 256
  PciDev->baseaddress[0]= 0
  PciDev->baseaddress[1]= 20000
  PciDev->baseaddress[2]= 20100
  PciDev->baseaddress[3]= fffffffffa040000
  cpqfcHBAdata->fcChip.Registers. :
    IOBaseL = 20000
    IOBaseU = 20100
 ioremap'd Membase: fffffffffa040000
    SFQconsumerIndex.address = fffffffffa040058
    ERQproducerIndex.address = fffffffffa040008
    TYconfig.address = fffffffffa040184
    FMconfig.address = fffffffffa0401c0
    FMcontrol.address = fffffffffa0401c4
  Requesting 255 I/O addresses @ 20000
  Requesting 255 I/O addresses @ 20100
 ResetTachyon
  HBA Tachyon RevId 2.2
Allocating 129024 for 576 Exchanges @ 00000000355e0000
Allocating 112904 for LinkQ @ 00000000355c0000 (576 elements)
Allocating 106504 for TachSEST for 512 Exchanges
  cpqfcTS: writing IMQ BASE 7580000h    PI 7584000h
  cpqfcTS: SEST 000000004be80000(virt): Wrote base 75A0000h @
fffffffffa040140
cpqfcTS: NVRAM read failed
 WARNING! HBA NVRAM WWN read failed - make alias
  WWN 51044F1044556677
  Waiting for broken Brocade switch...
 scsi_register allocating 6640 bytes for FC HBA
  HBA found!
  HostAdapter->PciDev->irq = 257
  PciDev->baseaddress[0]= 0
  PciDev->baseaddress[1]= 20200
  PciDev->baseaddress[2]= 20300
  PciDev->baseaddress[3]= fffffffffa041000
  cpqfcHBAdata->fcChip.Registers. :
    IOBaseL = 20200
    IOBaseU = 20300
 ioremap'd Membase: fffffffffa041000
    SFQconsumerIndex.address = fffffffffa041058
    ERQproducerIndex.address = fffffffffa041008
    TYconfig.address = fffffffffa041184
    FMconfig.address = fffffffffa0411c0
    FMcontrol.address = fffffffffa0411c4
  Requesting 255 I/O addresses @ 20200
  Requesting 255 I/O addresses @ 20300
 ResetTachyon
  HBA Tachyon RevId 2.2
Allocating 129024 for 576 Exchanges @ 000000004be60000
Allocating 112904 for LinkQ @ 000000004be40000 (576 elements)
Allocating 106504 for TachSEST for 512 Exchanges
  cpqfcTS: writing IMQ BASE 7800000h    PI 7804000h
  cpqfcTS: SEST 000000004be20000(virt): Wrote base 7820000h @
fffffffffa041140
cpqfcTS: NVRAM read failed
 WARNING! HBA NVRAM WWN read failed - make alias
  WWN 510450E844556677
  Waiting for broken Brocade switch...
scsi6 : Agilent FC HBA, Tachyon XL2 HPFC-5200B/2.2: WWN 51044F1044556677
 on PCI bus 33 device 0x1028 irq 256 IObaseL 0x20000, MEMBASE 0xfa040000
PCI bus width 64 bits, bus speed 66 MHz
FCP-SCSI Driver v2.1.1
GBIC detected: Unknown.  LPSM 0h Monitor
scsi7 : Agilent FC HBA, Tachyon XL2 HPFC-5200B/2.2: WWN 510450E844556677
 on PCI bus 33 device 0x1028 irq 257 IObaseL 0x20200, MEMBASE 0xfa041000
PCI bus width 64 bits, bus speed 66 MHz
FCP-SCSI Driver v2.1.1
GBIC detected: Short-wave.  LPSM 0h Monitor
gsyprf11:~#

The "NVRAM read failed" msg seems to be a problem still.
Fixing that would be a next step. The GBIC detection is the
next problem that would need work. Looks like a timing problem
since the first GBIC was not detected and the second one was.

grant
