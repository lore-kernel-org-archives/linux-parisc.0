Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA32705
	for <parisc-linux@puffin.external.hp.com>; Mon, 31 Jul 2000 15:41:28 -0600
Message-Id: <200007312145.OAA29210@milano.cup.hp.com>
To: Tara Dear <tdear@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] recipe 
In-reply-to: Your message of "Mon, 31 Jul 2000 21:03:00 PDT."
             <39864BF4.4FD098D0@linuxcare.com>
Date: Mon, 31 Jul 2000 14:45:44 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Tara Dear wrote:
> dhd asked me to post this recipe the group.  I worked for me.

Tara, dhd,

The first time I ran this script, it failed with a "permission
denied" error. This is on a debian potato i686-linux host.
I've appended the output that was still in scrollback.

The second time I ran recipe it worked fine.
I delete $PREFIX and ran the recipe a third time and that worked too.
I'm guessing on the first run something wasn't kosher in my env.

I've also included the first patches for the recipe.

grant


grundler <552>diff recipe.tara.orig recipe.tara
3c3,9
< PREFIX=/home/tdear/parisc
---
> #
> # build 32-bit toolchain
> #
> PREFIX=/opt/puffin/
> 
> # make sure we don't pick up other tools
> PATH=/usr/local/bin:/usr/bin:/bin
6d11
< export CVS_RSH=ssh



...
mv -f /linux/grundler/glibc-build/stdio-common/fscanf.T /linux/grundler/glibc-build/stdio-common/fscanf.d 
.././scripts/mkinstalldirs /linux/grundler/glibc-build/stdio-common
bc-build/../linux-2.3/include  -include ../include/libc-symbols.h      | sed -e 's,vfscanf\.o,/linux/grundler/glibc-build/stdio-common/vfscanf.o /linux/grundler/glibc-build/stdio-common/vfscanf.os /linux/grundler/glibc-build/stdio-common/vfscanf.op /linux/grundler/glibc-build/stdio-common/vfscanf.og /linux/grundler/glibc-build/stdio-common/vfscanf.ob /linux/grundler/glibc-build/stdio-common/vfscanf.oS /linux/grundler/glibc-build/stdio-common/vfscanf.d,' -e 's@ /linux/grundler/glibc-build/@ $(common-objpfx)@g' -e 's@^/linux/grundler/glibc-build/@$(common-objpfx)@g' > /linux/grundler/glibc-build/stdio-common/vfscanf.T
mv -f /linux/grundler/glibc-build/stdio-common/vfscanf.T /linux/grundler/glibc-build/stdio-common/vfscanf.d 
.././scripts/mkinstalldirs /linux/grundler/glibc-build/stdio-common
-2.3/include  -include ../include/libc-symbols.h      | sed -e 's,dprintf\.o,/linux/grundler/glibc-build/stdio-common/dprintf.o /linux/grundler/glibc-build/stdio-common/dprintf.os /linux/grundler/glibc-build/stdio-common/dprintf.op /linux/grundler/glibc-build/stdio-common/dprintf.og /linux/grundler/glibc-build/stdio-common/dprintf.ob /linux/grundler/glibc-build/stdio-common/dprintf.oS /linux/grundler/glibc-build/stdio-common/dprintf.d,' -e 's@ /linux/grundler/glibc-build/@ $(common-objpfx)@g' -e 's@^/linux/grundler/glibc-build/@$(common-objpfx)@g' > /linux/grundler/glibc-build/stdio-common/dprintf.T
mv -f /linux/grundler/glibc-build/stdio-common/dprintf.T /linux/grundler/glibc-build/stdio-common/dprintf.d 
.././scripts/mkinstalldirs /linux/grundler/glibc-build/stdio-common
../linux-2.3/include  -include ../include/libc-symbols.h      | sed -e 's,asprintf\.o,/linux/grundler/glibc-build/stdio-common/asprintf.o /linux/grundler/glibc-build/stdio-common/asprintf.os /linux/grundler/glibc-build/stdio-common/asprintf.op /linux/grundler/glibc-build/stdio-common/asprintf.og /linux/grundler/glibc-build/stdio-common/asprintf.ob /linux/grundler/glibc-build/stdio-common/asprintf.oS /linux/grundler/glibc-build/stdio-common/asprintf.d,' -e 's@ /linux/grundler/glibc-build/@ $(common-objpfx)@g' -e 's@^/linux/grundler/glibc-build/@$(common-objpfx)@g' > /linux/grundler/glibc-build/stdio-common/asprintf.T
mv -f /linux/grundler/glibc-build/stdio-common/asprintf.T /linux/grundler/glibc-build/stdio-common/asprintf.d 
.././scripts/mkinstalldirs /linux/grundler/glibc-build/stdio-common
ux-2.3/include  -include ../include/libc-symbols.h      | sed -e 's,sprintf\.o,/linux/grundler/glibc-build/stdio-common/sprintf.o /linux/grundler/glibc-build/stdio-common/sprintf.os /linux/grundler/glibc-build/stdio-common/sprintf.op /linux/grundler/glibc-build/stdio-common/sprintf.og /linux/grundler/glibc-build/stdio-common/sprintf.ob /linux/grundler/glibc-build/stdio-common/sprintf.oS /linux/grundler/glibc-build/stdio-common/sprintf.d,' -e 's@ /linux/grundler/glibc-build/@ $(common-objpfx)@g' -e 's@^/linux/grundler/glibc-build/@$(common-objpfx)@g' > /linux/grundler/glibc-build/stdio-common/sprintf.T
mv -f /linux/grundler/glibc-build/stdio-common/sprintf.T /linux/grundler/glibc-build/stdio-common/sprintf.d 
.././scripts/mkinstalldirs /linux/grundler/glibc-build/stdio-common
d/../linux-2.3/include  -include ../include/libc-symbols.h      | sed -e 's,snprintf\.o,/linux/grundler/glibc-build/stdio-common/snprintf.o /linux/grundler/glibc-build/stdio-common/snprintf.os /linux/grundler/glibc-build/stdio-common/snprintf.op /linux/grundler/glibc-build/stdio-common/snprintf.og /linux/grundler/glibc-build/stdio-common/snprintf.ob /linux/grundler/glibc-build/stdio-common/snprintf.oS /linux/grundler/glibc-build/stdio-common/snprintf.d,' -e 's@ /linux/grundler/glibc-build/@ $(common-objpfx)@g' -e 's@^/linux/grundler/glibc-build/@$(common-objpfx)@g' > /linux/grundler/glibc-build/stdio-common/snprintf.T
mv -f /linux/grundler/glibc-build/stdio-common/snprintf.T /linux/grundler/glibc-build/stdio-common/snprintf.d 
.././scripts/mkinstalldirs /linux/grundler/glibc-build/stdio-common
nux-2.3/include  -include ../include/libc-symbols.h      | sed -e 's,printf\.o,/linux/grundler/glibc-build/stdio-common/printf.o /linux/grundler/glibc-build/stdio-common/printf.os /linux/grundler/glibc-build/stdio-common/printf.op /linux/grundler/glibc-build/stdio-common/printf.og /linux/grundler/glibc-build/stdio-common/printf.ob /linux/grundler/glibc-build/stdio-common/printf.oS /linux/grundler/glibc-build/stdio-common/printf.d,' -e 's@ /linux/grundler/glibc-build/@ $(common-objpfx)@g' -e 's@^/linux/grundler/glibc-build/@$(common-objpfx)@g' > /linux/grundler/glibc-build/stdio-common/printf.T
mv -f /linux/grundler/glibc-build/stdio-common/printf.T /linux/grundler/glibc-build/stdio-common/printf.d 
.././scripts/mkinstalldirs /linux/grundler/glibc-build/stdio-common
2.3/include  -include ../include/libc-symbols.h      | sed -e 's,fprintf\.o,/linux/grundler/glibc-build/stdio-common/fprintf.o /linux/grundler/glibc-build/stdio-common/fprintf.os /linux/grundler/glibc-build/stdio-common/fprintf.op /linux/grundler/glibc-build/stdio-common/fprintf.og /linux/grundler/glibc-build/stdio-common/fprintf.ob /linux/grundler/glibc-build/stdio-common/fprintf.oS /linux/grundler/glibc-build/stdio-common/fprintf.d,' -e 's@ /linux/grundler/glibc-build/@ $(common-objpfx)@g' -e 's@^/linux/grundler/glibc-build/@$(common-objpfx)@g' > /linux/grundler/glibc-build/stdio-common/fprintf.T
mv -f /linux/grundler/glibc-build/stdio-common/fprintf.T /linux/grundler/glibc-build/stdio-common/fprintf.d 
.././scripts/mkinstalldirs /linux/grundler/glibc-build/stdio-common
d/../linux-2.3/include  -include ../include/libc-symbols.h      | sed -e 's,printf_size\.o,/linux/grundler/glibc-build/stdio-common/printf_size.o /linux/grundler/glibc-build/stdio-common/printf_size.os /linux/grundler/glibc-build/stdio-common/printf_size.op /linux/grundler/glibc-build/stdio-common/printf_size.og /linux/grundler/glibc-build/stdio-common/printf_size.ob /linux/grundler/glibc-build/stdio-common/printf_size.oS /linux/grundler/glibc-build/stdio-common/printf_size.d,' -e 's@ /linux/grundler/glibc-build/@ $(common-objpfx)@g' -e 's@^/linux/grundler/glibc-build/@$(common-objpfx)@g' > /linux/grundler/glibc-build/stdio-common/printf_size.T
mv -f /linux/grundler/glibc-build/stdio-common/printf_size.T /linux/grundler/glibc-build/stdio-common/printf_size.d 
.././scripts/mkinstalldirs /linux/grundler/glibc-build/stdio-common
isystem /linux/grundler/glibc-build/../linux-2.3/include  -include ../include/libc-symbols.h      | sed -e 's,printf_fphex\.o,/linux/grundler/glibc-build/stdio-common/printf_fphex.o /linux/grundler/glibc-build/stdio-common/printf_fphex.os /linux/grundler/glibc-build/stdio-common/printf_fphex.op /linux/grundler/glibc-build/stdio-common/printf_fphex.og /linux/grundler/glibc-build/stdio-common/printf_fphex.ob /linux/grundler/glibc-build/stdio-common/printf_fphex.oS /linux/grundler/glibc-build/stdio-common/printf_fphex.d,' -e 's@ /linux/grundler/glibc-build/@ $(common-objpfx)@g' -e 's@^/linux/grundler/glibc-build/@$(common-objpfx)@g' > /linux/grundler/glibc-build/stdio-common/printf_fphex.T
mv -f /linux/grundler/glibc-build/stdio-common/printf_fphex.T /linux/grundler/glibc-build/stdio-common/printf_fphex.d 
.././scripts/mkinstalldirs /linux/grundler/glibc-build/stdio-common
./linux-2.3/include  -include ../include/libc-symbols.h      | sed -e 's,printf-prs\.o,/linux/grundler/glibc-build/stdio-common/printf-prs.o /linux/grundler/glibc-build/stdio-common/printf-prs.os /linux/grundler/glibc-build/stdio-common/printf-prs.op /linux/grundler/glibc-build/stdio-common/printf-prs.og /linux/grundler/glibc-build/stdio-common/printf-prs.ob /linux/grundler/glibc-build/stdio-common/printf-prs.oS /linux/grundler/glibc-build/stdio-common/printf-prs.d,' -e 's@ /linux/grundler/glibc-build/@ $(common-objpfx)@g' -e 's@^/linux/grundler/glibc-build/@$(common-objpfx)@g' > /linux/grundler/glibc-build/stdio-common/printf-prs.T
mv -f /linux/grundler/glibc-build/stdio-common/printf-prs.T /linux/grundler/glibc-build/stdio-common/printf-prs.d 
.././scripts/mkinstalldirs /linux/grundler/glibc-build/stdio-common
-2.3/include  -include ../include/libc-symbols.h      | sed -e 's,reg-printf\.o,/linux/grundler/glibc-build/stdio-common/reg-printf.o /linux/grundler/glibc-build/stdio-common/reg-printf.os /linux/grundler/glibc-build/stdio-common/reg-printf.op /linux/grundler/glibc-build/stdio-common/reg-printf.og /linux/grundler/glibc-build/stdio-common/reg-printf.ob /linux/grundler/glibc-build/stdio-common/reg-printf.oS /linux/grundler/glibc-build/stdio-common/reg-printf.d,' -e 's@ /linux/grundler/glibc-build/@ $(common-objpfx)@g' -e 's@^/linux/grundler/glibc-build/@$(common-objpfx)@g' > /linux/grundler/glibc-build/stdio-common/reg-printf.T
mv -f /linux/grundler/glibc-build/stdio-common/reg-printf.T /linux/grundler/glibc-build/stdio-common/reg-printf.d 
.././scripts/mkinstalldirs /linux/grundler/glibc-build/stdio-common
ibc-build/../linux-2.3/include  -include ../include/libc-symbols.h      | sed -e 's,printf_fp\.o,/linux/grundler/glibc-build/stdio-common/printf_fp.o /linux/grundler/glibc-build/stdio-common/printf_fp.os /linux/grundler/glibc-build/stdio-common/printf_fp.op /linux/grundler/glibc-build/stdio-common/printf_fp.og /linux/grundler/glibc-build/stdio-common/printf_fp.ob /linux/grundler/glibc-build/stdio-common/printf_fp.oS /linux/grundler/glibc-build/stdio-common/printf_fp.d,' -e 's@ /linux/grundler/glibc-build/@ $(common-objpfx)@g' -e 's@^/linux/grundler/glibc-build/@$(common-objpfx)@g' > /linux/grundler/glibc-build/stdio-common/printf_fp.T
mv -f /linux/grundler/glibc-build/stdio-common/printf_fp.T /linux/grundler/glibc-build/stdio-common/printf_fp.d 
.././scripts/mkinstalldirs /linux/grundler/glibc-build/stdio-common
3/include  -include ../include/libc-symbols.h      | sed -e 's,vprintf\.o,/linux/grundler/glibc-build/stdio-common/vprintf.o /linux/grundler/glibc-build/stdio-common/vprintf.os /linux/grundler/glibc-build/stdio-common/vprintf.op /linux/grundler/glibc-build/stdio-common/vprintf.og /linux/grundler/glibc-build/stdio-common/vprintf.ob /linux/grundler/glibc-build/stdio-common/vprintf.oS /linux/grundler/glibc-build/stdio-common/vprintf.d,' -e 's@ /linux/grundler/glibc-build/@ $(common-objpfx)@g' -e 's@^/linux/grundler/glibc-build/@$(common-objpfx)@g' > /linux/grundler/glibc-build/stdio-common/vprintf.T
mv -f /linux/grundler/glibc-build/stdio-common/vprintf.T /linux/grundler/glibc-build/stdio-common/vprintf.d 
.././scripts/mkinstalldirs /linux/grundler/glibc-build/stdio-common
er/glibc-build/../linux-2.3/include  -include ../include/libc-symbols.h      | sed -e 's,vfprintf\.o,/linux/grundler/glibc-build/stdio-common/vfprintf.o /linux/grundler/glibc-build/stdio-common/vfprintf.os /linux/grundler/glibc-build/stdio-common/vfprintf.op /linux/grundler/glibc-build/stdio-common/vfprintf.og /linux/grundler/glibc-build/stdio-common/vfprintf.ob /linux/grundler/glibc-build/stdio-common/vfprintf.oS /linux/grundler/glibc-build/stdio-common/vfprintf.d,' -e 's@ /linux/grundler/glibc-build/@ $(common-objpfx)@g' -e 's@^/linux/grundler/glibc-build/@$(common-objpfx)@g' > /linux/grundler/glibc-build/stdio-common/vfprintf.T
mv -f /linux/grundler/glibc-build/stdio-common/vfprintf.T /linux/grundler/glibc-build/stdio-common/vfprintf.d 
.././scripts/mkinstalldirs /linux/grundler/glibc-build/stdio-common
r/glibc-build/../linux-2.3/include  -include ../include/libc-symbols.h      | sed -e 's,itowa-digits\.o,/linux/grundler/glibc-build/stdio-common/itowa-digits.o /linux/grundler/glibc-build/stdio-common/itowa-digits.os /linux/grundler/glibc-build/stdio-common/itowa-digits.op /linux/grundler/glibc-build/stdio-common/itowa-digits.og /linux/grundler/glibc-build/stdio-common/itowa-digits.ob /linux/grundler/glibc-build/stdio-common/itowa-digits.oS /linux/grundler/glibc-build/stdio-common/itowa-digits.d,' -e 's@ /linux/grundler/glibc-build/@ $(common-objpfx)@g' -e 's@^/linux/grundler/glibc-build/@$(common-objpfx)@g' > /linux/grundler/glibc-build/stdio-common/itowa-digits.T
mv -f /linux/grundler/glibc-build/stdio-common/itowa-digits.T /linux/grundler/glibc-build/stdio-common/itowa-digits.d 
.././scripts/mkinstalldirs /linux/grundler/glibc-build/stdio-common
ild/../linux-2.3/include  -include ../include/libc-symbols.h      | sed -e 's,itoa-digits\.o,/linux/grundler/glibc-build/stdio-common/itoa-digits.o /linux/grundler/glibc-build/stdio-common/itoa-digits.os /linux/grundler/glibc-build/stdio-common/itoa-digits.op /linux/grundler/glibc-build/stdio-common/itoa-digits.og /linux/grundler/glibc-build/stdio-common/itoa-digits.ob /linux/grundler/glibc-build/stdio-common/itoa-digits.oS /linux/grundler/glibc-build/stdio-common/itoa-digits.d,' -e 's@ /linux/grundler/glibc-build/@ $(common-objpfx)@g' -e 's@^/linux/grundler/glibc-build/@$(common-objpfx)@g' > /linux/grundler/glibc-build/stdio-common/itoa-digits.T
mv -f /linux/grundler/glibc-build/stdio-common/itoa-digits.T /linux/grundler/glibc-build/stdio-common/itoa-digits.d 
.././scripts/mkinstalldirs /linux/grundler/glibc-build/stdio-common
bc-build/../linux-2.3/include  -include ../include/libc-symbols.h      | sed -e 's,_i18n_itowa\.o,/linux/grundler/glibc-build/stdio-common/_i18n_itowa.o /linux/grundler/glibc-build/stdio-common/_i18n_itowa.os /linux/grundler/glibc-build/stdio-common/_i18n_itowa.op /linux/grundler/glibc-build/stdio-common/_i18n_itowa.og /linux/grundler/glibc-build/stdio-common/_i18n_itowa.ob /linux/grundler/glibc-build/stdio-common/_i18n_itowa.oS /linux/grundler/glibc-build/stdio-common/_i18n_itowa.d,' -e 's@ /linux/grundler/glibc-build/@ $(common-objpfx)@g' -e 's@^/linux/grundler/glibc-build/@$(common-objpfx)@g' > /linux/grundler/glibc-build/stdio-common/_i18n_itowa.T
mv -f /linux/grundler/glibc-build/stdio-common/_i18n_itowa.T /linux/grundler/glibc-build/stdio-common/_i18n_itowa.d 
.././scripts/mkinstalldirs /linux/grundler/glibc-build/stdio-common
/glibc-build/../linux-2.3/include  -include ../include/libc-symbols.h      | sed -e 's,_i18n_itoa\.o,/linux/grundler/glibc-build/stdio-common/_i18n_itoa.o /linux/grundler/glibc-build/stdio-common/_i18n_itoa.os /linux/grundler/glibc-build/stdio-common/_i18n_itoa.op /linux/grundler/glibc-build/stdio-common/_i18n_itoa.og /linux/grundler/glibc-build/stdio-common/_i18n_itoa.ob /linux/grundler/glibc-build/stdio-common/_i18n_itoa.oS /linux/grundler/glibc-build/stdio-common/_i18n_itoa.d,' -e 's@ /linux/grundler/glibc-build/@ $(common-objpfx)@g' -e 's@^/linux/grundler/glibc-build/@$(common-objpfx)@g' > /linux/grundler/glibc-build/stdio-common/_i18n_itoa.T
mv -f /linux/grundler/glibc-build/stdio-common/_i18n_itoa.T /linux/grundler/glibc-build/stdio-common/_i18n_itoa.d 
.././scripts/mkinstalldirs /linux/grundler/glibc-build/stdio-common
d/../linux-2.3/include  -include ../include/libc-symbols.h      | sed -e 's,_itowa\.o,/linux/grundler/glibc-build/stdio-common/_itowa.o /linux/grundler/glibc-build/stdio-common/_itowa.os /linux/grundler/glibc-build/stdio-common/_itowa.op /linux/grundler/glibc-build/stdio-common/_itowa.og /linux/grundler/glibc-build/stdio-common/_itowa.ob /linux/grundler/glibc-build/stdio-common/_itowa.oS /linux/grundler/glibc-build/stdio-common/_itowa.d,' -e 's@ /linux/grundler/glibc-build/@ $(common-objpfx)@g' -e 's@^/linux/grundler/glibc-build/@$(common-objpfx)@g' > /linux/grundler/glibc-build/stdio-common/_itowa.T
mv -f /linux/grundler/glibc-build/stdio-common/_itowa.T /linux/grundler/glibc-build/stdio-common/_itowa.d 
.././scripts/mkinstalldirs /linux/grundler/glibc-build/stdio-common
inux-2.3/include  -include ../include/libc-symbols.h      | sed -e 's,_itoa\.o,/linux/grundler/glibc-build/stdio-common/_itoa.o /linux/grundler/glibc-build/stdio-common/_itoa.os /linux/grundler/glibc-build/stdio-common/_itoa.op /linux/grundler/glibc-build/stdio-common/_itoa.og /linux/grundler/glibc-build/stdio-common/_itoa.ob /linux/grundler/glibc-build/stdio-common/_itoa.oS /linux/grundler/glibc-build/stdio-common/_itoa.d,' -e 's@ /linux/grundler/glibc-build/@ $(common-objpfx)@g' -e 's@^/linux/grundler/glibc-build/@$(common-objpfx)@g' > /linux/grundler/glibc-build/stdio-common/_itoa.T
mv -f /linux/grundler/glibc-build/stdio-common/_itoa.T /linux/grundler/glibc-build/stdio-common/_itoa.d 
.././scripts/mkinstalldirs /linux/grundler/glibc-build/stdio-common
/grundler/glibc-build/../linux-2.3/include  -include ../include/libc-symbols.h      | sed -e 's,cuserid\.o,/linux/grundler/glibc-build/stdio-common/cuserid.o /linux/grundler/glibc-build/stdio-common/cuserid.os /linux/grundler/glibc-build/stdio-common/cuserid.op /linux/grundler/glibc-build/stdio-common/cuserid.og /linux/grundler/glibc-build/stdio-common/cuserid.ob /linux/grundler/glibc-build/stdio-common/cuserid.oS /linux/grundler/glibc-build/stdio-common/cuserid.d,' -e 's@ /linux/grundler/glibc-build/@ $(common-objpfx)@g' -e 's@^/linux/grundler/glibc-build/@$(common-objpfx)@g' > /linux/grundler/glibc-build/stdio-common/cuserid.T
mv -f /linux/grundler/glibc-build/stdio-common/cuserid.T /linux/grundler/glibc-build/stdio-common/cuserid.d 
.././scripts/mkinstalldirs /linux/grundler/glibc-build/stdio-common
/grundler/glibc-build/../linux-2.3/include  -include ../include/libc-symbols.h      | sed -e 's,ctermid\.o,/linux/grundler/glibc-build/stdio-common/ctermid.o /linux/grundler/glibc-build/stdio-common/ctermid.os /linux/grundler/glibc-build/stdio-common/ctermid.op /linux/grundler/glibc-build/stdio-common/ctermid.og /linux/grundler/glibc-build/stdio-common/ctermid.ob /linux/grundler/glibc-build/stdio-common/ctermid.oS /linux/grundler/glibc-build/stdio-common/ctermid.d,' -e 's@ /linux/grundler/glibc-build/@ $(common-objpfx)@g' -e 's@^/linux/grundler/glibc-build/@$(common-objpfx)@g' > /linux/grundler/glibc-build/stdio-common/ctermid.T
mv -f /linux/grundler/glibc-build/stdio-common/ctermid.T /linux/grundler/glibc-build/stdio-common/ctermid.d 
make[2]: Leaving directory `/linux/grundler/glibc/stdio-common'
make[2]: Entering directory `/linux/grundler/glibc/stdio-common'
mawk -f ../sysdeps/gnu/errlist.awk ../manual/errno.texi > ../sysdeps/gnu/errlist.c-tmp
chmod a-w ../sysdeps/gnu/errlist.c-tmp
mv -f ../sysdeps/gnu/errlist.c-tmp ../sysdeps/gnu/errlist.c
test ! -d CVS || cvs commit -m'Regenerated from ../sysdeps/gnu/errlist.awk ../manual/errno.texi' ../sysdeps/gnu/errlist.c
Permission denied
make[2]: *** [../sysdeps/gnu/errlist.c] Error 1
make[2]: Leaving directory `/linux/grundler/glibc/stdio-common'
make[1]: *** [stdio-common/subdir_lib] Error 2
make[1]: Leaving directory `/linux/grundler/glibc'
make: *** [all] Error 2
