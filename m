Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id A0BE5482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 24 May 2002 06:55:50 -0600 (MDT)
Received: from www-data by webmail.tiscalinet.be with local (Tiscali)
	id 17BEbk-0007WV-00
	for <parisc-linux@lists.parisc-linux.org>; Fri, 24 May 2002 14:55:48 +0200
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1022244947.3cee385378f63@webmail.tiscalinet.be>
Date: Fri, 24 May 2002 14:55:47 +0200 (CEST)
From: joel.soete@freebel.net
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] raid-1 on boot disk
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

Hi all,

I just find a spare disk for my b180 and would like to test md mirroring on my
boot disk.

I am just a bit affraided because Software-RAID-HOWTO mentioned that the
persistent-superblock (requested for boot disk) is writen at the begining of disks.

Is somebody has already test this config and raidtools2 ?

Thanks in advance for info
    Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
