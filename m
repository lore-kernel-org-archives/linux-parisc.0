Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cdc712-9.cdc.polimi.it (cdc712-9.cdc.polimi.it [131.175.7.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id E9AB5482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Jul 2003 09:41:23 -0600 (MDT)
Date: Fri, 11 Jul 2003 17:41:18 +0200
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030711154118.GA378@cdc712-9.cdc.polimi.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: alchemist@cdc712-9.cdc.polimi.it
Subject: [parisc-linux] Tag starvation problem
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

Dear Sirs,

Since 2.4.20-pa35 my 712-60/128Mb suffers from the "tag starvation problem":

kernel msg: target(6.0) suffers from tag starvation problem

then everything seems ok for a few seconds and then a sudden kernel panic.
Note that until pa35 everything went ok (excluding the 712 power switch that
does not work).
I routinely use parisc-linux precompiled kernels.
The problem also appears in 2.4.21pa2.

any help anyone ?
thanks in advance.
