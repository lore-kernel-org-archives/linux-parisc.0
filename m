Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp2.libero.it (smtp2.libero.it [193.70.192.52])
	by dsl2.external.hp.com (Postfix) with ESMTP id 73D2C4868
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 Oct 2003 17:41:59 -0600 (MDT)
Received: from [192.168.1.10] (151.37.44.117) by smtp2.libero.it (7.0.020-DD01)
        id 3F6F0DA900842D76 for parisc-linux@lists.parisc-linux.org; Thu, 16 Oct 2003 01:42:35 +0200
Date: Thu, 16 Oct 2003 01:40:42 +0200
From: Riccardo Mottola <rollei@tiscalinet.it>
To: parisc <parisc-linux@lists.parisc-linux.org>
Message-ID: <BBB3A799.977A%rollei@tiscalinet.it>
Mime-version: 1.0
Content-type: text/plain; charset="US-ASCII"
Subject: [parisc-linux] scsi problems on a 720
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

Hello,

I tried to install linux (specifically gentoo, but the same problem appears
using debian too) and had mysterious kernel freezes.
The guys at gentoo-hppa told me to ask here since they didn't know further.

I have a 9000/720. The computer runs without problem using HP-UX.

I have added a second drive, an IBM, 2GB. Using mediainit from hp-ux reports
no errors.

If I try to put a new filesystem like ext2 or ext3 on the big (about 2gb)
partition, the kernel will freeze while running mkfs. Frreze means no
output, no error messages. The heartbeat stops.
Putting reisers seems to work, but after downloading  and  uncompressing a
big file, i get the same error-less kernel freeze.

this is what dmesg reports:
3. Cobra Core SCSI (10) at 0xf0825000 [2/0/1], versions 0x4, 0x0, 0x71
SCSI subsystem driver Revision: 1.00
scsi0 : LASI SCSI 53c700
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Type:   CD-ROM                             ANSI SCSI revision: 02
SCSI device sda: 2051460 512-byte hdwr sectors (1050 MB)
SCSI device sdb: 4404489 512-byte hdwr sectors (2255 MB)

and this is seen in lsmod:
lasi700                 1684   1
53c700                 27564   0  [lasi700]

thanks, Riccardo
