Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel9.hp.com (atlrel9.hp.com [156.153.255.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id EEC1B482A
	for <parisc-linux@parisc-linux.org>; Wed, 17 Apr 2002 08:42:17 -0600 (MDT)
Received: from ldl.fc.hp.com (ldl.fc.hp.com [15.1.50.190])
	by atlrel9.hp.com (Postfix) with ESMTP id A4AE7805600
	for <parisc-linux@parisc-linux.org>; Wed, 17 Apr 2002 10:42:16 -0400 (EDT)
Received: from paul.bame (lart.fc.hp.com [15.1.54.48])
	by ldl.fc.hp.com (Postfix) with ESMTP id 5778C43A0
	for <parisc-linux@parisc-linux.org>; Wed, 17 Apr 2002 08:42:16 -0600 (MDT)
Received: from localhost
	([127.0.0.1] helo=fc.hp.com ident=bame)
	by paul.bame with esmtp (Exim 3.35 #1 (Debian))
	id 16xqdU-0001WN-00
	for <parisc-linux@parisc-linux.org>; Wed, 17 Apr 2002 08:42:16 -0600
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] linux-2.4.18-pa19 fpu problem 
In-Reply-To: Your message of "Wed, 17 Apr 2002 12:32:11 BST."
             <20020417123211.L23804@parcelfarce.linux.theplanet.co.uk>
References: <1019034174.3cbd3a3e2c5a5@webmail.tiscalinet.be>  <20020417123211.L23804@parcelfarce.linux.theplanet.co.uk> 
Date: Wed, 17 Apr 2002 08:42:16 -0600
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E16xqdU-0001WN-00@paul.bame>
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

> On Wed, Apr 17, 2002 at 11:02:54AM +0200, joel.soete@freebel.net wrote:
> > Here is some trace I get from the kernel (2.4.18-pa19) make (after a make
> > oldconfig):
> ...
> > I do think that lacks a header to define some function.
> 
> this code is crufty old HPUX stuff... the warnings have been there
> basically forever, and nobody's bothered to fix them.  Nobody's found a
> problem either :-) If you want to eliminate these warnings by declaring
> everything properly, feel free to send a patch, but I don't think it's
> very important.

Here's the README in the math-emu directory which describes why we
leave the warnings in:

"All files except driver.c are snapshots from the HP-UX kernel.  They've
 been modified as little as possible.  Even though they don't fit the
 Linux coding style, please leave them in their funny format just in case
 someone in the future, with access to HP-UX source code, is generous
 enough to update our copies with later changes from HP-UX -- it'll
 make their 'diff' job easier if our code is relatively unmodified.
