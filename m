Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rotapile (CPE-203-45-167-61.qld.bigpond.net.au [203.45.167.61])
	by dsl2.external.hp.com (Postfix) with ESMTP id E9999482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 24 May 2002 02:25:40 -0600 (MDT)
Received: from rob by rotapile with local (Exim 3.22 #1 (Red Hat Linux))
	id 17BAOD-0003Le-00
	for <parisc-linux@lists.parisc-linux.org>; Fri, 24 May 2002 18:25:33 +1000
From: Robert Stanford <rob@rotapile.com>
To: HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain
Date: 24 May 2002 18:25:33 +1000
Message-Id: <1022228733.12724.15.camel@rotapile>
Mime-Version: 1.0
Subject: [parisc-linux] Debian install on K580
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

I ran it again and got this error

Testing apt sources ...
Err http://security.debian.org stable/updates/main Packages
  404 Not Found
Ign http://security.debian.org stable/updates/main Release
apt-get(337): unaligned access to 0x403d7008 at ip=0x4009d16f
Not-handled unaligned insn 0x0e801210
Unaligned handler failed, ret = -1



Forgot to mention, that im running ext3, is this an error related to the
filesystem ?

Robert Stanford
