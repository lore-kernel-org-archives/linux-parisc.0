Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (router-100M.swansea.linux.org.uk [194.168.151.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3A2C7482A
	for <parisc-linux@parisc-linux.org>; Sun, 25 Mar 2001 16:52:39 -0700 (MST)
Received: from alan by the-village.bc.nu with local (Exim 2.12 #1)
	id 14hKMI-0000iy-00
	for parisc-linux@parisc-linux.org; Mon, 26 Mar 2001 00:55:42 +0100
To: parisc-linux@parisc-linux.org
Date: Mon, 26 Mar 2001 00:55:38 +0100 (BST)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E14hKMI-0000iy-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: [parisc-linux] The printf fiasco
List-ID: <linux-parisc.vger.kernel.org>

Actually you cant take the address. Instead your 

	(void *)printf

generates
	(void *)fprintf

and your program core dumps mysteriously at run time
