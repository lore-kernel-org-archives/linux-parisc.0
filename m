Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 69AF2482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Nov 2001 09:12:38 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id myryiaaa for parisc-linux@lists.parisc-linux.org; Thu, 15 Nov 2001 09:07:35 -0700
Date: Thu, 15 Nov 2001 08:12:22 -0800
From: Randolph Chung <randolph@tausq.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Markus Grabert <xam@student.cs.ucc.ie>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Linux/PA-RISC speed (was Re: C240 Graphics, 64bit kernel and more)
Message-ID: <20011115081222.L391@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <Pine.OSF.3.96.1011115140754.20078A-100000@student.cs.ucc.ie> <200111151551.fAFFpKxb016643@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200111151551.fAFFpKxb016643@hiauly1.hia.nrc.ca>
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

> It would be useful if the gcc testsuite were run on various parisc-linux
> linux configurations: 1.X and 2.0 processors, 32 and 64 bit, gcc mainline
> and 3.0.2.  Then, post the results using the contrib/test-summary script to
> gcc-testresults@gcc.gnu.org.  This would help a lot to determine the status
> of things for gcc under parisc-linux.  Volunteer(s)?

As part of building the Debian gcc packages the testsuite is run.
Currently there are about 290-odd failures (across gcc/g++/libstdc++). I
will look into posting the results.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
