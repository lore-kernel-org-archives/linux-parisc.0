Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1CBC8489B
	for <parisc-linux@lists.parisc-linux.org>;
	Thu,  5 Feb 2004 08:20:17 -0700 (MST)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i15FK1a01551; Thu, 5 Feb 2004 10:20:01 -0500
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 jejb
From: James Bottomley <James.Bottomley@steeleye.com>
To: Randolph Chung <randolph@tausq.org>
In-Reply-To: <20040205092028.GM959@tausq.org>
References: <20040204182455.1CC11494191@palinux.hppa>
	<20040205092028.GM959@tausq.org>
Content-Type: text/plain
Date: 05 Feb 2004 10:19:53 -0500
Message-Id: <1075994394.2130.13.camel@mulgrave>
Mime-Version: 1.0
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, 2004-02-05 at 04:20, Randolph Chung wrote:
> > Modified files:
> > 	arch/parisc/kernel: vmlinux.lds.S 
> > 	include/asm-parisc: uaccess.h 
> > 
> > Log message:
> > Make the exception table writeable (so it can actually be sorted)
> > and discard the interpreter section
> 
> jejb, this doesn't work for me..... in arch/parisc/mm/init.c we mark
> everything from _stext to data_start as read-only, so i think we need
> something like this:

OK, silly me for thinking we'd actually use the protection designation
in the ELF headers...

So with this patch it now all works?

James
