Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id A5EA8482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Sep 2001 15:17:21 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 8CD54B00C; Fri, 21 Sep 2001 22:16:19 +0100 (BST)
Date: Fri, 21 Sep 2001 22:16:19 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Richard Allen <ra@hp.is>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C360 install fails
Message-ID: <20010921221619.M24917@linuxcare.com>
References: <20010921135335.E11577@hp.is> <20010921213801.K24917@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010921213801.K24917@linuxcare.com>; from rhirst@linuxcare.com on Fri, Sep 21, 2001 at 09:38:01PM +0100
List-ID: <linux-parisc.vger.kernel.org>

BTW, I just tried an install using a 2.4.9 kernel from about September
13th.  And it failed while formatting a 2GB partition:


Superblock backups stored on blocks: 
        32768, 98304, 163840, 229376, 294912

Writing inode tables: done
Writing superbKernel panic: ccio-dma.c: ccio_alloc_range() I/O MMU is out of mapping resources.
In interrupt handler - not syncing
locks and filesystem accounting information: 


Hopefully we'll get a fix for that committed before I roll the next
ISO.

Richard
