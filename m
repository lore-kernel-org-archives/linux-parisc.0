Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B6615482A
	for <parisc-linux@parisc-linux.org>; Fri, 18 Oct 2002 06:45:26 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 182WVG-0000Qk-00
	for parisc-linux@parisc-linux.org; Fri, 18 Oct 2002 13:45:22 +0100
Date: Fri, 18 Oct 2002 13:45:22 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20021018134522.A5285@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] asm/offset.h vs asm/offsets.h
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

In 2.5, there's a standardised way of generating asm/offsets.h which I think
we ought to move to.  However, it means we lose the #ifdef protection
against compiling for the wrong wordsize; ie:

#ifdef __LP64__
text("#ifndef __LP64__");
text("#error offset.h was generated for 64-bit build; did you do 'make dep'?");
#else
text("#ifdef __LP64__");
text("#error offset.h was generated for 32-bit build; did you do 'make dep'?");
#endif
text("#endif");

can no longer be a part of it.  I'm not sure this is an awful problem
since it's regenerated more consistently than our old offset.h, but it's
something to be aware of before we switch.

-- 
Revolutions do not require corporate support.
