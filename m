Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA13725
	for <parisc-linux@puffin.external.hp.com>; Fri, 28 Jan 2000 14:28:16 -0700
From: willy@thepuffingroup.com
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id QAA09895
	for parisc-linux@thepuffingroup.com; Fri, 28 Jan 2000 16:29:52 -0500
Date: Fri, 28 Jan 2000 16:29:52 -0500
To: parisc-linux@thepuffingroup.com
Message-ID: <20000128162952.W32390@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] does make menuconfig break for you?
List-ID: <linux-parisc.vger.kernel.org>


i've been testing out make menuconfig and i've realised why it breaks for
a lot of people.

if you get something like this output:

/bin/bash scripts/Menuconfig arch/parisc/config.in
Using defaults found in .config
Preparing scripts: functions, parsingawk: Cannot open file drivers/sound/Config.in.
        A maximum of 54 files can be open at one time.
 The source line number is 10.
Awk died with error code 2. Giving up.
........................scripts/Menuconfig: ./MCmenu30: line 6: syntax error: unexpected end of file


then this means the number of files you may have open simultaneously is
too low.  the default under hpux seems to be 60.  to fix this, type:

/usr/bin/ulimit -n 100

which is enough to work for me.  happy configuring..
