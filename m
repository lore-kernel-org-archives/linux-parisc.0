Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id AD7DF482C
	for <parisc-linux@lists.parisc-linux.org>; Thu,  8 Nov 2001 01:14:20 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id gpsriaaa for parisc-linux@lists.parisc-linux.org; Thu, 8 Nov 2001 01:09:13 -0700
Date: Thu, 8 Nov 2001 00:14:10 -0800
From: Randolph Chung <randolph@tausq.org>
To: Albert Strasheim <fullung@ilink.nis.za>,
	Thomas Marteau <marteaut@esiee.fr>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 720/50 update
Message-ID: <20011108001410.B2835@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <fullung@ilink.nis.za> <20011107023007.A12882@dogbert.localdomain> <200111070700.AAA08983@puffin.external.hp.com> <20011107163116.A8527@dogbert.localdomain> <20011107200110.C616@dogbert.localdomain> <3BE9799E.8C2C9C77@esiee.fr> <20011108080516.A1857@dogbert.localdomain> <20011108172026.I6922@bubble.sa.bigpond.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011108172026.I6922@bubble.sa.bigpond.net.au>
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

In reference to a message from Alan Modra, dated Nov 08:
> Randolph Chung is currently testing a new glibc that should cure most,
> if not all, of your problems.  The problem was that the lazy linking

Alan's new patch seems to be working. I've updated the debs at
http://gluck.debian.org/~tausq/hppa/

With these new debs I'm not seeing the apt-get crashes anymore.

I've passed the patch to Ben Collins for the next glibc build.

Please let us know if you are still seeing crashes after using the
updated debs. (Apologies -- but the version numbers are the same as the
previous ones)

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
