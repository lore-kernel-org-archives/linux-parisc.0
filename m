Return-Path: <rollei@tiscalinet.it>
Received: from smtp1.libero.it (smtp1.libero.it [193.70.192.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 137154868
	for <parisc-linux@lists.parisc-linux.org>;
	Wed,  7 Jan 2004 16:44:10 -0700 (MST)
Received: from tiscalinet.it (151.38.68.2) by smtp1.libero.it (7.0.020-DD01)
	(authenticated as zuse@libero.it)
	id 3F6F0E4801F0CF53 for parisc-linux@lists.parisc-linux.org;
	Thu, 8 Jan 2004 00:44:39 +0100
Sender: multix@dsl2.external.hp.com
Message-ID: <3FFC9A15.6FA66B2@tiscalinet.it>
Date: Thu, 08 Jan 2004 00:45:25 +0100
From: Riccardo <rollei@tiscalinet.it>
MIME-Version: 1.0
To: parisc linux <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] scsi problem on a scorpio (715)
Reply-To: rollei@tiscalinet.it
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hello,

I had a lot of problems using linux on that box (I'm using gentoo,
2.4.23 series)

The problems manifest themselves in the following ways:

A lot of different HD's (even HP spare parts) freeze up the kernel
during mkfs.
I got the box then worning with a luck of getting two disk formatted.
The stability was not very high. Sometimes it compiled for 50 hours, but
sometimes when the disk grinded more... freeze.
Guy Martin suggested me to change the TAG default value in the NCR
53x700 driver from 16 to 8 since that is what HP used. I didn't get a
big improvment. I still have one of the inriminated disks. Issuing
several mkfs (usually the second) freezes the kernel.

Today during emerge sync the system freezed. I rebooted and the computer
zasn't responding to ssh or ping. When I hooked up a monitor I got a
hole load of errors clearly related to scsi.

I toke a picture of the monitor.

http://dev.gentoo.org/~gmsoft/pics/scsi-failure.jpg


-Ric
