Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 30541483F
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Jun 2002 07:28:13 -0600 (MDT)
Received: from www-data by webmail.tiscalinet.be with local (Tiscali)
	id 17KfVI-00042d-00
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Jun 2002 15:28:08 +0200
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1024493288.3d1086e89dfd2@webmail.tiscalinet.be>
Date: Wed, 19 Jun 2002 15:28:08 +0200 (CEST)
From: joel.soete@freebel.net
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] hppa64-linux-gcc not in gcc dpkg?
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

To verify my ioctl32 patch for 64bit kernel I am just trying to compile last cvs
kernel in 64bits on my b2000 (PA8600?). To do so, in make menu config, i choose
procesor type PA8x00, 64bits kernel && 32bits PDC (because b2000).

But when I launch make dep, it failled because it did not find hpp64-linux-gcc?
I search on http://www.debian.org/distrib/packages but no success?

Do I have to report this problem to debian gcc package maintainer?
(IIRC for other paltform a compiler paramater avoid to have seperate bin)

Also to be sure to build it with Carlos tool chain, I had to specify
--target=hppa64-linux?

Thanks in advance for advice,
    Joel

-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
