Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (unknown [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 983AE482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  7 May 2002 10:37:37 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id jwfenaaa for parisc-linux@lists.parisc-linux.org; Tue, 7 May 2002 09:36:22 -0700
Date: Tue, 7 May 2002 10:46:20 -0700
From: Randolph Chung <tausq@debian.org>
To: joel.soete@freebel.net
Cc: carlos@baldric.uwo.ca, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kdb patches for -pa23 ... moooo!
Message-ID: <20020507174619.GO32033@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <1020756305.3cd7815151303@webmail.tiscalinet.be> <1020787573.3cd7fb75053c7@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1020787573.3cd7fb75053c7@webmail.tiscalinet.be>
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

> in fact, I find that it is missing following files in include/linux:
> kdb.h; kallsyms.h; dis-asm.h; kdbprivate.h.

Paul is doing a merge from trunk to the kdb branch. I would suggest
trying the stuff in cvs (kdb_v21 branch) instead.

randolph
