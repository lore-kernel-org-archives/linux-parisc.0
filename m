Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5DC88482B
	for <parisc-linux@parisc-linux.org>; Sun, 20 Jan 2002 10:57:13 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id xrzwkaaa for parisc-linux@parisc-linux.org; Sun, 20 Jan 2002 10:57:15 -0700
Date: Sun, 20 Jan 2002 09:56:52 -0800
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] journaling filesystem on parisc?
Message-ID: <20020120175652.GQ21816@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <15429.47940.937550.926908@gargle.gargle.HOWL> <20020120005117.GK21816@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020120005117.GK21816@tausq.org>
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

> i've put a patch out at:
> ftp://ftp.parisc-linux.org/patches/xfs-1.0.2-hppa-2.4.17-pa11.diff.gz

There's another one now at 
ftp://ftp.parisc-linux.org/patches/xfs-1.0.2-hppa-2.4.17-pa11-small.diff

This one contains only the hppa changes and is meant to be applied over
parisc linux cvs + the following patches from SGI:

from ftp://oss.sgi.com/projects/xfs/download/patches/2.4.17: 

   xfs-2.4.17-split-only.bz2
   xfs-2.4.17-split-kernel.bz2
   xfs-2.4.17-split-misc.bz2
   xfs-2.4.17-split-acl-extattr.bz2
(apply in that order)

there's one new change relative to the old one in page_buf_locking.c
that seems to be a bug upstream. i've reported this to them already.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
