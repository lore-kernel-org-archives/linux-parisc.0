From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] TLS added relocations.
Date: Tue, 5 Apr 2005 15:16:12 -0400
Message-ID: <20050405191612.GQ1833@baldric.uwo.ca>
References: <20050405161549.GM1833@baldric.uwo.ca>
	<20050405162643.GB6987@tausq.org>
	<20050405163400.GN1833@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050405163400.GN1833@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Apr 05, 2005 at 12:34:01PM -0400, Carlos O'Donell wrote:
> I can't turn that machinery on yet. I have to test with TLS off but
> handling the relocations first to see if it works :)

To hell with it, I'm turing it all one just to see what I need.
One thing, I'm writing some configure.in asm to test gas and such.
What do you think of this as a test:

gcc -c only.

----
; Setup tls data
.section ".tdata","awT",@progbits
foo:	.data	32 
	.text
; Test general dyanmic relocations
test0:
	addil 	LT'foo-$tls_gdidx$, %r19	
	ldo 	RT'foo-$tls_gdidx$(%r1), %r26
	b 	__tls_get_addr
	nop
; Test local dynamic relocations
test1:
	addil 	LT'foo-$tls_ldidx$, %r19
	b 	__tls_get_addr
	ldo 	RT'foo-$tls_ldidx$(%r1), %r26
	ldo 	RR'foo-$tls_dtpoff$(%r1), %r25
	; More variables can be loaded...
; Test initial exec reloctiosn
test2:
	mfctl 	%cr27, %r26
	addil 	LT'foo-$tls_ieoff$, %r19
	ldw 	RT'foo-$tls_ieoff$(%r1), %r25
	add 	%r26, %r25, %r24
; Test local exec relocations
test3:
	mfctl 	%cr27, %r26
	addil 	LR'foo-$tls_leoff$, %r26 
	ldo 	RR'foo-$tls_leoff$(%r1), %r25
; Done all the TLS tests.
---

If it can compile this then it's cool. Normal gcc/binutils chokes but
the tls-toolchain works just fine :)

Please update your documentation, the symbols used for relocation don't
match (e.g. $tls_dtlndx$ is really $tls_gdix$)?

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
