Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 456A0482B
	for <parisc-linux@lists.parisc-linux.org>; Sun,  4 Nov 2001 08:23:15 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id ngpniaaa for parisc-linux@lists.parisc-linux.org; Sun, 4 Nov 2001 08:18:15 -0700
Date: Sun, 4 Nov 2001 07:23:09 -0800
From: Randolph Chung <randolph@tausq.org>
To: Albert Strasheim <fullung@ilink.nis.za>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] hppa binutils/glibc updates
Message-ID: <20011104072309.H505@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20011103233352.F505@tausq.org> <20011104132033.A23264@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011104132033.A23264@dogbert.localdomain>
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

> Has gcc been fixed to produce "working" binaries for the 720 (and
> perhaps other machines), with the aligned stuff being fixed.
> 
> Thanks for your hard work! :-)

Looks like the patch is in, but the new gcc hasn't yet been built
because of the toolchain issues. Once the official binutils is in the 
archive we can build the new gcc and see if that works....

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
