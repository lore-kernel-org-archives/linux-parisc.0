Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mx1.redhat.com (mx1.redhat.com [66.187.233.31])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0E3FD486F
	for <parisc-linux@parisc-linux.org>; Mon, 24 Feb 2003 07:57:17 -0700 (MST)
Message-Id: <200302241501.h1OF1WJT001142@localhost.redhat.com>
To: Alan Modra <amodra@bigpond.net.au>
Cc: Matthew Wilcox <willy@debian.org>, binutils@sources.redhat.com,
	parisc-linux@parisc-linux.org
Reply-To: law@redhat.com
In-Reply-To: Your message of "Mon, 24 Feb 2003 16:54:21 +1030."
             <20030224062421.GA31111@bubble.sa.bigpond.net.au>
From: law@redhat.com
Date: Mon, 24 Feb 2003 08:01:31 -0700
Subject: [parisc-linux] Re: [PATCH] space register 0 changes for hppa
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

In message <20030224062421.GA31111@bubble.sa.bigpond.net.au>, Alan Modra writes
:
 >Hi Matthew,
 >  ChangeLog entries shouldn't be sent as diffs.  Write this one as
 >
 >	* hppa-dis.c (print_insn_hppa <2 bit space register>): Do not print
 >	the space register when the value is zero.
 >
 >and put the reason for the change as a comment in the code if you feel
 >you need some justification for the change.
 >
 >Did you run the binutils testsuite?
And the GDB testsuite, which tests the PA disassembler.  I'm 99% sure
it's going to fail after this change.

jeff
