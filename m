Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9547D482C
	for <parisc-linux@parisc-linux.org>; Sat, 17 Nov 2001 00:26:09 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id mpjajaaa for parisc-linux@parisc-linux.org; Sat, 17 Nov 2001 00:20:38 -0700
Date: Fri, 16 Nov 2001 23:25:24 -0800
From: Randolph Chung <randolph@tausq.org>
To: Sonny Cook <sonny@aspersion.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] pam/ssh seems to be whacked
Message-ID: <20011116232524.S391@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <Pine.LNX.4.33.0111170713360.4966-100000@lefou.zayda.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0111170713360.4966-100000@lefou.zayda.com>
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

> I upgraded to the latest version of libpam0g, libpam-runtime, and
> libpam-modules, to no avail.  Needless to say, I cannot log in.
> 
> I suspect that the libc6 upgrage goofed me up somehow.  Does anybody have
> an idea, or place to start debugging?

correct. the way to fix this is to run, as root:

/etc/init.d/ssh restart

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
