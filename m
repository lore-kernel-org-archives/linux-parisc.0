Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pogo.mtv1.steeleye.com (host194.steeleye.com [66.206.164.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4D0824829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 22 Dec 2002 09:35:14 -0700 (MST)
Received: (from root@localhost)
	by pogo.mtv1.steeleye.com (8.9.3/8.9.3) id IAA02821
	for <parisc-linux@lists.parisc-linux.org>; Sun, 22 Dec 2002 08:35:08 -0800
Received: from mulgrave (jejb@localhost)
	by localhost.localdomain (8.11.6/linuxconf) with ESMTP id gBMGZ3k11207;
	Sun, 22 Dec 2002 10:35:03 -0600
Message-Id: <200212221635.gBMGZ3k11207@localhost.localdomain>
To: grundler@dsl2.external.hp.com (Grant Grundler)
Cc: James Bottomley <James.Bottomley@SteelEye.com>,
	Randolph Chung <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.5 randomly kills applications with page faults 
In-Reply-To: Message from grundler@dsl2.external.hp.com (Grant Grundler)
   of "Sun, 22 Dec 2002 00:11:42 MST." <20021222071142.GA17710@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 22 Dec 2002 10:35:03 -0600
From: James Bottomley <James.Bottomley@steeleye.com>
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

grundler@dsl2.external.hp.com said:
> I've placed the diff on ftp.parisc-linux.org:/patches/diff-2.5.51-pa5
> The patch *looks* right and fixes a few other nits. Should work on
> both PA1.1 and PA2.0 machines. (and we have to use STREGM/LDREGM to
> support both variants). 

Boots and runs fine for me on my C360.  I'm on 2.5.52-BK latest, rather than 
2.5.51 as the base, though.  Seems to be robust to my bitkeeper tests.  I'm 
going to use this as my development machine kernel now to see if I can find 
any other problems.

James
