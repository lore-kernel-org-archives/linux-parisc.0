From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] [PATCH] hppa-linux-gas binutils patch
Date: Sat, 2 Dec 2006 16:21:03 +0100
Message-ID: <200612021621.03867.deller__25697.3830321387$1416624225$gmane$org@gmx.de>
References: <200611301613.kAUGDV3J004744@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200611301613.kAUGDV3J004744@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thursday 30 November 2006 17:13, John David Anglin wrote:
> > deller@c3000:~/binutils/run/bin$ cat test.s
> > AA       .equ  4
> > BB      .equ  6
> > deller@c3000:~/binutils/run/bin$ as test.s
> > test.s: Assembler messages:
> > test.s:1: Error: Unknown opcode: `aa'
> > test.s:2: Error: Invalid operands
> 
> This is because the linux target was changed to require colons after
> labels.  ....

yes.

> > although as.info states:
> > 
> > 7.37 `.equ SYMBOL, EXPRESSION'
> > ==============================
> > 
> > This directive sets the value of SYMBOL to EXPRESSION.  It is
> > synonymous with `.set'; see *Note `.set': Set.
> > 
> >    The syntax for `equ' on the HPPA is `SYMBOL .equ EXPRESSION'.
> 
> This doesn't reflect that SYMBOL needs to be followed by a colon
> on HPPA linux.  So, the documentation needs updating.

yes.

> Probably, the linux should have been updated to use the normal GNU
> syntax when it was introduced.  

yes

> Now, updating the syntax involves a 
> potential compatibility break with GCC and existing assembler code.

This is IMHO only true if things suddenly are not allowed any longer which were allowed before.
But my patch just "adds" a new syntax. It does not revert or bails on any existing one.

> At the moment, I don't see a strong need to do the update.

Technically yes, but I think if you have a "gnu as", why not allowing standard gnu style ?

The attached patch updates the documentation and code to additionally allow c):
a)
LABEL: 		.equ VALUE		; NOTE: LABEL with COLON ':'
worked before on Linux, will still work. No idea about HPUX

b)
LABEL 		.equ VALUE		 ; NOTE: LABEL without COLON ':'
never worked on Linux, and will still not work. 
Standard on HPUX, so gnu as never followed HP-UX here.

c)
			.equ VAR,VALUE 
standard gnu syntax. Didn't worked before on Linux. Will work now.
HP-UX probably never allowed this one.

d)
LABEL:		.equ VAR,VALUE
never worked on Linux. Will still not work. Use eiter "LABEL:" or "VAR".
HP-UX probably never allowed this one.


Index: config/tc-hppa.c
===================================================================
RCS file: /cvs/src/src/gas/config/tc-hppa.c,v
retrieving revision 1.133
diff -u -r1.133 tc-hppa.c
--- config/tc-hppa.c	30 Oct 2006 01:09:18 -0000	1.133
+++ config/tc-hppa.c	2 Dec 2006 15:10:54 -0000
@@ -3262,7 +3262,7 @@
       return;
     }
 
-  /* Look up the opcode in the has table.  */
+  /* Look up the opcode in the hash table.  */
   if ((insn = (struct pa_opcode *) hash_find (op_hash, str)) == NULL)
     {
       as_bad ("Unknown opcode: `%s'", str);
@@ -6397,8 +6397,11 @@
     {
       if (reg)
 	as_bad (_(".REG must use a label"));
-      else
-	as_bad (_(".EQU must use a label"));
+      else {
+	/* Try gas' standard ".equ X,Y" pseudo opcode.  */
+      	s_set(0);
+	return;
+      }
     }
 
   pa_undefine_label ();
 
Index: doc/as.texinfo
===================================================================
RCS file: /cvs/src/src/gas/doc/as.texinfo,v
retrieving revision 1.155
diff -u -r1.155 as.texinfo
--- doc/as.texinfo	3 Nov 2006 07:29:37 -0000	1.155
+++ doc/as.texinfo	2 Dec 2006 15:10:56 -0000
@@ -4368,8 +4368,8 @@
 It is synonymous with @samp{.set}; see @ref{Set,,@code{.set}}.
 
 @ifset HPPA
-The syntax for @code{equ} on the HPPA is 
-@samp{@var{symbol} .equ @var{expression}}.
+On HPPA the following syntax may be used alternatively:
+@samp{@var{symbol:} .equ @var{expression}}
 @end ifset
 
 @ifset Z80
@@ -5671,8 +5671,8 @@
 file is the last value stored into it.
 
 @ifset HPPA
-The syntax for @code{set} on the HPPA is
-@samp{@var{symbol} .set @var{expression}}.
+Alternatively the syntax for @code{set} on the HPPA is
+@samp{@var{symbol:} .set @var{expression}}.
 @end ifset
 
 @ifset Z80
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
