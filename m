Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id B2232482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 12 Oct 2001 09:03:41 -0600 (MDT)
To: Grant Grundler <grundler@puffin.external.hp.com>
Message-ID: <1002899016.3bc70648db602@webmail.tiscalinet.be>
Date: Fri, 12 Oct 2001 17:03:36 +0200 (CEST)
From: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] Kernel panic with -pa48
List-ID: <linux-parisc.vger.kernel.org>

Hi Grant,

I met following problem with pa48 (on a 712/80):

...
VFS: Cannot open root device "sda3" or "08:03"
Please append a correct "root=" boot option
Kernel panic: vfs Unable to mount root fs on "08:03"

(I check if the fs is still correct. And I can still boot with 2.4.9-pa45.
So it could not any more recognise ext2fs)

Is it in relation with your mail:
http://lists.parisc-linux.org/pipermail/parisc-linux/2001-October/014100.html

Thanks in adavance for advice,
        joel

PS: I had the same problem with or without LASI700 support

-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
