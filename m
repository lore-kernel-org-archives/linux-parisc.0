Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 779154829
	for <parisc-linux@parisc-linux.org>; Sun, 21 Jul 2002 20:40:43 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17WT7l-0008Im-00
	for parisc-linux@parisc-linux.org; Mon, 22 Jul 2002 03:40:37 +0100
Date: Mon, 22 Jul 2002 03:40:37 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20020722034037.F12523@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] state of 2.5 merge
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

we're still a little short of attempting to link.  entry.S and head.S
need to be massaged to work in the new O(1) scheduler world.  note that
we're leaving preempt disabled until later.  once it does attempt to link,
i suspect we'll find there're a lot of functions which need to be written
(particularly mm-related ones) and probably some include cleanups to do.

i guesstimated it'd take a week to get to linking, and we're definitely
halfway there.  thanks to everyone who's participated in the merge,
including: paul bame, randolph chung, thibaut varene, richard hirst,
helge deller and grant grundler.

-- 
Revolutions do not require corporate support.
