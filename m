Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 230C24829
	for <parisc-linux@parisc-linux.org>; Thu, 26 Jun 2003 07:54:53 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19VXD9-00060I-QA
	for parisc-linux@parisc-linux.org; Thu, 26 Jun 2003 14:54:51 +0100
Date: Thu, 26 Jun 2003 14:54:51 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20030626135451.GL451@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] warning: minor abi change
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

2.4.21 allocates sysctl number 56 to something else, so i had to renumber
the hppa sysctls to 57 and 58.  if linus didn't keep dropping this patch,
we'd have stable numbers ...

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
