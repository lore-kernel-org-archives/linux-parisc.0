Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [192.151.27.9])
	by dsl2.external.hp.com (Postfix) with ESMTP id D1328482B
	for <parisc-linux@parisc-linux.org>; Fri, 26 Oct 2001 12:27:07 -0600 (MDT)
To: parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 26 Oct 2001 12:27:06 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20011026182706.2800037FD7@carmen.fc.hp.com>
Subject: [parisc-linux] WARNING: DO NOT APT-GET UPGRADE HPPA
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

As PeteM and others have discovered, upgrading your hppa box currently breaks 
a *lot*.

We are recommending that you DO NOT APT-GET UPGRADE until we find the problem 
and get it fixed. Someone will send an all-clear once it's safe to do so.

We think the latest hppa libc in Debian (2.2.4-3) is to blame but we don't 
know for sure yet.

Stay tuned....

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
