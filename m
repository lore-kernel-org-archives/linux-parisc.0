Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA29346
	for <parisc-linux@puffin.external.hp.com>; Thu, 13 Jul 2000 17:58:59 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 14 Jul 2000 00:00:12 -0000
To: Paul Bame <bame@noam.fc.hp.com>
Cc: Alan Modra <amodra@puffin.external.hp.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Non-bootable kernel problems
References: <20000713003533.Y9568@linuxcare.com> <E13CmYw-00077l-00@noam.fc.hp.com> <87ya3527ik.fsf@linuxcare.com> <87sntd20mo.fsf@linuxcare.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 13 Jul 2000 19:45:27 -0400
In-Reply-To: David Huggins-Daines's message of "13 Jul 2000 17:14:55 -0400"
Message-ID: <871z0x1tns.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Okay, this is my final word on this for today, I promise that if I
send any more mail on it, it will include a patch :-)

David Huggins-Daines <dhd@linuxcare.com> writes:

> No.  My mistake.  binutils is doing the right thing, the problem is
> that, due to the way the LR' and RR' field selectors work, there is a
> bad interaction between cases in which the DPREL21L and DPREL14R (or
> any 21L and 14R relocations actually) are "split" like this, and ld
> -r, which tends to increase the addends to a point where LR' and RR'
> have different effects (LR' expects RR' to be positive, but it isn't).
> Then during final relocation, the wrong thing happens.
> 
> I'll have a better explanation once I work through the failure modes
> and come up with a good short testcase.

Here is a small program that calculates RR' and LR' fields based on a
RELA according to the definitions in the PA-RISC ELF supplement:

#!/usr/bin/perl -w
use strict;

sub RND($) {
  my $x = shift;
  return (($x + 0x1000) & ~0x1fff);
}

sub R($) {
  my $x = shift;
  return $x & 0x7ff;
}

sub L($) {
  my $x = shift;
  return $x & ~0x7ff;
}

sub LR($$) {
  my ($x, $a) = @_;
  return L($x + RND($a));
}

sub RR($$) {
  my ($x, $a) = @_;
  return R($x + RND($a)) + ($a - RND($a));
}

while (<>) {
  my ($value, $addend) = map hex, split;
  my $lr = LR $value, $addend;
  my $rr = RR $value, $addend;
  printf "LR(%x, %x) = %x ; RR(%x, %x) = %x ; LR + RR = %x\n",
    $value, $addend, $lr, $value, $addend, $rr, $lr + $rr;
}
__END__

Now, we see that in net/ipv4/devinet.o we have:

  24:	2b 60 00 00 	addil 0,dp,%r1
			24: R_PARISC_DPREL21L	.data+0x78
  28:	34 19 00 00 	ldi 0,r25
  2c:	34 24 00 00 	ldo 0(r1),r4
			2c: R_PARISC_DPREL14R	.data+0x3c0

Then, in net/ipv4/ipv4.o (which is produced by running ld -r on the
objects in that directory) we see that the addends have been increased:

     b9c:	2b 60 00 00 	addil 0,dp,%r1
			b9c: R_PARISC_DPREL21L	.data+0xd5c
     ba0:	34 19 00 00 	ldi 0,r25
     ba4:	34 24 00 00 	ldo 0(r1),r4
			ba4: R_PARISC_DPREL14R	.data+0x10a4

So, let's feed these addends to that script:

[dhd@tarwebok] ~/src/parisc/binutils-2.10$ perl test-broken-relocs.pl
0 78
LR(0, 78) = 0 ; RR(0, 78) = 78 ; LR + RR = 78
0 3c0
LR(0, 3c0) = 0 ; RR(0, 3c0) = 3c0 ; LR + RR = 3c0

In this case, you can see that everything is fine, because the LR
fields will contain the same values for both relocations.

But now, let's see what happens after we relink it:

[dhd@tarwebok] ~/src/parisc/binutils-2.10$ perl test-broken-relocs.pl
0 d5c
LR(0, d5c) = 0 ; RR(0, d5c) = d5c ; LR + RR = d5c
0 10a4
LR(0, 10a4) = 2000 ; RR(0, 10a4) = fffff0a4 ; LR + RR = 10a4

As you can see, now the LR fields are out of sync, and we get a
negative offset in the LDO instruction even though the addend + value
is still well within the range of a 14-bit signed field.

As far as I can tell, the ABI and possibly the instruction set are
broken by design by using an addition instead of a logical OR to fill
in the low bits of an immediate value [1].  But we have to cope with
this somehow.

> So it would appear that this is a problem with GCC, but I'm not really
> sure.

As far as I can tell, we can either fix this in GCC or in the linker.

I don't know if the linker is able to associate paired 21L and 14R
relocations, but if it were, I assume that it would be fairly easy to
make sure that they stay "in sync" with each other when linking with -r.

However, it could be argued that the real problem is that GCC always
omits the addend when outputting addil instructions for referring to
global data.  For example, this C code:

struct foo {
  int a[192];
  int b;
};

struct foo f = {
  {}, 42
}, g = {
  {}, 666
};

int a(void* foo)
{
}

int main()
{
  a(&f.a[145]);
  a(&f.b);
  a(&g.b);
  return;
}
Generates the following assembly code (edited for length and content):

main:
	.PROC
	.CALLINFO FRAME=64,CALLS,SAVE_RP
	.ENTRY
	stw %r2,-20(%r30)
	ldo 64(%r30),%r30
	addil LR'f-$global$,%r27                ; look ma, no addend
	.CALL ARGW0=GR
	bl a,%r2
	ldo RR'f-$global$+580(%r1),%r26         ; but we have one here!
	addil LR'f-$global$,%r27                ; no addend
	.CALL ARGW0=GR
	bl a,%r2
	ldo RR'f-$global$+768(%r1),%r26         ; addend
	addil LR'g-$global$,%r27                ; no addend
	.CALL ARGW0=GR
	bl a,%r2
	ldo RR'g-$global$+768(%r1),%r26         ; addend
	ldw -84(%r30),%r2
	bv %r0(%r2)
	ldo -64(%r30),%r30
	.EXIT
	.PROCEND

I don't see any good reason why GCC cannot put the addends on the
ADDIL instructions as well.  Manually munging the assembly code and
assembling it certainly produces correct output, and in fact doing the
same to net/ipv4/devinet.s in the kernel:

--- devinet.s~	Thu Jul 13 19:40:55 2000
+++ devinet.s	Thu Jul 13 19:41:16 2000
@@ -2806,7 +2806,7 @@
 	.CALL ARGW0=GR
 	bl register_netdevice_notifier,%r2
 	ldo RR'ip_netdev_notifier-$global$(%r1),%r26
-	addil LR'devinet_sysctl-$global$,%r27
+	addil LR'devinet_sysctl-$global$+840,%r27
 	ldi 0,%r25
 	ldo RR'devinet_sysctl-$global$+840(%r1),%r4
 	.CALL ARGW0=GR,ARGW1=GR

Fixes the non-booting problems :P

Of course, it would be a nice optimization if the above code could
reuse %r1 for different parts of the same structure, if it were of an
appropriate size.  However GCC does not appear to do anything of the
sort, and reading the RTL dumps indicates that the addends are
actually present in the insns all the way up until final output (this
is the RTX for the ADDIL in the .27.dbr dump from the above program):

(insn 8 35 45 (set (reg:SI 1 %r1)
        (high:SI (const:SI (plus:SI (symbol_ref:SI ("f"))
                    (const_int 580 [0x244]))))) 84 {post_std+6} (nil)
    (expr_list:REG_EQUIV (high:SI (const:SI (plus:SI (symbol_ref:SI ("f"))
                    (const_int 580 [0x244]))))
        (nil)))

Implementing the fix is left as an exercise to the writer (argh).

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
