From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Thu, 23 Jun 2005 09:19:51 +0200
Message-ID: <4282FEEC00010335@mail-3-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

...
>
> /* Parse the -mfixed-range=3D option string.  */
>
> static void
> fix_range (const char *const_str)
> {
>   int i, first, last;
>   char *str, *dash, *comma;
>
>   /* str must be of the form REG1'-'REG2{,REG1'-'REG} where REG1 and
>   REG2 are either register names or register numbers.  The effect
>   of this option is to mark the registers in the range from REG1 to
>   REG2 as ``fixed'' so they won't be used by the compiler.  This is
>   used, e.g., to ensure that kernel mode code doesn't use f32-f127.  */=

>
That confirms well the gcc info description:
`-mfixed-range=3DREGISTER-RANGE'
      Generate code treating the given register range as fixed registers.=

      A fixed register is one that the register allocator can not use.
      This is useful when compiling kernel code. A register range is
      specified as two registers separated by a dash. Multiple register
      ranges can be specified separated by a comma.
 ;-)

> You are probably best to use register names.
I would prefer too.

> There are 28 fp registers
> starting at fr4.  The number for fr4 is 32.  I see there is a typo
> in the comment regarding the range, "f32-f127".  This is a cut and
> paste error.
>
Nice add on (tx),

> The millicode routines don't use the fp regs.  However, libgcc does
> and the kernel is linked against libgcc.  Thus, for this to work, you
> will need to build both a kernel build version of gcc and the kernel
> with the -mfixed-range option.  You probably want to leave about four
> fp registers unfixed for integer multiplcation.  This is essential on
> hppa64 as we don't have millicode support for 64-bit integer
> multiplication.  This support is provided by libgcc routines.
>
my main interest is still 32bit kernel  for the moment(the most of my sys=
tems
 b180,  c110, d380 ;-)):
2.6.8 ans 2.6.9-rc2-pa1 works fine when compiled with -mdisable-fpregs op=
tion
but panicing quickly whitout?

And effectively with -mdisable-fpregs option a function like <do_setitime=
r>
(amoung others) used __muldi3 as in:
[...]
1012b630:       e8 4b 01 61     b,l 101016e8 <__muldi3>,rp
[...]
1012b650:       e8 4b 01 21     b,l 101016e8 <__muldi3>,rp
1012b654:       08 03 02 5a     copy r3,r26
[...]

while without it obviously compile something like:
[...]
1012ba00:       27 88 10 16     fldw 4(,ret0),fr22
1012ba04:       30 00 40 16     fcpy,sgl fr0,fr22
1012ba08:       37 b6 1c 29     ldo -11ec(ret1),r22
1012ba0c:       22 bc 8d 1a     ldil 68db8000,r21
1012ba10:       27 c1 12 16     fstw fr22,-10(,sp)
1012ba14:       36 b8 17 5a     ldo bad(r21),r24
1012ba18:       34 01 1f fe     ldi fff,r1
1012ba1c:       34 02 3f ff     ldi -1,rp
1012ba20:       22 a6 22 06     ldil 1030d000,r21
1012ba24:       0f c1 10 93     ldw -10(,sp),r19
1012ba28:       36 b5 09 a0     ldo 4d0(r21),r21
1012ba2c:       2e a0 10 17     fldd 0(,r21),fr23
1012ba30:       d2 77 1c 1f     extrw,s r19,0,1,r23
1012ba34:       3a d7 57 17     xmpyu fr22,fr23R,fr23
1012ba38:       0b 17 02 17     and r23,r24,r23
1012ba3c:       2f c1 12 17     fstd fr23,-10(,sp)
[...]

But that doesn't make me yet understand what it could make as side effect=

versus
the 64bit twin kernel??

I still have to learn more ;-)

Thanks a lot,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
