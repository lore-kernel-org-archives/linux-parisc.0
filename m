Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id C1ED34829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Mar 2003 08:24:46 -0700 (MST)
Date: Fri, 21 Mar 2003 16:24:38 +0100
Message-ID: <3E689FC400004E7C@ocpmta1.freegates.net>
In-Reply-To: <3E68A39600001FFE@ocpmta7.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] FC driver?
To: grundler@dsl2.external.hp.com,
	"Ryan Bradetich" <rbradetich@uswest.net>
Cc: "Jan-Benedict Glaw" <jbglaw@lug-owl.de>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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
>
>Thanks a lot for all those info. 
>
>Unfortunately I have no free time to help more on this driver (and also
not
>enough knowledge for the moment: even thought time and work could solve
this
>pb :) ).
>
Never the less I have a quick look and add some printk():
...
unsigned long cpqfcTS_ReadNVRAM( void* GPIOin, void* GPIOout , USHORT count,
	UCHAR *buf )
{
  unsigned short i;

  if( !( tl_i2c_tx_start(GPIOin, GPIOout) ))
    return FALSE;

    printk(">>> %s step1\n", __FUNCTION__);

  // Select the NVRAM for "dummy" write, to set the address
    printk(">>> GPIOout %p\n", GPIOout);
    printk(">>> SLAVE_WRITE_ADDRESS: %d\n", SLAVE_WRITE_ADDRESS);

  tl_i2c_tx_byte( GPIOout , SLAVE_WRITE_ADDRESS );
  if ( !tl_i2c_rx_ack(GPIOin, GPIOout ) )
    return( FALSE );

    printk("%s step2\n", __FUNCTION__);
...

and notice that the ReadNVRAM failed earlier (dmesg):

...
 scsi_register allocating 6640 bytes for FC HBA
  HBA found!
  HostAdapter->PciDev->irq = 320
  PciDev->baseaddress[0]= 0
  PciDev->baseaddress[1]= 30000
  PciDev->baseaddress[2]= 30100
  PciDev->baseaddress[3]= ffffffff88040000
  cpqfcHBAdata->fcChip.Registers. :
    IOBaseL = 30000
    IOBaseU = 30100
 ioremap'd Membase: ffffffff88040000
    SFQconsumerIndex.address = ffffffff88040058
    ERQproducerIndex.address = ffffffff88040008
    TYconfig.address = ffffffff88040184
    FMconfig.address = ffffffff880401c0
    FMcontrol.address = ffffffff880401c4
  Requesting 255 I/O addresses @ 30000
  Requesting 255 I/O addresses @ 30100
 ResetTachyon
  HBA Tachyon RevId 2.3
Allocating 129024 for 576 Exchanges @ 000000008d5c0000
Allocating 112904 for LinkQ @ 000000008d540000 (576 elements)
Allocating 106504 for TachSEST for 512 Exchanges
  cpqfcTS: writing IMQ BASE 500000h    PI 504000h
  cpqfcTS: SEST 0000000048b00000(virt): Wrote base 520000h @ ffffffff88040140
>>> cpqfcTS_ReadNVRAM step1
>>> GPIOout ffffffff88040188
>>> SLAVE_WRITE_ADDRESS: 160
cpqfcTS: NVRAM read failed
 WARNING! HBA NVRAM WWN read failed - make alias
  WWN 500723E644556677
  Waiting for broken Brocade switch...
 scsi_register allocating 6640 bytes for FC HBA
  HBA found!
  HostAdapter->PciDev->irq = 896
  PciDev->baseaddress[0]= 0
  PciDev->baseaddress[1]= c0000
  PciDev->baseaddress[2]= c0100
  PciDev->baseaddress[3]= ffffffffd4040000
  cpqfcHBAdata->fcChip.Registers. :
    IOBaseL = c0000
    IOBaseU = c0100
 ioremap'd Membase: ffffffffd4040000
    SFQconsumerIndex.address = ffffffffd4040058
    ERQproducerIndex.address = ffffffffd4040008
    TYconfig.address = ffffffffd4040184
    FMconfig.address = ffffffffd40401c0
    FMcontrol.address = ffffffffd40401c4
  Requesting 255 I/O addresses @ c0000
  Requesting 255 I/O addresses @ c0100
 ResetTachyon
  HBA Tachyon RevId 2.3
Allocating 129024 for 576 Exchanges @ 000000008d4c0000
Allocating 112904 for LinkQ @ 0000000048ee0000 (576 elements)
Allocating 106504 for TachSEST for 512 Exchanges
  cpqfcTS: writing IMQ BASE 640000h    PI 644000h
  cpqfcTS: SEST 000000008d5a0000(virt): Wrote base 660000h @ ffffffffd4040140
>>> cpqfcTS_ReadNVRAM step1
>>> GPIOout ffffffffd4040188
>>> SLAVE_WRITE_ADDRESS: 160
cpqfcTS: NVRAM read failed
 WARNING! HBA NVRAM WWN read failed - make alias
  WWN 500725B644556677
  Waiting for broken Brocade switch...
 scsi_register allocating 6640 bytes for FC HBA
  HBA found!
  HostAdapter->PciDev->irq = 960
  PciDev->baseaddress[0]= 0
  PciDev->baseaddress[1]= d0000
  PciDev->baseaddress[2]= d0100
  PciDev->baseaddress[3]= ffffffffd8040000
  cpqfcHBAdata->fcChip.Registers. :
    IOBaseL = d0000
    IOBaseU = d0100
 ioremap'd Membase: ffffffffd8040000
    SFQconsumerIndex.address = ffffffffd8040058
    ERQproducerIndex.address = ffffffffd8040008
    TYconfig.address = ffffffffd8040184
    FMconfig.address = ffffffffd80401c0
    FMcontrol.address = ffffffffd80401c4
  Requesting 255 I/O addresses @ d0000
  Requesting 255 I/O addresses @ d0100
 ResetTachyon
  HBA Tachyon RevId 2.3
Allocating 129024 for 576 Exchanges @ 00000000485c0000
Allocating 112904 for LinkQ @ 00000000487a0000 (576 elements)
Allocating 106504 for TachSEST for 512 Exchanges
  cpqfcTS: writing IMQ BASE 6C0000h    PI 6C4000h
  cpqfcTS: SEST 0000000048020000(virt): Wrote base 6E0000h @ ffffffffd8040140
cpqfcTS_ReadNVRAM step1
>>> GPIOout ffffffffd8040188
>>> SLAVE_WRITE_ADDRESS: 160
>>> cpqfcTS: NVRAM read failed
 WARNING! HBA NVRAM WWN read failed - make alias
  WWN 5007278544556677
  Waiting for broken Brocade switch...
scsi3 : Compaq FibreChannel HBA Tachyon Chip/Board Ver??: WWN 500723E644556677
 on PCI bus 32 device 0x1028 irq 320 IObaseL 0x30000, MEMBASE 0x88040000
PCI bus width 64 bits, bus speed 66 MHz
FCP-SCSI Driver v2.1.1
GBIC detected: NONE!  LPSM 0h Monitor
scsi4 : Compaq FibreChannel HBA Tachyon Chip/Board Ver??: WWN 500725B644556677
 on PCI bus 208 device 0x1028 irq 896 IObaseL 0xc0000, MEMBASE 0xd4040000
PCI bus width 64 bits, bus speed 66 MHz
FCP-SCSI Driver v2.1.1
GBIC detected: NONE!  LPSM 0h Monitor
scsi5 : Compaq FibreChannel HBA Tachyon Chip/Board Ver??: WWN 5007278544556677
 on PCI bus 224 device 0x1028 irq 960 IObaseL 0xd0000, MEMBASE 0xd8040000
PCI bus width 64 bits, bus speed 66 MHz
FCP-SCSI Driver v2.1.1
GBIC detected: NONE!  LPSM 0h Monitor

So it seems that   tl_i2c_tx_byte() failled?

Is GPIout are OK?

I have not any detailed doc about this card, so any advise is well come.

Thanks again,
    Joel


---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
