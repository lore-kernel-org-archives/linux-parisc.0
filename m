Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from deimos.frii.com (deimos.frii.com [216.17.128.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 631284A19
	for <parisc-linux@parisc-linux.org>; Wed, 14 Feb 2001 16:03:32 -0700 (MST)
Received: from www.riverrock.org (rock-veri.verinet.com [206.168.244.62])
	by deimos.frii.com (8.11.2/8.11.2) with ESMTP id f1EN3Vn07616
	for <parisc-linux@parisc-linux.org>; Wed, 14 Feb 2001 16:03:31 -0700 (MST)
Received: from bame.riverrock.org (bame.riverrock.org [199.254.238.240])
	by www.riverrock.org (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id QAA02861
	for <parisc-linux@parisc-linux.org>; Wed, 14 Feb 2001 16:03:01 -0700
Received: from bame.riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via in.smtpd with esmtp
	id <m14TAvT-001VpXC@bame.riverrock.org> (Debian Smail3.2.0.102)
	for <parisc-linux@parisc-linux.org>; Wed, 14 Feb 2001 16:01:31 -0700 (MST)
Message-Id: <m14TAvT-001VpXC@bame.riverrock.org>
From: bame@riverrock.org
Reply-To: bame@riverrock.org
Errors-To: bame@riverrock.org
To: parisc-linux@parisc-linux.org
Date: Wed, 14 Feb 2001 16:01:31 -0700
Sender: bame@bame.riverrock.org
Subject: [parisc-linux] Patch to build debs
List-ID: <linux-parisc.vger.kernel.org>

Remove the token GLIBC_2.2 from the file /var/lib/dpkg/info/libc6.shlibs

Thanks to bdale for figuring this one out.

	-P
