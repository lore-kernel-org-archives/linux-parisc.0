Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from deimos.frii.com (deimos.frii.com [216.17.128.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 952FD4A19
	for <parisc-linux@parisc-linux.org>; Wed, 14 Feb 2001 15:55:33 -0700 (MST)
Received: from www.riverrock.org (rock-veri.verinet.com [206.168.244.62])
	by deimos.frii.com (8.11.2/8.11.2) with ESMTP id f1EMtWn01678
	for <parisc-linux@parisc-linux.org>; Wed, 14 Feb 2001 15:55:32 -0700 (MST)
Received: from bame.riverrock.org (bame.riverrock.org [199.254.238.240])
	by www.riverrock.org (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id PAA02680
	for <parisc-linux@parisc-linux.org>; Wed, 14 Feb 2001 15:55:02 -0700
Received: from bame.riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via in.smtpd with esmtp
	id <m14TAoI-001VpYC@bame.riverrock.org> (Debian Smail3.2.0.102)
	for <parisc-linux@parisc-linux.org>; Wed, 14 Feb 2001 15:54:06 -0700 (MST)
Message-Id: <m14TAoI-001VpYC@bame.riverrock.org>
From: bame@riverrock.org
Reply-To: bame@riverrock.org
Errors-To: bame@riverrock.org
To: parisc-linux@parisc-linux.org
Date: Wed, 14 Feb 2001 15:54:06 -0700
Sender: bame@bame.riverrock.org
Subject: [parisc-linux] recent palo problems
List-ID: <linux-parisc.vger.kernel.org>

Those of you lucky to have >= 2G RAM may have had problems with palo
in the last week or so -- now fixed.  I also refreshed the palo Debian
package because it's possible that this palo is required
to boot newer kernels now that they're located at a different address.

	-P
