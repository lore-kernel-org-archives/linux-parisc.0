Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel10.hp.com (palrel10.hp.com [156.153.255.245])
	by dsl2.external.hp.com (Postfix) with ESMTP id C0FA04829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Nov 2002 10:42:55 -0700 (MST)
Reply-To: <jim_hull@hp.com>
From: "Jim Hull" <jim_hull@hp.com>
To: "'John David Anglin'" <dave@hiauly1.hia.nrc.ca>
Cc: <carlos@baldric.uwo.ca>, <parisc-linux@lists.parisc-linux.org>,
	<tausq@debian.org>
Subject: RE: [parisc-linux] glibc 2.3.1 - It's alive! - patches
Date: Tue, 12 Nov 2002 09:42:51 -0800
Message-ID: <00fc01c28a72$ec50fa70$6763f40f@cup.hp.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
In-Reply-To: <200211121544.gACFi8Na004766@hiauly1.hia.nrc.ca>
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

John David Anglin wrote:

> 2) A fcpy insn should raise an exception if it depends on the
>    result of a pending trapping insn (the current code doesn't).
>    It would be best to not use register 0 or the source register
>    for the destination register since in theory the processor
>    would then know the operation is a nop.  Then, the insn could
>    be reordered or discarded.  The fcpy insn is nice since it
>    is non-arithmetic and doesn't cause an invalid operation
>    exception when a NaN is copied.  The fcmp insn isn't quite
>    as nice since it will generate an invalid operation when one
>    of the values is a signaling NaN, or if the low-order bit
>    of the condition code is 1 and one of the values is an NaN.

This isn't right.  According to "Delayed Trapping" on p. 10-5 of the
PA-RISC 2.0 book, an fcpy need not raise a pending exception, because it
is not mentioned in the "delayed trap must occur" list.

Now, it's possible that it might (usually) work on the processor
implementations you're interested in, but it's not architecturally
guaranteed.

 -- Jim
    HP PA-RISC (and IPF) Processor Architect
