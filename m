Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id E163E487E
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 13 Feb 2004 07:20:32 -0700 (MST)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i1DEKfa07462 for <parisc-linux@lists.parisc-linux.org>;
	Fri, 13 Feb 2004 09:20:41 -0500
From: James Bottomley <James.Bottomley@steeleye.com>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain
Date: 13 Feb 2004 09:20:27 -0500
Message-Id: <1076682028.2159.10.camel@mulgrave>
Mime-Version: 1.0
Subject: [parisc-linux] gcc-3.3 and problems in the 64 bit kernel
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

our 64 bit gcc-3.3 (all versions) has a miscompilation problem that
results in a BUG() in the 64 bit kernel.  This shows up as:

 kernel BUG at mm/shmem.c:585

The problem turns out to be that gcc-3.3 is violating the OPD rules for
static functions (OPD == Official Procedure Descriptor and is supposed
to ensure that there's only one function descriptor per function,
allowing pointers to function descriptors to be compared directly
instead of having to be dereferenced).

The problem is generated because this comparison:

 if (inode->i_op->truncate == shmem_truncate) 

which is a function pointer comparison is always false.

There are several other function pointer comparisons in the kernel which
are in danger of failing in this manner, so the resulting kernel will
not operate correctly.

Hopefully, the gcc people will be able to fix this, but in the mean time
people should stick to gcc-3.0 to compile 64 bit kernels.  (gcc-3.3 is
fine for 32 bit parisc kernels).

James
