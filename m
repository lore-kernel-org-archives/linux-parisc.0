From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] linux-2.6.10-pa1 panic on C360 in SCSI driver
Date: Mon, 27 Dec 2004 00:26:21 +0000
Message-ID: <41CF56AD.2010504@tiscali.be>
References: <200412260504.40205.vapier@gentoo.org>
	<20041226173709.GH11543@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041226173709.GH11543@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello all,

Matthew Wilcox wrote:
> On Sun, Dec 26, 2004 at 05:04:40AM -0500, Mike Frysinger wrote:
> 
>>seems to be a new bug because building a 2.6.8.1-pa7 kernel with same .config 
>>works fine while a 2.6.10-pa1 panics ;(
> 
> 
> I suspect any 2.6.9 kernel will work fine and some of the earlier
> 2.6.10-rc too.  At some stage, I may invite you to do a binary search
> to figure out what patch caused this problem ... but see below first.
> 
> 
>>2.6.10-pa1-scsi-panic - dmesg output from scsi driver up through panic
>>2.6.8.1-pa11-dmesg - scsi dmesg output from a good kernel
> 
> 
> This is good -- very helpful.
> 
> 
>>sym0: <875> rev 0x4 at pci 0000:00:13.0 irq 99
>>sym0: No NVRAM, ID 7, Fast-20, SE, parity checking
> 
> 
> The 875 only supports wide ultra scsi (ie, FAST-20, 40MB/s).
> 
I just tested new 2.6.10 on my i386 box with same scsi interface (hp supply):
[...]
PCI: Found IRQ 11 for device 0000:00:09.0
sym0: <875> rev 0x14 at pci 0000:00:09.0 irq 11
sym0: Symbios NVRAM, ID 7, Fast-20, HVD, parity checking
sym0: open drain IRQ line driver, using on-chip SRAM
sym0: using LOAD/STORE-based firmware.
sym0: SCSI BUS has been reset.
scsi0 : sym-2.1.18m
   Vendor: SEAGATE   Model: ST336605LSUN36G   Rev: 0238
   Type:   Direct-Access                      ANSI SCSI revision: 03
sym0:6:0: tagged command queuing enabled, command queue depth 16.
  target0:0:6: Beginning Domain Validation
sym0:6: wide asynchronous.
sym0:6: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 16)
  target0:0:6: Ending Domain Validation
PCI: Found IRQ 5 for device 0000:00:09.1
PCI: Sharing IRQ 5 with 0000:00:0a.0
sym1: <875> rev 0x14 at pci 0000:00:09.1 irq 5
sym1: Symbios NVRAM, ID 7, Fast-20, HVD, parity checking
sym1: open drain IRQ line driver, using on-chip SRAM
sym1: using LOAD/STORE-based firmware.
sym1: SCSI BUS has been reset.
scsi1 : sym-2.1.18m
PCI: Found IRQ 5 for device 0000:00:0a.0
PCI: Sharing IRQ 5 with 0000:00:09.1
sym2: <875> rev 0x26 at pci 0000:00:0a.0 irq 5
sym2: Symbios NVRAM, ID 7, Fast-20, SE, parity checking
sym2: open drain IRQ line driver, using on-chip SRAM
sym2: using LOAD/STORE-based firmware.
sym2: SCAN FOR LUNS disabled for targets 0 1 2 3 4 5 6 8 9 10 11 12 13 14 15.
sym2: SCSI BUS has been reset.
scsi2 : sym-2.1.18m
   Vendor: QUANTUM   Model: ATLAS_V_18_WLS    Rev: 0230
   Type:   Direct-Access                      ANSI SCSI revision: 03
sym2:0:0: tagged command queuing enabled, command queue depth 16.
  target2:0:0: Beginning Domain Validation
sym2:0: wide asynchronous.
sym2:0: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 16)
  target2:0:0: Ending Domain Validation
st: Version 20041025, fixed bufsize 32768, s/g segs 256
SCSI device sda: 71132959 512-byte hdwr sectors (36420 MB)
SCSI device sda: drive cache: write through
SCSI device sda: 71132959 512-byte hdwr sectors (36420 MB)
SCSI device sda: drive cache: write through
  sda: sda1 sda2 sda3 sda4 < sda5 sda6 sda7 sda8 sda9 >
Attached scsi disk sda at scsi0, channel 0, id 6, lun 0
SCSI device sdb: 35861388 512-byte hdwr sectors (18361 MB)
SCSI device sdb: drive cache: write back
SCSI device sdb: 35861388 512-byte hdwr sectors (18361 MB)
SCSI device sdb: drive cache: write back
  sdb: sdb1 sdb2 sdb3 sdb4 < sdb5 sdb6 sdb7 sdb8 sdb9 sdb10 >
Attached scsi disk sdb at scsi2, channel 0, id 0, lun 0
Attached scsi generic sg0 at scsi0, channel 0, id 6, lun 0,  type 0
Attached scsi generic sg1 at scsi2, channel 0, id 0, lun 0,  type 0
[...]

and all seems to works fine.

Is there difference between upstream kernel and pa cvs from sym2 driver point of view?

hth,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
