Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 85BE1482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 May 2002 07:07:10 -0600 (MDT)
Received: from www-data by webmail.tiscalinet.be with local (Tiscali)
	id 177c1F-0002ke-00
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 May 2002 15:07:09 +0200
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1021381629.3ce10bfd90522@webmail.tiscalinet.be>
Date: Tue, 14 May 2002 15:07:09 +0200 (CEST)
From: joel.soete@freebel.net
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] Try to boot b2000 failled?
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

To split my gcc-3.2 and gcc-3.1 env on two different server (need disk space
also), I would like to install a free b2000 workstation.

To do this i choose lan install (no possibilty for external scsi-cdrom and no
more place to rebuild a new cdimage with recent kernel); I configure my palinux
b180 as bootp-tftp server and configure in accordance with
http://pateam.esiee.fr/parisc-linux-boot/parisc-linux-boot/preparation.html.

In b2000 BOOT_ADMIN> boot lan, the lifimage (build with cvs palo & kernel
2.4.18-24 which boot well on my b180) is well found and launched but hang just
after "Searching for devices..." and the green light on the ide cd-rom driver
stay lighted?

Thanks in advance for help,
    Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
