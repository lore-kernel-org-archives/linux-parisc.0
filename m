Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id CF975482C
	for <parisc-linux@lists.parisc-linux.org>; Fri,  9 Nov 2001 10:25:58 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id iehtiaaa for parisc-linux@lists.parisc-linux.org; Fri, 9 Nov 2001 10:21:03 -0700
Date: Fri, 9 Nov 2001 09:25:51 -0800
From: Randolph Chung <randolph@tausq.org>
To: Albert Strasheim <fullung@ilink.nis.za>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] smbfs doesn't build
Message-ID: <20011109092551.A3053@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20011109173315.C11633@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011109173315.C11633@dogbert.localdomain>
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

In reference to a message from Albert Strasheim, dated Nov 09:
> Hello,
> 
> Trying to build smbfs on 2.4.9-pa79 yields the following error:
> 
> ioctl.c: In function `smb_ioctl':
> ioctl.c:36: `__kernel_old_uid_t' undeclared (first use in this function)
> ioctl.c:36: (Each undeclared identifier is reported only once
> ioctl.c:36: for each function it appears in.)
> make[3]: *** [ioctl.o] Error 1
> make[3]: Leaving directory `/usr/src/linux/fs/smbfs'
> make[2]: *** [first_rule] Error 2
> make[2]: Leaving directory `/usr/src/linux/fs/smbfs'
> make[1]: *** [_subdir_smbfs] Error 2
> make[1]: Leaving directory `/usr/src/linux/fs'
> make: *** [_dir_fs] Error 2

i have a patch in my tree that adds back some of these things that are
in other archs but not in parisc. will clean it up and post RSN.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
