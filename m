Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA21013
	for <parisc-linux@puffin.external.hp.com>; Thu, 31 Aug 2000 10:59:47 -0600
Received: from epixchims.europay.com (unverified) by epirel991.europay.com
 (Content Technologies SMTPRS 4.1.5) with ESMTP id <Tac10592d464e5eb34c81@epirel991.europay.com> for <parisc-linux@thepuffingroup.com>;
 Thu, 31 Aug 2000 18:57:37 +0200
Message-ID: <A4A5E4C468B5D11190220001FA6835DD04DD86B9@epixch003>
From: =?iso-8859-1?Q?SOETE_Jo=EBl?= <JSO@europay.com>
To: "'parisc-linux@thepuffingroup.com'" <parisc-linux@thepuffingroup.com>
Date: Thu, 31 Aug 2000 18:59:20 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Subject: [parisc-linux] FW: hpux 11.00 near success
List-ID: <linux-parisc.vger.kernel.org>



-----Original Message-----
From: SOETE Joël 
Sent: Thursday, August 31, 2000 6:57 PM
To: 'Grant Grundler'
Cc: parisc-linux@thepuffingroup.hp.com
Subject: hpux 11.00 near success


Dear Grant,

I have to modify as bellow the 'recipe' procedure to finally reach to build
successfully the tool chain
but I still met the following error at the very end of palo make:

....
cd palo && make
make[2]: Entering directory `/Tools/palo/palo'
hppa-linux-gcc -g -O -I../include -I../lib -I../../linux-2.3/include   -c -o
elf64.o ../lib/elf64.c
hppa-linux-gcc -g -O -I../include -I../lib -I../../linux-2.3/include   -c -o
load.o ../lib/load.c
hppa-linux-gcc -g -O -I../include -I../lib -I../../linux-2.3/include   -c -o
paloio.o paloio.c
hppa-linux-gcc -g -O -I../include -I../lib -I../../linux-2.3/include   -c -o
som.o ../lib/som.c
hppa-linux-gcc -g -O -I../include -I../lib -I../../linux-2.3/include   -c -o
elf32.o ../lib/elf32.c
In file included from /opt/puffin/hppa1.1-linux/include/stdio.h:40,
                 from ../lib/elf32.c:12:
/opt/puffin/hppa1.1-linux/include/bits/types.h:97:25: warning: "__NFDBITS"
redefined
../../linux-2.3/include/linux/posix_types.h:22:1: warning: this is the
location of the previous definition
/opt/puffin/hppa1.1-linux/include/bits/types.h:99:17: warning: "__FDMASK"
redefined
../../linux-2.3/include/linux/posix_types.h:34:1: warning: this is the
location of the previous definition
/opt/puffin/hppa1.1-linux/include/stdio.h:470: warning: redefinition of
`off_t'
../../linux-2.3/include/linux/types.h:18: warning: `off_t' previously
declared here
hppa-linux-gcc -g -O -I../include -I../lib -I../../linux-2.3/include   -c -o
error.o error.c
hppa-linux-gcc -g -O -I../include -I../lib -I../../linux-2.3/include   -c -o
palo.o palo.c
echo "char *bld_info = \"`whoami`@`hostname` `date`\";" > build.c
hppa-linux-gcc -g -O -I../include -I../lib -I../../linux-2.3/include -c -o
build.o build.c
rm -f build.c
hppa-linux-gcc -g -O -I../include -I../lib -I../../linux-2.3/include  -o
palo diskpart.o    elf64.o	    load.o	  paloio.o      som.o
elf32.o	      error.o	    palo.o build.o
/opt/puffin/lib/gcc-lib/hppa1.1-linux/2.96/../../../../hppa1.1-linux/bin/ld:
cannot open crt1.o: No such file or directory
collect2: ld returned 1 exit status
make[2]: *** [palo] Error 1
make[2]: Leaving directory `/Tools/palo/palo'
make[1]: *** [makepalo] Error 2
make[1]: Leaving directory `/Tools/palo'
make: *** [palo] Error 2

What are my mistakes (RAMDISK, ramdisk-sti, ... see below the procedure
followed)?

Thanks for help.
	Joel


PS: Does exist some archive of linuxcare mailing list about LINUX-PARISC?


Modified 'recipe' procedure hopping to be helpful

>From the Software Porting And Archive Centre for HP-UX in the United Kingdom
http://hpux.connect.org.uk/

I install following packages:
autoconf
bash
binutils
bison
bzip2
flex
gcc
m4
make
tar
unzip

adding relevant path PATH env

...

    3.Configure and build Binutils: 

       gzcat binutils-latest.tar.gz | tar -xf -
       mkdir binutils-build
*** confirm to make that c files are up to date
       find binutils -name "*.[ch]" -exec touch {} \;
***
       cd binutils-build
       ../binutils/configure \
           --target=hppa1.1-linux \
           --prefix=$DEST \
           --host=hppa-hpux\
           --disable-nls
       gmake
       gmake install
       cd ..


    4.Unpack the header files 

       gzcat include.tar.gz | tar -C $DEST -xf -

*** I do not remember why but it is useful
       cd $DEST/hppa1.1-linux
       ln -s ../include include


    5.Configure and build GCC: 

       gzcat gcc-latest.tar.gz | tar -xf -
       PATH=$DEST/bin:$PATH
*** Why as you just download the last cvs ?
#       cd gcc
#       ./contrib/gcc_update
#       cd ..

*** If previous step is not possible
       gzcat linux-latest.tar.gz | tar -xf -
       cd linux-2.3/includes
       ln -s asm-parisc asm
       cp -rp asm/* $DEST/include/asm
       cp -rp linux $DEST/include
       
       mkdir gcc-build
       cd gcc-build
       ../gcc/configure \
           --target=hppa1.1-linux \
           --prefix=$DEST \

*** I do have to change host option because 'hppa-hpux' is not "supported"
           --host=hppa1.1-hpux \
           --disable-nls \
           --enable-languages=c \
           --without-libc
       gmake LANGUAGES=c LIBGCC2_INCLUDES=-I$DEST/include
       gmake install
       cd ..

*** I had also adding symbolic links by following way:
       cd $DEST/bin
       LIST=`ls -dC1 hppa1.1*`
       for file in $LIST; do ln -s $file hppa-linux-${file##*-}; done
       cd -


    6.Unpack and configure the kernel: 

*** Not necessary: see previous step
#       gzcat linux-latest.tar.gz | tar -xf -
       cd linux-2.3
       gmake oldconfig
       gmake dep
       cd ..

    7.Build the kernel 

       gzcat palo-latest.tar.gz | tar -xf -


*** That do have to do the small following change in the palo/palo/Makefile
       CC=hppa-linux-gcc
       CFLAGS=-g -O -I../include -I../lib -I../../linux-2.3/include

*** Change palo/Makefile to RAMDISK instead of NFSROOT

*** And only for palo change call to hp make to gmake
       mv /usr/bin/make /usr/bin/make.hpux
       ln -s /opt/make/bin/gmake /opt/make/bin/make

       mv ramdisk20000530-sercon.tgz linux-2.3/
       cd linux-2.3

*** I do have to use the graphical consol
#       gzcat -c ramdisk20000530-sercon.tgz | tar xf -
       gzcat -c ramdisk20000530-sticon.tgz | tar xf -
       gmake palo
       cd ..

*** Not yet 

       The resulting kernel image is palo/lifimage. 

       NFS ROOT e-mail thread has additional info.




**********************************************************************
This e-mail and any attachments to it may contain confidential information which is strictly intended for the use of the authorised recipient.  If you have received this e-mail in error, please delete it and notify the sender by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************
