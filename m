Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id B85CC482A
	for <parisc-linux@parisc-linux.org>; Fri, 29 Jun 2001 18:29:47 -0600 (MDT)
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel2.hp.com (Postfix) with ESMTP id A57EC942
	for <parisc-linux@parisc-linux.org>; Fri, 29 Jun 2001 20:29:46 -0400 (EDT)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id 53AA537F86
	for <parisc-linux@parisc-linux.org>; Fri, 29 Jun 2001 18:29:46 -0600 (MDT)
To: parisc-linux@parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 29 Jun 2001 18:29:46 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010630002946.53AA537F86@carmen.fc.hp.com>
Subject: [parisc-linux] New kernels available
List-ID: <linux-parisc.vger.kernel.org>

I have built two kernel images and made them available at,

ftp://puffin.external.hp.com/pub/parisc/binaries/kernels/

Here's what they are,

Both
----
started with defconfig and turned off these
CONFIG_IP_PNP_BOOTP
CONFIG_ROOT_NFS

vmlinux-20010629
----------------
CONFIG_PA7100LC=y
CONFIG_PA11=y

vmlinux64-20010629
------------------
CONFIG_PA8X00=y
CONFIG_PA20=y
CONFIG_PARISC64=y


You should be able to drop the appropriate one in and reboot(yaa palo!).

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
