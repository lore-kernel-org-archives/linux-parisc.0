Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 73B22484A
	for <parisc-linux@parisc-linux.org>; Mon, 25 Feb 2002 21:38:15 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id xffslaaa for parisc-linux@parisc-linux.org; Mon, 25 Feb 2002 21:37:45 -0700
Date: Mon, 25 Feb 2002 20:38:04 -0800
From: Randolph Chung <randolph@tausq.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Jeremy Drake <jeremyd@apptechsys.com>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] gcc (g++) problem
Message-ID: <20020226043804.GA5069@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <Pine.LNX.4.33L2.0202251907560.6941-100000@eiger.apptechsys.com> <200202260425.g1Q4PYOJ001214@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200202260425.g1Q4PYOJ001214@hiauly1.hia.nrc.ca>
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

> It's probably a compiler bug.  The code works ok with my 3.1 test version.
> I think the problem may be the restoration of the pic offset table register
> after function calls.
> 
> Suggest trying the debian 3.1 prerelease build.  Search the list to find
> how to get it.

something is broken in the debian 3.1 snapshot package,
unfortunately....

legolas[20:35] ~% /usr/lib/gcc-snapshot/bin/g++ -o foo foo.cc 
/usr/bin/ld: unrecognized option '--eh-frame-hdr'
/usr/bin/ld: use the --help option for usage information
collect2: ld returned 1 exit status

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
