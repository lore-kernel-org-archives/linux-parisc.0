Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 017804836
	for <parisc-linux@lists.parisc-linux.org>; Thu, 28 Feb 2002 11:17:58 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id zattlaaa for parisc-linux@lists.parisc-linux.org; Thu, 28 Feb 2002 11:17:30 -0700
Date: Thu, 28 Feb 2002 10:17:32 -0800
From: Randolph Chung <randolph@tausq.org>
To: James S <smithjames@comcast.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Compiling source packages
Message-ID: <20020228181732.GF11598@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <000d01c1c081$db6db9c0$02c1a8c0@james.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <000d01c1c081$db6db9c0$02c1a8c0@james.co.uk>
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

In reference to a message from James S, dated Feb 28:
> i've downloaded a few source packages & have hit the same problem with most
> of them

this is a common problem, that the upstream sources have
config.{guess,sub} files that are outdated and do not recognize some of
the newer architectures. on a debian system, if you have, for example,
automake installed (apt-get install automake) you can copy newer
config.guess/sub files from /usr/share/automake/config.*

Alternatively, you can get the latest and greatest from
http://subversions.gnu.org/cgi-bin/viewcvs/config/config/

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
