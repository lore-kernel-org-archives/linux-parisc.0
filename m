Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pogo.mtv1.steeleye.com (host194.steeleye.com [66.206.164.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id D4C134829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Dec 2002 18:47:06 -0700 (MST)
Received: (from root@localhost)
	by pogo.mtv1.steeleye.com (8.9.3/8.9.3) id RAA01129
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Dec 2002 17:47:01 -0800
Received: from mulgrave (jejb@localhost)
	by localhost.localdomain (8.11.6/linuxconf) with ESMTP id gBL1kvv11019;
	Fri, 20 Dec 2002 19:46:57 -0600
Message-Id: <200212210146.gBL1kvv11019@localhost.localdomain>
To: grundler@dsl2.external.hp.com (Grant Grundler)
Cc: James Bottomley <James.Bottomley@SteelEye.com>,
	Randolph Chung <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.5 randomly kills applications with page faults 
In-Reply-To: Message from grundler@dsl2.external.hp.com (Grant Grundler)
   of "Fri, 20 Dec 2002 18:38:24 MST." <20021221013824.GA18983@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 20 Dec 2002 19:46:57 -0600
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
> where STREGM/LDREGM are new macros that use st<X>,ma instructions.

Actually, I found STREG,ma and LDREG,mb worked for me.

grundler@dsl2.external.hp.com said:
> but, given the assertion we could take an interrupt between line 96 and
> 107, would an interrupt between 95/96 cause Bad Things (tm) to happen?

Not according to the parisc assembler manual.  As long as we can guarantee 
that the stack is incremented before the value is stored (which seems to be 
what STREG,ma seems to assure), we should be fine.

James
