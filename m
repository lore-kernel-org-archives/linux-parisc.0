From: Joel Soete <soete.joel@tiscali.be>
Subject: [parisc-linux] c110: kernel 2.6.10-rc1-pa17 pb to boot if a cdrom
	is in the drive
Date: Sat, 27 Nov 2004 19:34:24 +0000
Message-ID: <41A8D6C0.7000306@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
To: maillist parisc-linux <parisc-linux@lists.parisc-linux.org>
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

I grab a support+ cdrom to test a scsi disk of model "SEAGATE ST34573W" with ode diskutil.

As it didn't detect any disk read error, I want to reboot linux kernel on my c110 but I forget to remove the cdrom from it's drive.
And I got following pb when I reboot linux (kernel 2.6.10-rc1-pa10:
[...]
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi1: 53c710 rev 2
scsi1 : LASI SCSI 53c700
   Vendor: HP        Model: DVD-ROM 6x/32x    Rev: 1.08
   Type:   CD-ROM                             ANSI SCSI revision: 02
  target1:0:0: Beginning Domain Validation
scsi1: (0:0) Asynchronous
scsi1: (0:0) Synchronous at offset 8, period 100ns
  target1:0:0: Echo buffer size 5280 is too big, trimming to 4096
  target1:0:0: Domain Validation detected failure, dropping back
scsi1: (0:0) Synchronous at offset 8, period 152ns
  target1:0:0: Domain Validation detected failure, dropping back
scsi1: (0:0) Synchronous at offset 8, period 252ns
  target1:0:0: Domain Validation detected failure, dropping back
scsi1: (0:0) Synchronous at offset 8, period 400ns
scsi1 (0:0) New error handler wants to abort command
         scsi1 : destination target 0, lun 0
         command = 0x03 00 00 00 60 00
scsi1 (0:0) New error handler wants device reset
         scsi1 : destination target 0, lun 0
         command = 0x03 00 00 00 60 00
scsi1 (0:0) New error handler wants BUS reset, cmd 2fd1ab60
         scsi1 : destination target 0, lun 0
         command = 0x03 00 00 00 60 00
scsi1: Bus Reset detected, executing command 2fd1ab60, slot 2fd70520, dsp 001d8528[0528]
  failing command because of reset, slot 2fd70520, cmnd 2fd1ab60
scsi1 (0:0) broken device is looping in contingent allegiance: ignoring
scsi1 (0:0) New error handler wants to abort command
         scsi1 : destination target 0, lun 0
         command = 0x03 00 00 00 60 00
scsi1 (0:0) New error handler wants device reset
         scsi1 : destination target 0, lun 0
         command = 0x03 00 00 00 60 00
scsi1 (0:0) New error handler wants BUS reset, cmd 2fd1ab60
         scsi1 : destination target 0, lun 0
         command = 0x03 00 00 00 60 00
scsi1: Bus Reset detected, executing command 2fd1ab60, slot 2fd70520, dsp 001d8528[0528]
  failing command because of reset, slot 2fd70520, cmnd 2fd1ab60
scsi1 (0:0) broken device is looping in contingent allegiance: ignoring
scsi1 (0:0) New error handler wants to abort command
         scsi1 : destination target 0, lun 0
         command = 0x03 00 00 00 60 00
scsi1 (0:0) New error handler wants device reset
         scsi1 : destination target 0, lun 0
         command = 0x03 00 00 00 60 00
scsi1 (0:0) New error handler wants BUS reset, cmd 2fd1ab60
         scsi1 : destination target 0, lun 0
         command = 0x03 00 00 00 60 00
scsi1: Bus Reset detected, executing command 2fd1ab60, slot 2fd70520, dsp 001d8528[0528]
  failing command because of reset, slot 2fd70520, cmnd 2fd1ab60
scsi1 (0:0) broken device is looping in contingent allegiance: ignoring
scsi1 (0:0) broken device is looping in contingent allegiance: ignoring
  target1:0:0: Domain Validation detected failure, dropping back
scsi1: (0:0) Synchronous at offset 0, period 0ns
  target1:0:0: Domain Validation detected failure, dropping back
scsi1: (0:0) Asynchronous
  target1:0:0: Domain Validation Failure, dropping back to Asynchronous
  target1:0:0: Ending Domain Validation
   Vendor: SEAGATE   Model: ST34573W          Rev: HP11
   Type:   Direct-Access                      ANSI SCSI revision: 02
  target1:0:3: Beginning Domain Validation

until I remove the cdrom then it continue the boot:
scsi1: (3:0) Asynchronous
scsi1: (3:0) Enabling Tag Command Queuing
scsi1: (3:0) Synchronous at offset 8, period 100ns
  target1:0:3: Domain Validation skipping write tests
  target1:0:3: Ending Domain Validation
...

Any idea?

Thanks in advance,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
