From: law@redhat.com
Subject: [parisc-linux] Re: [PATCH] space register 0 changes for hppa
Date: Mon, 24 Feb 2003 08:01:31 -0700
Message-ID: <200302241501.h1OF1WJT001142__26698.317731689$1416622235$gmane$org@localhost.redhat.com>
References: <20030224062421.GA31111@bubble.sa.bigpond.net.au>
Reply-To: law@redhat.com
Cc: Matthew Wilcox <willy@debian.org>, binutils@sources.redhat.com,
	parisc-linux@parisc-linux.org
To: Alan Modra <amodra@bigpond.net.au>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: Your message of "Mon, 24 Feb 2003 16:54:21 +1030."
             <20030224062421.GA31111@bubble.sa.bigpond.net.au>
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
