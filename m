Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA14428
	for <parisc-linux@puffin.external.hp.com>; Mon, 9 Oct 2000 17:50:12 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id DE470E97
	for <parisc-linux@thepuffingroup.com>; Mon,  9 Oct 2000 16:51:18 -0700 (PDT)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id QAA04061
	for parisc-linux@thepuffingroup.com; Mon, 9 Oct 2000 16:55:34 -0700 (PDT)
Date: Mon, 9 Oct 2000 16:55:34 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200010092355.QAA04061@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Fuzzy math (df output)
List-ID: <linux-parisc.vger.kernel.org>

Hi all,
I booted the latest kernel and mounted a local hard disk...ran
df to check space usage and got:

gggA180:/mnt# df
Filesystem           1k-blocks      Used Available Use% Mounted on
15.8.81.247:/tftpboot/hppa
                       7558400   5276568   1897880   0% /
/dev/sda3              1513684    223852   1212940   0% /mnt
gggA180:/mnt# 

Seems like the Use% numbers came from a presidential debate. :^)
If someone is looking for something to do...

thanks,
grant
