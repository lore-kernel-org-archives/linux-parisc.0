Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.inka.de (quechua.inka.de [212.227.14.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 097AB482C
	for <parisc-linux@lists.parisc-linux.org>; Sat, 24 Nov 2001 08:07:51 -0700 (MST)
Date: Sat, 24 Nov 2001 16:07:48 +0100
From: Bernd Eckenfels <lists@lina.inka.de>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20011124160748.B18913@lina.inka.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 715/50 does not find image on cd
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

Hi,

perhaps someone can help me with that problem, I have a 715/50 which is
reporting:

PDC ROM rev. 1.3
IODC ROM rev. 1.1
96MB RAM

I have attached an externel SCSI CD-ROM. On Power on, it finds two devices,
the internal Quantum disk on scsi.6.0 and the CDROM on scsi.5.0. But it
refuses to boot from the CD rom. I tried a 0.9 Debian Image and Original
HP-UX 9.0 and 10.20 Disks.

If I do a "search" in boot admin, it does not list me any "bootable media".

Looks to me, like it is seeing the CDROM, but unable to find the IPL on it?

Well... anybdy has an idea what to do?

I thought the Firmaware may be the problem, but I dont know where i see the
firmware revision and how to update it.. 

info tells me:

processor revision = 9
system controller = 0
FP CoPro revision = 1

HW Version = 0x3100
SW Version = 0x0481

Greetings
Bernd
