Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from post.webmailer.de (natwar.webmailer.de [192.67.198.70])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2191B482C
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Dec 2001 01:24:39 -0700 (MST)
Received: from there (fwr-01.mediadesign.de [212.185.42.202])
	by post.webmailer.de (8.9.3/8.8.7) with SMTP id JAA20988
	for <parisc-linux@lists.parisc-linux.org>; Mon, 3 Dec 2001 09:20:28 +0100 (MET)
Message-Id: <200112030820.JAA20988@post.webmailer.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Joerg Hartmann <j.hartmann@reinarts.de>
To: parisc-linux@lists.parisc-linux.org
Date: Mon, 3 Dec 2001 09:24:36 +0100
MIME-Version: 1.0
Subject: [parisc-linux] init error on a 720
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

Hello Guru's,

as you guess, i like to install Linux on a HP Workstation.
It is an hp9000 model 720.
And here the problem starts - on some websites is stated that pa-risc 
linux will never work on 720's  on some other sites i can read it does !
Maybe it depends - but on what ? 

So i took the 0.9.2 iso-image from www.parisc-linux.org and tried an 
installation. After switching to serial console i could see the kernel 
coming up until it has to start "init" - than it loops forever with

handle_interruption() pid=1 command='init'

On the list archive i found, that some other people had the same problem, 
even with 720 models.  But i could not find a solution which works for me.
If there is one , could you please tell me where to RTFM ?

Here are some hardware infos :

Found devices:
1. Coral SGC Graphics (10) at 0xf8000000, versions 0x4, 0x0, 0x77, 0x0, 
0x0
2. Cobra Core BA (11) at 0xf082f000, versions 0x4, 0x0, 0x70, 0x0, 0x0
3. Cobra Core SCSI (10) at 0xf0825000, versions 0x4, 0x0, 0x71, 0x0, 0x0
4. Cobra Core LAN (802.3) (10) at 0xf0826000, versions 0x4, 0x0, 0x72, 
0x0, 0x0
5. Cobra Core HIL (10) at 0xf0821000, versions 0x4, 0x0, 0x73, 0x0, 0x0
6. Cobra Core RS-232 (10) at 0xf0823000, versions 0x4, 0x0, 0x75, 0x0, 0x0
7. Cobra Core RS-232 (10) at 0xf0822000, versions 0x4, 0x0, 0x75, 0x0, 0x0
8. Cobra Core Centronics (10) at 0xf0824000, versions 0x4, 0x0, 0x74, 
0x0, 0x0
9. Cobra (720) (0) at 0xfffbe000, versions 0x200, 0x0, 0x4, 0x0, 0x81
10. Cobra (1) at 0xfffbf000, versions 0x13, 0x0, 0x9, 0x0, 0x0
That's a total of 10 devices.
CPU(s): 1 x PA7000 (PCX-S) at 50.000000 MHz

And there is a second problem with the scsi bus :

sim700: Configuring 53c700 (SCSI-ID 7) at f0825100, IRQ 86, options 1
scsi0: Revision 0x0
scsi0: test 1 completed ok.
scsi0 : LASI/Simple 53c7xx
scsi0: Unable to abort command for target 0
scsi0: Unable to send Bus Device Reset for target 0
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: istat = 0c, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 0b8f8058 (script[0x0016]), dsps = 0b8f8cee, target = 0
scsi0: Failing command for ID0
scsi0: Unable to abort command for target 0
scsi0: Unable to abort command for target 1
scsi0: Unable to send Bus Device Reset for target 1
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: istat = 0c, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 0b8f8058 (script[0x0016]), dsps = 0b8f8cee, target = 0
scsi0: Failing command for ID0
  Vendor: IBM       Model: CDRM00203     !K  Rev: BZ33
  Type:   CD-ROM                             ANSI SCSI revision: 02
  Vendor: HP        Model: HP35480A          Rev: TI00
  Type:   Sequential-Access                  ANSI SCSI revision: 02
  Vendor: HP        Model: 97560             Rev: 0BW2
  Type:   Direct-Access                      ANSI SCSI revision: 02
Detected scsi disk sda at scsi0, channel 0, id 5, lun 0
SCSI device sda: 2647080 512-byte hdwr sectors (1355 MB)
Partition check:
 sda: unknown partition table

I realy hope you can point me to the right direction. 
If i can not  get linux up and running on that box, this computer will be 
put in the waste basket :-(

regards
			Jörg Hartmann
-- 
Joerg Hartmann
j.hartmann@reinarts.de
