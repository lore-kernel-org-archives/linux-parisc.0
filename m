Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA03624
	for <parisc-linux@puffin.external.hp.com>; Mon, 4 Sep 2000 00:58:08 -0600
Message-ID: <A4A5E4C468B5D11190220001FA6835DD04DD86BC@epixch003>
From: =?iso-8859-1?Q?SOETE_Jo=EBl?= <JSO@europay.com>
To: "'Paul Bame'" <bame@noam.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: RE: [parisc-linux] FW: hpux 11.00 near success 
Date: Mon, 4 Sep 2000 08:58:25 +0200 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Hi Paul,

> = recipe.linux) I just note that host is not anymore 
> specified. Is it perhaps
> = the mistake? I will advise asap.
> 
> You probably want target=hppa-linux and host=hppa1.1-hpux10 
> or something like that.

I downloaded the tool chain dated 20000901 and
I just launch the configure as per recipe.hpux (without specifying host)
and it build it himself as 'hppa1.1-hp-hpux11.00' and just begin with
message:

*** This configuration is not supported in the following subdirectories:
     ld
    (Any other directories should still work fine.)

And ...

gcc make failled:

if [ -f hppa1.1-hpux-ranlib ] || ( [ hppa1.1-hp-hpux11.00 = hppa1.1-hp-hpux
] && [ -f /usr/bin/ranlib -o -f /bin/ranlib ] ) ; then \
  hppa1.1-hpux-ranlib ./libgcc.a ; \
else true; fi;
gmake[2]: Leaving directory `/linux/pa32/hpux-build/build-gcc/gcc'
/linux/pa32/hpux-build/build-gcc/gcc/xgcc
-B/linux/pa32/hpux-build/build-gcc/gcc/ -B/opt/puffin/hppa1.1-hpux/bin/
-B/opt/puffin/hppa1.1-hpux/lib/ -isystem /opt/puffin/hppa1.1-hpux/include
-DCROSS_COMPILE -DIN_GCC    `echo -g -O2|sed -e 's/-pedantic//g' -e
's/-Wtraditional//g'` -isystem ./include     -c
../../../gcc/gcc/libgcc1-test.c
cc1: warning: -g is only supported when using GAS on this processor,
cc1: warning: -g option disabled.
Testing libgcc1.  Ignore linker warning messages.
/linux/pa32/hpux-build/build-gcc/gcc/xgcc
-B/linux/pa32/hpux-build/build-gcc/gcc/ -B/opt/puffin/hppa1.1-hpux/bin/
-B/opt/puffin/hppa1.1-hpux/lib/ -isystem /opt/puffin/hppa1.1-hpux/include
-DCROSS_COMPILE -DIN_GCC    `echo -g -O2|sed -e 's/-pedantic//g' -e
's/-Wtraditional//g'` -isystem ./include  libgcc1-test.o -o libgcc1-test \
  -nostartfiles -nostdlib `/linux/pa32/hpux-build/build-gcc/gcc/xgcc
-B/linux/pa32/hpux-build/build-gcc/gcc/ -B/opt/puffin/hppa1.1-hpux/bin/
-B/opt/puffin/hppa1.1-hpux/lib/ -isystem /opt/puffin/hppa1.1-hpux/include
--print-libgcc-file-name`
collect2: cannot find `ld'
gmake[1]: *** [libgcc1-test] Error 1
gmake[1]: Leaving directory `/linux/pa32/hpux-build/build-gcc/gcc'
gmake: *** [all-gcc] Error 2

Do I have to assume that it tries to find ld that binutils did not reach to
build?

> 
> Ok, that probably means you need a full tool chain not just
> the one described in the recipes.  x86 users should probably 
> grab the tarball
> ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86/xc-20000829.tgz
> because building the full tool chain is often difficult.

> For hpux, start with the recipe in buildutils/palinux-autobuilder.
> Be sure to change this line: '$host="i386-linux";' in the script.

But with the HPUX box I have not Internet also not CVS access.
Never the less I will try to configure (change variable to match my env)
palinux-autobuilder asap.

Thanks again for advises,
	Joel


**********************************************************************
This e-mail and any attachments to it may contain confidential information which is strictly intended for the use of the authorised recipient.  If you have received this e-mail in error, please delete it and notify the sender by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************
