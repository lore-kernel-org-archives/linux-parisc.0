Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0BEA0483B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 28 Jun 2002 07:05:46 -0600 (MDT)
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1025269543.3d1c5f27b0669@webmail.tiscalinet.be>
Date: Fri, 28 Jun 2002 15:05:43 +0200 (CEST)
From: joel.soete@freebel.net
Cc: Robert Boehm <robertb@olsztyn.ken.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] PPP /dev/ppp temporary unavailable
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

Thanks to advises of Robert I reach to configure the serials port of my b180 and
b2000 (No success with my 712?) to make serial ppp connection with MyIsp.

But I still log following messages:

Jun 28 09:46:22 palinux pppd[310]: Script /etc/ppp/ip-up started (pid 316)
Jun 28 09:46:23 palinux pppd[310]: Script /etc/ppp/ip-up finished (pid 316),
status = 0x0
Jun 28 09:46:23 palinux pppd[310]: read: Resource temporarily unavailable
Jun 28 09:46:23 palinux pppd[310]: read /dev/ppp: Resource temporarily unavailable
Jun 28 09:46:25 palinux pppd[310]: read: Resource temporarily unavailable
Jun 28 09:46:25 palinux pppd[310]: read /dev/ppp: Resource temporarily unavailable
Jun 28 09:46:25 palinux pppd[310]: read: Resource temporarily unavailable
Jun 28 09:46:25 palinux pppd[310]: read /dev/ppp: Resource temporarily unavailable
What does it means?

Even thought all seems to works fine (host ftp.de.debian.org, ncftp
ftp.de.debian.org, lynx debian.org; all seems Ok).

Joel

PS: OTC with minicom I get garbage if baudrate <> 9600? (hw or sw flow control
on both end)



-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
