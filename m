From: Joel Soete <soete.joel@tiscali.be>
Subject: [parisc-linux] 2.6.12-rc1-pa1 32bit panicing on c110 :-( (BUG in
	53c700.c)
Date: Sat, 19 Mar 2005 21:24:22 +0000
Message-ID: <423C9886.8030402@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
To: James Bottomley <james.bottomley@steeleye.com>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
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

Sorry for the second wrong news but after the init of ncr53c720-0:
zalon_probe: Zalon version 1, IRQ 66
ncr53c720-0: rev 0xf irq 66
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
scsi0 : ncr53c8xx-3.4.3g
  target0:0:5: target did not report SYNC.
   Vendor: SEAGATE   Model: ST34371W          Rev: HP03
   Type:   Direct-Access                      ANSI SCSI revision: 02
  target0:0:5: Beginning Domain Validation
  target0:0:5: asynchronous.
  target0:0:5: wide asynchronous.
  target0:0:5: Domain Validation skipping write tests
  target0:0:5: FAST-10 WIDE SCSI 20.0 MB/s ST (100 ns, offset 8)
  target0:0:5: Ending Domain Validation
  target0:0:6: target did not report SYNC.
   Vendor: SEAGATE   Model: ST34371W          Rev: HP03
   Type:   Direct-Access                      ANSI SCSI revision: 02
  target0:0:6: Beginning Domain Validation
  target0:0:6: asynchronous.
  target0:0:6: wide asynchronous.
  target0:0:6: Domain Validation skipping write tests
  target0:0:6: FAST-10 WIDE SCSI 20.0 MB/s ST (100 ns, offset 8)
  target0:0:6: Ending Domain Validation
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi1: 53c710 rev 2
scsi1 : LASI SCSI 53c700
scsi1: (3:0) HAS NO device
kernel BUG at /Debian-apt/SRC/linux-2.6.12-rc1-pa1-050319/drivers/scsi/53c700.c!Backtrace:
  [<10285488>] process_script_interrupt+0x80c/0xe84
  [<10286ae8>] NCR_700_intr+0x8c4/0xf90
  [<10144bc8>] handle_IRQ_event+0x50/0xa4
  [<10144d44>] __do_IRQ+0x128/0x174
  [<1021816c>] gsc_asic_intr+0x98/0xb4
  [<10144bc8>] handle_IRQ_event+0x50/0xa4
  [<10144d44>] __do_IRQ+0x128/0x174
  [<10106ee8>] do_cpu_irq_mask+0x7c/0xd8
  [<1010c068>] intr_return+0x0/0x14
  [<1020e8f0>] idr_get_new_above_int+0xa4/0x164
  [<10167980>] sys_utime+0x114/0x19c
  [<101124d8>] cpu_idle+0xc/0x3c
  [<10411488>] start_kernel+0x1c8/0x1f4

Kernel panic - not syncing: BUG!

Thanks,
     Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
