Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Stefan Pfetzing <dreamind@dreamind.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] XFS - blkgetsize64 
In-Reply-To: Message from Stefan Pfetzing <dreamind@dreamind.de>
   of "Wed, 04 Sep 2002 16:30:13 +0200." <20020904143013.GC4386@dreamind.de>
References: <20020904143013.GC4386@dreamind.de> 
Date: Wed, 04 Sep 2002 10:51:47 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020904165147.A33FC4829@dsl2.external.hp.com>
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

Stefan Pfetzing wrote:
> mkfs.xfs always got the size of the Device (/dev/sda5) wrong. (it complained
> about not getting with lseek64 to that position...)
...
> So he said, perhaps there is a bug in the SCSI (lasi?) driver.

I don't think it's the driver.

lseek64 must be getting redirected to lseek().
Linux kernel only supports "lseek".
See "struct file_operations" in include/linux/fs.h.

loff_t is a 64-bit type.
include/linux/types.h:typedef __kernel_loff_t           loff_t;
include/asm/posix_types.h:typedef long long             __kernel_loff_t;

> P.S.: I'm using 2.4.19-pa9 with a self made diff from vanilla 2.4.19 against
> XFS CVS. (the patch did in nearly cleanly)

Are you running 32-bit or 64-bit kernel?
I want to know if arch/parisc/kernel/sys_parisc32.c might be the problem.

grant
