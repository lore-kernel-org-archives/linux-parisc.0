Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5773A482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  5 Feb 2002 11:46:15 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id samhlaaa for parisc-linux@lists.parisc-linux.org; Tue, 5 Feb 2002 11:46:00 -0700
Date: Tue, 5 Feb 2002 10:46:02 -0800
From: Randolph Chung <randolph@tausq.org>
To: Bob Radvanovsky <rsradvan@unixworks.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problems compoling OPENSSL-0.9.6c under PA/Linux 0.9.3 bundle
Message-ID: <20020205184602.GK624@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <5.1.0.14.2.20020205123859.028e7410@pop.unixworks.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <5.1.0.14.2.20020205123859.028e7410@pop.unixworks.net>
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

Make sure the following lines (or similar) are in your
/etc/apt/sources.list:

deb http://non-us.debian.org/debian-non-US unstable/non-US main
deb-src http://non-us.debian.org/debian-non-US unstable/non-US main

then run 'apt-get update' and 'apt-get install openssl'

ok, that doesn't really answer your question... :-)

alternatively, do 'apt-get update; apt-get source openssl' to get the
debian sources, which do build on hppa.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
