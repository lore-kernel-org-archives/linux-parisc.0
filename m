From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] linux-2.6.10-pa1 panic on C360 in SCSI driver
Date: Thu, 30 Dec 2004 15:43:18 -0500
Message-ID: <200412301543.18478.vapier@gentoo.org>
References: <200412260504.40205.vapier@gentoo.org>
	<200412291816.19157.vapier@gentoo.org>
	<1104426241.5268.30.camel@mulgrave>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_mhG1BURmaBhxKyK"
To: parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1104426241.5268.30.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--Boundary-00=_mhG1BURmaBhxKyK
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 30 December 2004 12:04 pm, James Bottomley wrote:
> Could you reverse all the previous patches in scsi_transport_spi.c and
> apply the attached.  I hope it will detect the write buffer problem and
> fall back to doing DV configuration using the read only tests, so your
> drive should configure at the maximum rate for the 875.

done deal ... i noticed when patching there were a few returns in the updated 
functions that still returned '0' or '1' instead the new enum's ...

new dmesg attached
-mike

--Boundary-00=_mhG1BURmaBhxKyK
Content-Type: text/plain; charset="iso-8859-1";
	name="2.6.10-pa1-scsi-debug-patch7"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="2.6.10-pa1-scsi-debug-patch7"

sym0: <875> rev 0x4 at pci 0000:00:13.0 irq 99
sym0: No NVRAM, ID 7, Fast-20, SE, parity checking
sym0: SCSI BUS has been reset.
scsi0 : sym-2.1.18m
elevator: using anticipatory as default io scheduler
  Vendor: IBM       Model: DDRS-34560WS      Rev: HP01
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym0:6:0: tagged command queuing enabled, command queue depth 16.
 target0:0:6: Beginning Domain Validation
sym0:6:wide msgout: 1-2-3-1.
sym0:6:wide msgin: 1-2-3-1.
sym0:6:wdtr: wide=1 chg=0.
sym0:6:sync msgout: 1-3-1-c-0.
sym0:6:sync msgin: 1-3-1-c-0.
sym0:6:sdtr: ofs=0 per=12 div=0 fak=0 chg=0.
sym0:6: wide asynchronous.
 target0:0:6: Domain Validation skipping write tests
sym0:6:sync msgout: 1-3-1-c-10.
sym0:6:sync msgin: 1-3-1-c-f.
sym0:6:sdtr: ofs=15 per=12 div=0 fak=0 chg=0.
sym0:6: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
 target0:0:6: Ending Domain Validation
sym0:9:ppr msgin: 1-6-4-c-0-3f-1-2.
sym0:9: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 16)
sym0:9:ppr msgout: 1-6-4-c-0-10-1-0.
  Vendor: WDIGTL    Model: WDE9150 ULTRA3    Rev: 1.30
  Type:   Direct-Access                      ANSI SCSI revision: 03
sym0:9:0: tagged command queuing enabled, command queue depth 16.
 target0:0:9: Beginning Domain Validation
sym0:9:wide msgout: 1-2-3-0.
sym0:9:wide msgin: 1-2-3-0.
sym0:9:wdtr: wide=0 chg=0.
sym0:9:sync msgin: 1-3-1-c-1f.
sym0:9:sdtr: ofs=16 per=12 div=0 fak=0 chg=1.
sym0:9: FAST-20 SCSI 20.0 MB/s ST (50.0 ns, offset 16)
sym0:9:sync msgout: 1-3-1-c-10.
sym0:9:wide msgout: 1-2-3-1.
sym0:9:wide msgin: 1-2-3-1.
sym0:9:wdtr: wide=1 chg=0.
sym0:9:sync msgout: 1-3-1-c-10.
sym0:9:sync msgin: 1-3-1-c-10.
sym0:9:sdtr: ofs=16 per=12 div=0 fak=0 chg=0.
sym0:9: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 16)
 target0:0:9: Domain Validation skipping write tests
 target0:0:9: Ending Domain Validation
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi1: 53c710 rev 2 
scsi1 : LASI SCSI 53c700
  Vendor: TOSHIBA   Model: CD-ROM XM-5301TA  Rev: 1895
  Type:   CD-ROM                             ANSI SCSI revision: 02
 target1:0:2: Beginning Domain Validation
scsi1: (2:0) Asynchronous
 target1:0:2: Domain Validation skipping write tests
scsi1: (2:0) Synchronous at offset 8, period 236ns
 target1:0:2: Ending Domain Validation
SCSI device sda: 8388314 512-byte hdwr sectors (4295 MB)
SCSI device sda: drive cache: write back
SCSI device sda: 8388314 512-byte hdwr sectors (4295 MB)
SCSI device sda: drive cache: write back
 sda: sda1 sda2 sda3 sda4
Attached scsi disk sda at scsi0, channel 0, id 6, lun 0
SCSI device sdb: 17873040 512-byte hdwr sectors (9151 MB)
SCSI device sdb: drive cache: write back
SCSI device sdb: 17873040 512-byte hdwr sectors (9151 MB)
SCSI device sdb: drive cache: write back
 sdb: unknown partition table
Attached scsi disk sdb at scsi0, channel 0, id 9, lun 0
sr0: scsi-1 drive
Uniform CD-ROM driver Revision: 3.20
Attached scsi CD-ROM sr0 at scsi1, channel 0, id 2, lun 0
Attached scsi generic sg0 at scsi0, channel 0, id 6, lun 0,  type 0
Attached scsi generic sg1 at scsi0, channel 0, id 9, lun 0,  type 0
Attached scsi generic sg2 at scsi1, channel 0, id 2, lun 0,  type 5

--Boundary-00=_mhG1BURmaBhxKyK
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Boundary-00=_mhG1BURmaBhxKyK--
