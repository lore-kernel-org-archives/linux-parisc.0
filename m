Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id AD348482C
	for <parisc-linux@parisc-linux.org>; Mon, 25 Mar 2002 22:26:46 -0700 (MST)
Received: from eiger.apptechsys.com (ats198.apptechsys.com [207.14.35.198])
	by mail.apptechsys.com (Postfix) with ESMTP id BFBCD7BC46
	for <parisc-linux@parisc-linux.org>; Mon, 25 Mar 2002 21:26:39 -0800 (PST)
Date: Mon, 25 Mar 2002 21:26:39 -0800 (PST)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Kernel 2.4.17-32-smp problem
In-Reply-To: <Pine.LNX.4.33L2.0203250948230.13376-100000@eiger.apptechsys.com>
Message-ID: <Pine.LNX.4.33L2.0203252123370.13376-100000@eiger.apptechsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

This also seems to apply to 2.4.18 from cvs co at 5 pm west coast time.
The config I used was arch/parisc/debian-configs/32-smp with the following
changes: removed netfilter and pcnet32 modules as they were breaking the
build.


-- 
You have a deep appreciation of the arts and music.
