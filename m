Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA19973
	for <parisc-linux@puffin.external.hp.com>; Fri, 25 Aug 2000 15:47:10 -0600
Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by cosrel1.hp.com (Postfix) with ESMTP id DBCAE62E
	for <parisc-linux@thepuffingroup.com>; Fri, 25 Aug 2000 15:47:12 -0600 (MDT)
Received: from noam.fc.hp.com (mail@noam.fc.hp.com [15.1.52.69])
	by hpfcla.fc.hp.com (8.9.1/8.9.3 SMKit7.01) with ESMTP id PAA07943
	for <parisc-linux@thepuffingroup.com>; Fri, 25 Aug 2000 15:47:05 -0600 (MDT)
Received: from localhost
	([127.0.0.1] helo=noam.fc.hp.com ident=bame)
	by noam.fc.hp.com with esmtp (Exim 3.12 #1 (Debian))
	id 13SRJl-0001kq-00
	for <parisc-linux@thepuffingroup.com>; Fri, 25 Aug 2000 15:47:17 -0600
To: parisc-linux@thepuffingroup.com
Date: Fri, 25 Aug 2000 15:47:17 -0600
From: Paul Bame <bame@noam.fc.hp.com>
Message-Id: <E13SRJl-0001kq-00@noam.fc.hp.com>
Subject: [parisc-linux] 64-bit cross compiler broken
List-ID: <linux-parisc.vger.kernel.org>


The current 64-bit cross compiler dies on drivers/block/rd.c
