Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA23923
	for <parisc-linux@puffin.external.hp.com>; Tue, 13 Jun 2000 23:04:27 -0600
Received: from localhost (catfish@localhost)
	by jesse.crash.lan (8.9.3/8.9.3) with ESMTP id AAA14632
	for <parisc-linux@thepuffingroup.com>; Wed, 14 Jun 2000 00:05:06 -0500
Date: Wed, 14 Jun 2000 00:05:06 -0500 (CDT)
From: "T. Martin" <catfish@alltel.net>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.10.10006140003580.14629-100000@jesse.crash.lan>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] oops, egcs didn't build all the way...
List-ID: <linux-parisc.vger.kernel.org>

egcs failed to build, 
RH 6.1
ar: libE77/Labort.o: No such file or directory
make[2]: *** [libg2c.a] Error 1
make[2]: Leaving directory `/opt/puffin/egcs/i586-pc-linux-gnu/libf2c'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/opt/puffin/egcs/i586-pc-linux-gnu/libf2c'
make: *** [all-target-libf2c] Error 2
[root@jesse egcs]# 
with that error any suggestions? 
Thanks 
Terry

catfish: icq #20116127
