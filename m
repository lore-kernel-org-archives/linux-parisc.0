Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA31383
	for <parisc-linux@puffin.external.hp.com>; Fri, 19 Jan 2001 11:25:01 -0700
Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by atlrel2.hp.com (Postfix) with ESMTP id 65F7A3D8
	for <parisc-linux@thepuffingroup.com>; Fri, 19 Jan 2001 13:28:45 -0500 (EST)
Received: from noam.fc.hp.com (mail@noam.fc.hp.com [15.1.52.69])
	by hpfcla.fc.hp.com (8.9.1/8.9.3 SMKit7.01) with ESMTP id LAA12253
	for <parisc-linux@thepuffingroup.com>; Fri, 19 Jan 2001 11:28:44 -0700 (MST)
Received: from localhost
	([127.0.0.1] helo=fc.hp.com ident=bame)
	by noam.fc.hp.com with esmtp (Exim 3.12 #1 (Debian))
	id 14JgHD-0003Uh-00
	for <parisc-linux@thepuffingroup.com>; Fri, 19 Jan 2001 11:28:43 -0700
To: parisc-linux@thepuffingroup.com
Date: Fri, 19 Jan 2001 11:28:43 -0700
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E14JgHD-0003Uh-00@noam.fc.hp.com>
Subject: [parisc-linux] palo, update to README.INSTALL
List-ID: <linux-parisc.vger.kernel.org>


palo's command line has changed since README.INSTALL was written, so
if you have a newer palo (for example
ftp://puffin.external.hp.com/pub/parisc/binaries/userspace/palo-20010118.tgz)
please note this change.

Where README.INSTALL uses 'palo -I -k ... /dev/sda' please change it
to 'palo -k ... -I /dev/sda' -- the -I option now requires an argument.

	-Paul Bame
