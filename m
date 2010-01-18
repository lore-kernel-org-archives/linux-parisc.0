From: Grant Grundler <grundler@parisc-linux.org>
Subject: fs/compat_ioctl.c:1651:2: error: bit-field '<anonymous>' width not
	an integer constant
Date: Mon, 18 Jan 2010 00:31:48 -0700
Message-ID: <20100118073148.GE28448@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Is this a known problem?

I'm getting this error on linus' kernel tree build:
fs/compat_ioctl.c:1651:2: error: bit-field '<anonymous>' width not an integer constant

The offending code is:
1646 static int compat_ioctl_check_table(unsigned int xcmd)
1647 {
1648         int i;
1649         const int max = ARRAY_SIZE(ioctl_pointer) - 1;
1650 
1651         BUILD_BUG_ON(max >= (1 << 16));


This "looks" right to me. Everything is a constant other than "max".
Since max is declared "const", I *expect* max to behave like a constant.


I used "make V=1" to get the command than used that to preprocess the code:

hppa64-linux-gnu-gcc -Wp,-MD,fs/.compat_ioctl.o.d  -nostdinc -isystem /home/dave/opt/gnu64/gcc-4.5.0/lib/gcc/hppa64-linux-gnu/4.5.0/include -I/usr/src/linux-2.6/arch/parisc/include -Iinclude  -include include/generated/autoconf.h -D__KERNEL__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -Os -pipe -mno-space-regs -mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=2.0 -mschedule=8000 -Wframe-larger-than=2048 -fno-stack-protector -fomit-frame-pointer -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fno-dwarf2-cfi-asm -fconserve-stack   -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(compat_ioctl)"  -D"KBUILD_MODNAME=KBUILD_STR(c
 ompat_ioctl)"  -E -o fs/.tmp_compat_ioctl.P fs/compat_ioctl.c

and I believe the same code in fs/.tmp_compat_ioctl.P is:

static int compat_ioctl_check_table(unsigned int xcmd)
{
 int i;
 const int max = (sizeof(ioctl_pointer) / sizeof((ioctl_pointer)[0]) + (sizeof(struct { int:-!!(__builtin_types_compatible_p(typeof(ioctl_pointer), typeof(&ioctl_pointer[0]))); }))) - 1;

 ((void)(sizeof(struct { int:-!!(max >= (1 << 16)); })));


I can't make sense of this since I have no clue what "int:-!!" means.


BTW, I also looked in include/linux/kernel.h:

/* Force a compilation error if condition is true */
#define BUILD_BUG_ON(condition) ((void)BUILD_BUG_ON_ZERO(condition))

...
/* Force a compilation error if condition is true, but also produce a
   result (of value 0 and type size_t), so the expression can be used
   e.g. in a structure initializer (or where-ever else comma expressions
   aren't permitted). */
#define BUILD_BUG_ON_ZERO(e) (sizeof(struct { int:-!!(e); }))
#define BUILD_BUG_ON_NULL(e) ((void *)sizeof(struct { int:-!!(e); }))

Source this comes from is gsyprf11:/usr/src/linux-2.6 and I just did
a git pull. Please let me know if I just got unlucky and should pull again.

hth,
grant
