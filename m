Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from server.da-kot (21-40.CampusNet.ucl.ac.be [130.104.21.40])
	by dsl2.external.hp.com (Postfix) with ESMTP id 607EA482C
	for <parisc-linux@lists.parisc-linux.org>; Sun, 15 Jun 2003 13:00:04 -0600 (MDT)
Received: from gmsoft.tuxicoman.be ([2001:6f8:204:20:210:a7ff:fe10:1a3e])
	by server.da-kot with esmtp (Exim 3.36 #1 (Debian))
	id 19RcjW-0004Qd-00
	for <parisc-linux@lists.parisc-linux.org>; Sun, 15 Jun 2003 21:00:06 +0200
From: Guy Martin <gmsoft@gentoo.org>
To: parisc-linux@lists.parisc-linux.org
Date: Sun, 15 Jun 2003 20:57:17 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Message-Id: <200306152057.17848.gmsoft@gentoo.org>
Subject: [parisc-linux] Can't configure gcc with --target=hppa64-linux
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

I'm trying to build a 64bit gcc but the configuration script fail.

./configure --host=hppa2.0-unknown-linux-gnu --prefix=/usr 
--target=hppa64-linux --disable-shared --disable-nls --enable-64-bit-bfd  
--enable-languages=c
[snip]
checking for CHAR_BIT... yes
checking byte ordering... od: od.c:1324: read_block: Assertion `0 < n && n <= 
bytes_per_block' failed.
unknown
configure: error: *** unable to determine endianness
Configure in /var/tmp/portage/gcc-3.2.2/work/gcc-3.2.2/gcc failed, exiting.

What's wrong ?

Regards

-- 
Guy Martin
Gentoo - HPPA port Lead / IPv6 team
Lug Charleroi (Belgium)
