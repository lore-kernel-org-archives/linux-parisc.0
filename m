Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA26565
	for <parisc-linux@puffin.external.hp.com>; Tue, 3 Oct 2000 12:33:03 -0600
Message-Id: <200010031838.LAA21115@milano.cup.hp.com>
To: "Thomas Marteau" <marteaut@esiee.fr>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: Errors building toolchain 
In-reply-to: Your message of "Fri, 03 Nov 2000 15:12:51 PST."
             <00e101c045a0$274fd0c0$a832d793@esiee.fr>
Date: Tue, 03 Oct 2000 11:38:06 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Thomas Marteau" wrote:
> Hi,
> 
> We are compiling the toolchain and we notice some mistakes we want to share
> just in case.

Hi Thomas,
Which host are you using to build the tools chain on/for?
What's the URL for the instructions you are referring too?
(I want to make sure we are talking about the same page)


I have updated the build-tools/recipe.linux to build a hppa-linux
cross compiler. And my builds now die with:
...
/linux/pa32/xc-build/build-gcc/gcc/xgcc -B/linux/pa32/xc-build/build-gcc/gcc/ -B/opt/puffin/hppa-linux/bin/ -B/opt/puffin/hppa-linux/lib/ -isystem /opt/puffin/hppa-linux/include -shared  .libs/adler32.o .libs/compress.o .libs/crc32.o .libs/deflate.o .libs/gzio.o .libs/infblock.o .libs/infcodes.o .libs/inffast.o .libs/inflate.o .libs/inftrees.o .libs/infutil.o .libs/trees.o .libs/uncompr.o .libs/zutil.o   -Wl,-soname -Wl,libzgcj.so.0 -o .libs/libzgcj.so.0.0.0
/opt/puffin/hppa-linux/bin/ld: cannot open crti.o: No such file or directory
collect2: ld returned 1 exit status
make[1]: *** [libzgcj.la] Error 1
make[1]: Leaving directory `/linux/pa32/xc-build/build-gcc/hppa-linux/zlib'
make: *** [install-target-zlib] Error 2

This is already in the install phase - so the build completed.
"ls -l" tells me hppa-linux-* stuff in /opt/puffin/bin was replaced.
The recipe.linux seems to have mostly completed.


> 1) Compiling gcc, we have an error which says that he can't find errno.h!
> 
> of course, it looks for it in $DEST/hppa-linux/include and the instructions
> say that include should be in $DEST --> does it look OK to you? because when
> you compile the kernel, it makes the same placement mistake. That's why we
> think that the include directory should be in $DEST/hppa-linux/. This would
> mean that help on your website is obsolete.

I can't reproduce this error since I don't actually follow the posted
instructions anymore...got tired of maintaining those. It was simpler
for me to just maintain the build-tools/recipe.linux script.

> 
> 2) Once gcc is installed, gcc program name is hppa1.1-linux-... and to
> compile the kernel, the system expects to have hppa-linux-...

hppa1.1-linux- prefix is obsolete.
Please post either the URL where you found that or (better) a patch for
the URL of what you think the help/instructions should say.

> We changed it to --target=hppa-linux and now it works ok, but is this
> logical?

Uh...that's what it's supposed to be.
(I'm not going to consider if it is or isn't logical.  :^)

> 3) Our NFSroot is read-only even if  we have configured the NFS server and
> said that it was read/write enabled.

Try:
  mount -o remount,rw /

and check the /etc/fstab entry for /. Should be something like:
    hpisp747:/tftpboot/hppa   /   nfs    defaults,errors=remount-ro   0  1


cheers,
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
