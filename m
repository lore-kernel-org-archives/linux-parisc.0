Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.web.de (smtp01.web.de [194.45.170.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id CA11F483C
	for <parisc-linux@lists.parisc-linux.org>; Sun,  6 Jan 2002 10:40:57 -0700 (MST)
Received: from pd9eb1c78.dip.t-dialin.net ([217.235.28.120] helo=web.de)
	by smtp.web.de with asmtp (Exim 4.00 #56)
	id 16NHHv-0001l2-00
	for parisc-linux@lists.parisc-linux.org; Sun, 06 Jan 2002 18:40:51 +0100
Message-ID: <3C388C82.6070509@web.de>
Date: Sun, 06 Jan 2002 18:42:26 +0100
From: Sven Cronenberg <sven.cronenberg@web.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] PALinux on HP9000/735-125
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

I installed PALinux 0.93 on my HP9000/735 running hat 125Mhz. I use
a SCSI Disk connected to the narrow SCSI canel and the CRX48z
graphics system.

Im using kernel version 2.14.16-pa24 and updated the debian packages like
mentioned in the 0.9.3. errata section today.

Some questions:
- I tried execessing the framebufferdevice. 'fbset' report '/dev/fb0: no 
such device'
  though the STI console works fine as a text-console. Whats the reasion 
for that error?
  Can I currently use the framebuffer device on the HP9000/735?
- has someone been able to make the 100mbit EISA-ethernet-card 3c597 work
  in the HP9000/735 under Linux?
- can I enable a german keymap for the HIL keyboard (trying to do this 
during the
  installation made the keyboard totaly unusable so I had to reboot )?
- is the HIL mouse still unsupported or is there a patch or so to make 
it work?


But inspite of all these problems:
Nice work. It's great to see my PARISC Box running a free operating 
system instead
the obsolute HPUX 10.20.


Sven
