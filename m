Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id EA6594829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  1 Jun 2003 06:29:49 -0600 (MDT)
Received: from localhost (localhost [127.0.0.1])
	by transport.cksoft.de (Postfix) with ESMTP id 663021FFBCA
	for <parisc-linux@lists.parisc-linux.org>; Sun,  1 Jun 2003 14:29:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.int.zabbadoz.net (Postfix) with ESMTP id 1B32A1532F
	for <parisc-linux@lists.parisc-linux.org>; Sun,  1 Jun 2003 12:29:27 +0000 (UTC)
Date: Sun, 1 Jun 2003 12:29:27 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.BSF.4.53.0306011216560.1237@e0-0.zab2.int.zabbadoz.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] palo & recoverykernel
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

Hi,

I am currently using:

--commandline=3/boot/vmlinux-2.5.70-pa4 root=/dev/sdb3 HOME=/ TERM=linux console=ttyS0
--recoverykernel=/boot/vmlinux-2.5.69-pa1
--init-partitioned=/dev/sdb

in palo.conf.

Now if commandline kernel will not boot is there a way to tell palo to
boot recovery kernel when entered boot pri/alt ipl ?
Is it possible to do this without manually changing the path (one has
to know ?) by editing field 0 and then use 'b' to boot ?

Or is there a chance to have an alternate boot option on the palo menu ?

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
