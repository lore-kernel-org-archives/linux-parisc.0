From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] linux-2.6.10-pa1 panic on C360 in SCSI driver
Date: Mon, 27 Dec 2004 22:49:24 -0500
Message-ID: <200412272249.24785.vapier@gentoo.org>
References: <200412260504.40205.vapier@gentoo.org>
	<200412272045.34143.vapier@gentoo.org>
	<1104204620.7447.33.camel@mulgrave>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_EfN0Bq8x0SMuXVk"
To: parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1104204620.7447.33.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--Boundary-00=_EfN0Bq8x0SMuXVk
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 27 December 2004 10:30 pm, James Bottomley wrote:
> Well, I think that's the fault of your drive:

i make no claims that it's perfect :)

> The question is how we coax it to negotiate within the rules...It's
> possible it would work correctly if the negotiation used WDTR and SDTR
> instead of PPR, so could you try the attached hack.
> - if (scsi_device_dt(sdev)) {
> + if (0 && scsi_device_dt(sdev)) {

revereted the minsync patch (not sure if you guys wanted me to, but i did 
anyways) and applied this one ... worked much nicer from my perspective ;)

system booted and i can read the drive just fine ... find attached updated 
dmesg
-mike

--Boundary-00=_EfN0Bq8x0SMuXVk
Content-Type: text/plain; charset="iso-8859-1";
	name="2.6.10-pa1-scsi-debug-patch2"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="2.6.10-pa1-scsi-debug-patch2"

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
sym0:6:sync msgout: 1-3-1-c-10.
sym0:6:sync msgin: 1-3-1-c-f.
sym0:6:sdtr: ofs=15 per=12 div=0 fak=0 chg=0.
sym0:6: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 15)
 target0:0:6: Domain Validation skipping write tests
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
sym0:9:wide msgout: 1-2-3-1.
sym0:9:wide msgin: 1-2-3-1.
sym0:9:wdtr: wide=1 chg=0.
sym0:9:sync msgout: 1-3-1-c-10.
sym0:9:sync msgin: 1-3-1-c-10.
sym0:9:sdtr: ofs=16 per=12 div=0 fak=0 chg=0.
sym0:9:wide msgout: 1-2-3-1.
sym0:9:wide msgin: 1-2-3-1.
sym0:9:wdtr: wide=1 chg=0.
sym0:9:sync msgout: 1-3-1-c-10.
sym0:9:sync msgin: 1-3-1-c-10.
sym0:9:sdtr: ofs=16 per=12 div=0 fak=0 chg=0.
 target0:0:9: Write Buffer failure 8000002
 target0:0:9: Domain Validation detected failure, dropping back
sym0:9:sync msgout: 1-3-1-d-10.
sym0:9:sync msgin: 1-3-1-19-10.
sym0:9:sdtr: ofs=16 per=25 div=2 fak=0 chg=0.
sym0:9: FAST-10 WIDE SCSI 20.0 MB/s ST (100.0 ns, offset 16)
sym0:9:wide msgout: 1-2-3-1.
sym0:9:wide msgin: 1-2-3-1.
sym0:9:wdtr: wide=1 chg=0.
sym0:9:sync msgout: 1-3-1-19-10.
sym0:9:sync msgin: 1-3-1-19-10.
sym0:9:sdtr: ofs=16 per=25 div=2 fak=0 chg=0.
 target0:0:9: Write Buffer failure 8000002
 target0:0:9: Domain Validation detected failure, dropping back
sym0:9:sync msgout: 1-3-1-25-10.
sym0:9:sync msgin: 1-3-1-25-10.
sym0:9:sdtr: ofs=16 per=37 div=2 fak=2 chg=0.
sym0:9: FAST-10 WIDE SCSI 13.5 MB/s ST (148.0 ns, offset 16)
sym0:9:wide msgout: 1-2-3-1.
sym0:9:wide msgin: 1-2-3-1.
sym0:9:wdtr: wide=1 chg=0.
sym0:9:sync msgout: 1-3-1-25-10.
sym0:9:sync msgin: 1-3-1-25-10.
sym0:9:sdtr: ofs=16 per=37 div=2 fak=2 chg=0.
 target0:0:9: Write Buffer failure 8000002
 target0:0:9: Domain Validation detected failure, dropping back
sym0:9:sync msgout: 1-3-1-37-10.
sym0:9:sync msgin: 1-3-1-38-10.
sym0:9:sdtr: ofs=16 per=56 div=4 fak=1 chg=0.
sym0:9: FAST-5 WIDE SCSI 8.9 MB/s ST (224.0 ns, offset 16)
sym0:9:wide msgout: 1-2-3-1.
sym0:9:wide msgin: 1-2-3-1.
sym0:9:wdtr: wide=1 chg=0.
sym0:9:sync msgout: 1-3-1-38-10.
sym0:9:sync msgin: 1-3-1-38-10.
sym0:9:sdtr: ofs=16 per=56 div=4 fak=1 chg=0.
 target0:0:9: Write Buffer failure 8000002
 target0:0:9: Domain Validation detected failure, dropping back
sym0:9:sync msgout: 1-3-1-54-10.
sym0:9:sync msgin: 1-3-1-57-10.
sym0:9: wide asynchronous.
sym0:9:0:M_REJECT to send for : 1-3-1-57-10.
sym0:9:sync msgout: 1-3-1-c-0.
sym0:9:sync msgin: 1-3-1-c-0.
sym0:9:sdtr: ofs=0 per=12 div=0 fak=0 chg=0.
 target0:0:9: Write Buffer failure 8000002
 target0:0:9: Domain Validation detected failure, dropping back
sym0:9:sync msgout: 1-3-1-7e-0.
sym0:9:sync msgin: 1-3-1-7e-0.
sym0:9:sdtr: ofs=0 per=126 div=0 fak=0 chg=0.
sym0:9:wide msgout: 1-2-3-1.
sym0:9:wide msgin: 1-2-3-1.
sym0:9:wdtr: wide=1 chg=0.
sym0:9:sync msgin: 1-3-1-c-1f.
sym0:9:sdtr: ofs=16 per=12 div=0 fak=0 chg=1.
sym0:9: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 16)
sym0:9:sync msgout: 1-3-1-c-10.
 target0:0:9: Write Buffer failure 8000002
 target0:0:9: Domain Validation detected failure, dropping back
sym0:9:sync msgout: 1-3-1-89-10.
sym0:9:sync msgin: 1-3-1-89-0.
sym0:9:sdtr: ofs=0 per=137 div=0 fak=0 chg=0.
sym0:9: wide asynchronous.
sym0:9:wide msgout: 1-2-3-1.
sym0:9:wide msgin: 1-2-3-1.
sym0:9:wdtr: wide=1 chg=0.
sym0:9:sync msgin: 1-3-1-c-1f.
sym0:9:sdtr: ofs=16 per=12 div=0 fak=0 chg=1.
sym0:9: FAST-20 WIDE SCSI 40.0 MB/s ST (50.0 ns, offset 16)
sym0:9:sync msgout: 1-3-1-c-10.
 target0:0:9: Write Buffer failure 8000002
 target0:0:9: Domain Validation Failure, dropping back to Asynchronous
 target0:0:9: Ending Domain Validation
sym0:9:sync msgout: 1-3-1-c-0.
sym0:9:sync msgin: 1-3-1-c-0.
sym0:9:sdtr: ofs=0 per=12 div=0 fak=0 chg=0.
sym0:9: wide asynchronous.
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi1: 53c710 rev 2
scsi1 : LASI SCSI 53c700
  Vendor: TOSHIBA   Model: CD-ROM XM-5301TA  Rev: 1895
  Type:   CD-ROM                             ANSI SCSI revision: 02
 target1:0:2: Beginning Domain Validation
scsi1: (2:0) Asynchronous
scsi1: (2:0) Synchronous at offset 8, period 236ns
 target1:0:2: Domain Validation skipping write tests
 target1:0:2: Ending Domain Validation
sym0:6:wide msgout: 1-2-3-1.
sym0:6:wide msgin: 1-2-3-1.
sym0:6:wdtr: wide=1 chg=0.
sym0:6:sync msgout: 1-3-1-c-f.
sym0:6:sync msgin: 1-3-1-c-f.
sym0:6:sdtr: ofs=15 per=12 div=0 fak=0 chg=0.
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
Attached scsi generic sg0 at scsi0, channel 0, id 6, lun 0,  type 0
Attached scsi generic sg1 at scsi0, channel 0, id 9, lun 0,  type 0
Attached scsi generic sg2 at scsi1, channel 0, id 2, lun 0,  type 5

--Boundary-00=_EfN0Bq8x0SMuXVk
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Boundary-00=_EfN0Bq8x0SMuXVk--
