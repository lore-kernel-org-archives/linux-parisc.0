Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8EBA54829
	for <parisc-linux@parisc-linux.org>; Sun,  8 Dec 2002 23:04:51 -0700 (MST)
Date: Sun, 8 Dec 2002 22:08:33 -0800
From: Randolph Chung <tausq@debian.org>
To: parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org
Cc: debian-glibc@lists.debian.org
Message-ID: <20021209060833.GL21187@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [hppa] problem using glibc2.3 with older 64-bit kernels
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

This is a heads up for people running 64-bit hppa kernels with new glibc
(2.3.1). Make sure you have at least 2.4.19-pa17, otherwise fcntl() will
break with the new glibc and you won't be able to use e.g. apt.

This was needed to fix some problems with lfs on hppa. Unfortunately it
cannot be done in a completely backwards compatible manner.

32-bit kernels are not affected.

<sigh>
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
