Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 11E15482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Jun 2002 09:08:25 -0600 (MDT)
Date: Fri, 7 Jun 2002 11:08:20 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>, tausq@debian.org,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kdb getting healthier? (PCI guru needed, that's you willy!)
Message-ID: <20020607110820.C10576@systemhalted>
References: <20020606092115.C6900@systemhalted> <200206061619.g56GJdiE004367@hiauly1.hia.nrc.ca> <20020606145733.C8107@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020606145733.C8107@systemhalted>; from carlos@baldric.uwo.ca on Thu, Jun 06, 2002 at 02:57:33PM -0400
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

> > It's definitely dangerous to use array indexes outside the bounds
> > of the array, particularly on the PA.  There can be problems with
> > space register selection, although I wouldn't expect this to be a in
> > the linux kernel.  You can avoid index insns with "-mdisable-indexing".
> > Let me know if you see anything strange in the assembler output.
> > 
> > Dave

The following is the output using gcc 3.0.4.

--- unwind-orig.c       Fri Jun  7 11:01:22 2002
+++ unwind.c    Fri Jun  7 09:23:17 2002
@@ -106,7 +106,7 @@
        table->base_addr = base_addr;
        table->gp = gp;
        table->start = base_addr + start[0].region_start;
-       table->end = base_addr + end[-1].region_end;
+       table->end = base_addr + (--end)->region_end;
        table->table = (struct unwind_table_entry *)table_start;
        table->length = end - start;
        table->next = NULL;

--- unwind-orig.s       Fri Jun  7 11:01:33 2002
+++ unwind.s    Fri Jun  7 09:24:55 2002
@@ -7,22 +7,23 @@
        .CALLINFO FRAME=0,NO_CALLS
        .ENTRY
        stw %r24,12(%r26)
-       ldw -52(%r30),%r21
+       ldw -52(%r30),%r22
        stw %r25,4(%r26)
        stw %r23,8(%r26)
-       ldw 0(%r21),%r19
-       ldw -56(%r30),%r22
+       ldw 0(%r22),%r19
+       ldw -56(%r30),%r20
        addl %r24,%r19,%r19
        stw %r19,16(%r26)
-       sub %r22,%r21,%r20
-       ldw -12(%r22),%r19
-       extrs %r20,27,28,%r20
+       ldo -16(%r20),%r20
+       ldw 4(%r20),%r19
+       sub %r20,%r22,%r21
+       extrs %r21,27,28,%r21
        addl %r24,%r19,%r24
-       stw %r20,28(%r26)
        stw %r24,20(%r26)
+       stw %r21,28(%r26)
        stw %r0,0(%r26)
        bv %r0(%r2)
-       stw %r21,24(%r26)
+       stw %r22,24(%r26)
        .EXIT
        .PROCEND
 .Lfe1:

Aside from some register juggling, the only difference is
that we now use 'ldo,ldw,sub,extrs' instead of 'sub,ldw,extrs'.
The question is: Can this do bad things?

I'll have time on Monday to go through it thoroughly.

c.
