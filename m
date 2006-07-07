From: Joel Soete <soete.joel@tiscali.be>
Subject: [parisc-linux] 2.6.18-rc1-pa1: new 53c710 driver's errors?
Date: Fri, 07 Jul 2006 16:46:19 +0000
Message-ID: <44AE8FDB.7010304@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
To: James Bottomley <James.Bottomley@SteelEye.com>,
 Parisc List <parisc-linux@lists.parisc-linux.org>
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

Hello James,

I was testing newest 2.6.18-rc1-pa1 on my c110; on this model an narrow single ended scsi disk is pluged in the external connection 
  drived by your driver 53c710:
[snip]
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi1: 53c710 rev 2
scsi1 : LASI SCSI 53c700
[snip]

Unfortunaltely at the middle of the sw upgrade (apt-get dist-upgrade) some failures occured:
[snip]
Jul  7 17:24:08 hpalin kernel: scsi1: (3:0) phase mismatch at 01e8, phase IO CD MSG BSY REQ MSG IN
Jul  7 17:24:08 hpalin kernel: scsi1: Bus Reset detected, executing command 2fe93ce0, slot 2fd6864c, dsp 000a01e8[01e8]
Jul  7 17:24:08 hpalin kernel:  failing command because of reset, slot 2fd6864c, cmnd 2fe93ce0
Jul  7 17:24:09 hpalin kernel: scsi1: (3:0) phase mismatch at 01e8, phase IO BSY DATA_IN
Jul  7 17:24:09 hpalin kernel: scsi1: Bus Reset detected, executing command 2fe93ce0, slot 2fd6864c, dsp 000a01e8[01e8]
Jul  7 17:24:09 hpalin kernel:  failing command because of reset, slot 2fd6864c, cmnd 2fe93ce0
Jul  7 17:24:10 hpalin kernel: scsi1: (3:0) phase mismatch at 01e8, phase IO BSY DATA_IN
Jul  7 17:24:10 hpalin kernel: scsi1: Bus Reset detected, executing command 2fe93ce0, slot 2fd6864c, dsp 000a01e8[01e8]
Jul  7 17:24:10 hpalin kernel:  failing command because of reset, slot 2fd68520, cmnd 2fe93920
Jul  7 17:24:10 hpalin kernel:  failing command because of reset, slot 2fd6864c, cmnd 2fe93ce0
Jul  7 17:24:10 hpalin kernel:  failing command because of reset, slot 2fd68778, cmnd 2fe93420
Jul  7 17:24:10 hpalin kernel:  failing command because of reset, slot 2fd688a4, cmnd 2fe936a0
Jul  7 17:24:47 hpalin kernel: scsi1: (3:0) phase mismatch at 01e8, phase IO BSY DATA_IN
Jul  7 17:24:47 hpalin kernel: scsi1: Bus Reset detected, executing command 2fe93920, slot 2fd688a4, dsp 000a01e8[01e8]
Jul  7 17:24:11 hpalin kernel:  failing command because of reset, slot 2fd68520, cmnd 2fe936a0
Jul  7 17:24:11 hpalin kernel:  failing command because of reset, slot 2fd6864c, cmnd 2fe93420
Jul  7 17:24:11 hpalin kernel:  failing command because of reset, slot 2fd68778, cmnd 2fe93ce0
Jul  7 17:24:11 hpalin kernel:  failing command because of reset, slot 2fd688a4, cmnd 2fe93920
Jul  7 17:24:12 hpalin kernel: scsi1: (3:0) phase mismatch at 01e8, phase IO BSY DATA_IN
Jul  7 17:24:47 hpalin kernel: scsi1: Bus Reset detected, executing command 2fe93920, slot 2fd688a4, dsp 000a01e8[01e8]
Jul  7 17:24:11 hpalin kernel:  failing command because of reset, slot 2fd68520, cmnd 2fe936a0
Jul  7 17:24:11 hpalin kernel:  failing command because of reset, slot 2fd6864c, cmnd 2fe93420
Jul  7 17:24:11 hpalin kernel:  failing command because of reset, slot 2fd68778, cmnd 2fe93ce0
Jul  7 17:24:11 hpalin kernel:  failing command because of reset, slot 2fd688a4, cmnd 2fe93920
Jul  7 17:24:12 hpalin kernel: scsi1: (3:0) phase mismatch at 01e8, phase IO BSY DATA_IN
Jul  7 17:24:12 hpalin kernel: scsi1: Bus Reset detected, executing command 2fe936a0, slot 2fd688a4, dsp 000a01e8[01e8]
Jul  7 17:24:12 hpalin kernel:  failing command because of reset, slot 2fd68520, cmnd 2fe93920
Jul  7 17:24:12 hpalin kernel:  failing command because of reset, slot 2fd6864c, cmnd 2fe93ce0
Jul  7 17:24:12 hpalin kernel:  failing command because of reset, slot 2fd68778, cmnd 2fe93420
Jul  7 17:24:12 hpalin kernel:  failing command because of reset, slot 2fd688a4, cmnd 2fe936a0
Jul  7 17:24:13 hpalin kernel: scsi1: (3:0) phase mismatch at 01e8, phase IO BSY DATA_IN
Jul  7 17:24:13 hpalin kernel: scsi1: Bus Reset detected, executing command 2fe93920, slot 2fd688a4, dsp 000a01e8[01e8]
Jul  7 17:24:13 hpalin kernel:  failing command because of reset, slot 2fd68520, cmnd 2fe936a0
Jul  7 17:24:13 hpalin kernel:  failing command because of reset, slot 2fd6864c, cmnd 2fe93420
Jul  7 17:24:13 hpalin kernel:  failing command because of reset, slot 2fd68778, cmnd 2fe93ce0
Jul  7 17:24:13 hpalin kernel:  failing command because of reset, slot 2fd688a4, cmnd 2fe93920
Jul  7 17:24:14 hpalin kernel: scsi1: (3:0) phase mismatch at 01e8, phase IO BSY DATA_IN
[snip]
Jul  7 17:30:13 hpalin kernel: scsi1: (3:0) phase mismatch at 01e8, phase IO BSY DATA_IN
Jul  7 17:30:13 hpalin kernel: scsi1: Bus Reset detected, executing command 2fe93920, slot 2fd688a4, dsp 000a01e8[01e8]
Jul  7 17:30:13 hpalin kernel:  failing command because of reset, slot 2fd68520, cmnd 2fe936a0
Jul  7 17:30:13 hpalin kernel:  failing command because of reset, slot 2fd6864c, cmnd 2fe93420
Jul  7 17:30:13 hpalin kernel:  failing command because of reset, slot 2fd68778, cmnd 2fe93ce0
Jul  7 17:30:13 hpalin kernel:  failing command because of reset, slot 2fd688a4, cmnd 2fe93920
Jul  7 17:30:14 hpalin kernel: scsi1: (3:0) phase mismatch at 01e8, phase IO BSY DATA_IN
Jul  7 17:30:14 hpalin kernel: scsi1: Bus Reset detected, executing command 2fe936a0, slot 2fd688a4, dsp 000a01e8[01e8]
Jul  7 17:30:14 hpalin kernel:  failing command because of reset, slot 2fd68520, cmnd 2fe93920
Jul  7 17:30:14 hpalin kernel:  failing command because of reset, slot 2fd6864c, cmnd 2fe93ce0
Jul  7 17:30:14 hpalin kernel:  failing command because of reset, slot 2fd68778, cmnd 2fe93420
Jul  7 17:30:14 hpalin kernel:  failing command because of reset, slot 2fd688a4, cmnd 2fe936a0
<end>

and seems to finaly panic (but I tried first to reboot?)

Any idea?

TIA,
	Joel

PS: with previous kernel I read just:
[snip]
May 28 00:26:07 hpalin kernel: scsi1: (3:0) phase mismatch at 01e8, phase IO CD MSG BSY REQ MSG IN
May 28 00:26:07 hpalin kernel: scsi1: Bus Reset detected, executing command 226c8320, slot 2fe988a4, dsp 000a01e8[01e8]
May 28 00:26:07 hpalin kernel:  failing command because of reset, slot 2fe98520, cmnd 2fe2b060
May 28 00:26:07 hpalin kernel:  failing command because of reset, slot 2fe9864c, cmnd 2fe2b8a0
May 28 00:26:07 hpalin kernel:  failing command because of reset, slot 2fe98778, cmnd 2fe2ba00
May 28 00:26:07 hpalin kernel:  failing command because of reset, slot 2fe988a4, cmnd 226c8320
[snip]

from time to time but wasn't looping; and this also on a brotherhood arch: d380.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
