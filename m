Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from utnet2.utmem.edu (utnet2.utmem.edu [132.192.13.113])
	by dsl2.external.hp.com (Postfix) with ESMTP id 096BE482E
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Sep 2003 14:24:32 -0600 (MDT)
Received: from conversion-daemon.utnet2.utmem.edu by utnet2.utmem.edu
 (iPlanet Messaging Server 5.2 HotFix 0.9 (built Jul 29 2002))
 id <0HKW00J01VXP37@utnet2.utmem.edu> for parisc-linux@lists.parisc-linux.org;
 Mon, 08 Sep 2003 15:24:30 -0500 (CDT)
Received: from utmem.edu (medphys.utmem.edu [132.192.19.211])
 by utnet2.utmem.edu
 (iPlanet Messaging Server 5.2 HotFix 0.9 (built Jul 29 2002))
 with ESMTPS id <0HKW00IILWOTT5@utnet2.utmem.edu> for
 parisc-linux@lists.parisc-linux.org; Mon, 08 Sep 2003 15:24:30 -0500 (CDT)
Date: Mon, 08 Sep 2003 15:26:45 -0500
From: "Thaddeus A. Wilson" <tawilson@utmem.edu>
To: parisc-linux@lists.parisc-linux.org
Message-id: <3F5CE605.327AD964@utmem.edu>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Subject: [parisc-linux] problems installing debian on a c180
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

i had previously done some messing around with a c180 and at one time
figured
out how to install but have since lost my notes.

i have a c180 with an hp A4071B graphics card installed in GSC slot 3
and
recognized as HPA4071B_LZ

i know i previously had to enter "video=stifb:off" in the palo:

default when i choose to interact with ipl on boot as parameters to
kernal in
palo are:

1. 0/vmlinux
2. ramdisk_size=8192
3. initrd=0/ramdisk
4. console=tty0
5. sti=1/0/0
6. sti_font=VGA8x16
7. TERM=linux

if i accept default it gets past that message indicating a problem with
console
but the screen goes black although it looks as if the monitor is still
active
i.e. green light not a yellow one.

i am using the debian 3.0r1 disk as my boot disk.

i recall the last time i got the install to work i got a penguin in the
corner
but graphic install never worked and i had some difficulty with the x
server
starting.  any help on reinstallation would be appreciated i.e.
necessary mods
to the parameters on boot to get back to installing.

thanks in advance and sorry for regressing.
