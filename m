Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3A77D482C
	for <parisc-linux@lists.parisc-linux.org>; Fri,  9 Nov 2001 08:32:31 -0700 (MST)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #3)
	id 162Ddr-0001Cq-00
	for parisc-linux@lists.parisc-linux.org; Fri, 09 Nov 2001 17:32:27 +0200
Received: from fullung by dogbert.localdomain with local (Exim 3.32 #1 (Debian))
	id 162Ded-00031r-00
	for <parisc-linux@lists.parisc-linux.org>; Fri, 09 Nov 2001 17:33:15 +0200
Date: Fri, 9 Nov 2001 17:33:15 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20011109173315.C11633@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] smbfs doesn't build
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

Hello,

Trying to build smbfs on 2.4.9-pa79 yields the following error:

ioctl.c: In function `smb_ioctl':
ioctl.c:36: `__kernel_old_uid_t' undeclared (first use in this function)
ioctl.c:36: (Each undeclared identifier is reported only once
ioctl.c:36: for each function it appears in.)
make[3]: *** [ioctl.o] Error 1
make[3]: Leaving directory `/usr/src/linux/fs/smbfs'
make[2]: *** [first_rule] Error 2
make[2]: Leaving directory `/usr/src/linux/fs/smbfs'
make[1]: *** [_subdir_smbfs] Error 2
make[1]: Leaving directory `/usr/src/linux/fs'
make: *** [_dir_fs] Error 2

I poked around the source code a bit -- it seems some macro to convert
(or not convert) between 32-bit and 64-bit UIDs is missing.

In related matters, what's happening with getting devfs fixed? :-) I'll
be happy to extensively test any patches.

Regards,

Albert
