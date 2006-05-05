From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] Re: hppa64-...-gcc-4.1 annoying pb?
Date: Fri,  5 May 2006 16:48:42 +0200
Message-ID: <IYSRT6$0AE931C114930275EFD64A51F4A59038@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "dave" <dave@hiauly1.hia.nrc.ca>
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

> > mmm, this seems to be a key;
> > this morming (to me), I rebuild 2.6.17-rc3-pa3 + your patch the 64bit=

kernel on:
> >     1/ the n4k + ulimit -v 524288 -> compile time nornal 
> > 
appologies my mistake: it wasn't the same config (i erronioulsy build a s=
mp
kernel):
## to build 64bit up kernel

# sh  ../TstPgAlloc
+ rm mm/page_alloc.o mm/.page_alloc.o.d
rm: cannot remove `mm/.page_alloc.o.d': No such file or directory
+ hppa64-linux-gnu-gcc-4.1 --save-temps -Wp,-MD,mm/.page_alloc.o.d -nostd=
inc
-isystem /usr/lib/gcc/hppa64-linux-gnu/4.1.1/include -D__KERNEL__ -Iinclu=
de
-Iinclude2 -I/usr/src/linux-2.6.17-rc3-pa3/include -include
include/linux/autoconf.h -I/usr/src/linux-2.6.17-rc3-pa3/mm -Imm -Wall -W=
undef
-Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -O2
-fomit-frame-pointer -pipe -mno-space-regs -mfast-indirect-calls
-mdisable-fpregs -ffunction-sections -march=3D2.0 -mschedule=3D8000
-Wdeclaration-after-statement -Wno-pointer-sign '-DKBUILD_STR(s)=3D#s'
'-DKBUILD_BASENAME=3DKBUILD_STR(page_alloc)'
'-DKBUILD_MODNAME=3DKBUILD_STR(page_alloc)' -c -o mm/page_alloc.o
/usr/src/linux-2.6.17-rc3-pa3/mm/page_alloc.c
hppa64-linux-gnu-gcc-4.1: warning: -pipe ignored because -save-temps spec=
ified

real    64m56.040s
user    63m33.975s
sys     0m0.811s

# ulimit -v 524288
root@patst006:/usr/src/linux-2.6-pa-n4kup-t# sh  ../TstPgAlloc
+ rm mm/page_alloc.o mm/.page_alloc.o.d
+ hppa64-linux-gnu-gcc-4.1 --save-temps -Wp,-MD,mm/.page_alloc.o.d -nostd=
inc
-isystem /usr/lib/gcc/hppa64-linux-gnu/4.1.1/include -D__KERNEL__ -Iinclu=
de
-Iinclude2 -I/usr/src/linux-2.6.17-rc3-pa3/include -include
include/linux/autoconf.h -I/usr/src/linux-2.6.17-rc3-pa3/mm -Imm -Wall -W=
undef
-Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -O2
-fomit-frame-pointer -pipe -mno-space-regs -mfast-indirect-calls
-mdisable-fpregs -ffunction-sections -march=3D2.0 -mschedule=3D8000
-Wdeclaration-after-statement -Wno-pointer-sign '-DKBUILD_STR(s)=3D#s'
'-DKBUILD_BASENAME=3DKBUILD_STR(page_alloc)'
'-DKBUILD_MODNAME=3DKBUILD_STR(page_alloc)' -c -o mm/page_alloc.o
/usr/src/linux-2.6.17-rc3-pa3/mm/page_alloc.c
hppa64-linux-gnu-gcc-4.1: warning: -pipe ignored because -save-temps spec=
ified

real    64m52.295s
user    63m31.826s
sys     0m0.669s

## to build 64bit smp kernel

# ulimit -v unlimited
# sh  ../TstPgAlloc
+ rm mm/page_alloc.o mm/.page_alloc.o.d
+ hppa64-linux-gnu-gcc-4.1 --save-temps -Wp,-MD,mm/.page_alloc.o.d -nostd=
inc
-isystem /usr/lib/gcc/hppa64-linux-gnu/4.1.1/include -D__KERNEL__ -Iinclu=
de
-Iinclude2 -I/usr/src/linux-2.6.17-rc3-pa3/include -include
include/linux/autoconf.h -I/usr/src/linux-2.6.17-rc3-pa3/mm -Imm -Wall -W=
undef
-Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -O2
-fomit-frame-pointer -pipe -mno-space-regs -mfast-indirect-calls
-mdisable-fpregs -ffunction-sections -march=3D2.0 -mschedule=3D8000
-Wdeclaration-after-statement -Wno-pointer-sign '-DKBUILD_STR(s)=3D#s'
'-DKBUILD_BASENAME=3DKBUILD_STR(page_alloc)'
'-DKBUILD_MODNAME=3DKBUILD_STR(page_alloc)' -c -o mm/page_alloc.o
/usr/src/linux-2.6.17-rc3-pa3/mm/page_alloc.c
hppa64-linux-gnu-gcc-4.1: warning: -pipe ignored because -save-temps spec=
ified

real    0m9.340s
user    0m8.944s
sys     0m0.308s

# ulimit -v 524288
root@patst006:/usr/src/linux-2.6-pa-n4kmp-t# sh  ../TstPgAlloc
+ rm mm/page_alloc.o mm/.page_alloc.o.d
+ hppa64-linux-gnu-gcc-4.1 --save-temps -Wp,-MD,mm/.page_alloc.o.d -nostd=
inc
-isystem /usr/lib/gcc/hppa64-linux-gnu/4.1.1/include -D__KERNEL__ -Iinclu=
de
-Iinclude2 -I/usr/src/linux-2.6.17-rc3-pa3/include -include
include/linux/autoconf.h -I/usr/src/linux-2.6.17-rc3-pa3/mm -Imm -Wall -W=
undef
-Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -O2
-fomit-frame-pointer -pipe -mno-space-regs -mfast-indirect-calls
-mdisable-fpregs -ffunction-sections -march=3D2.0 -mschedule=3D8000
-Wdeclaration-after-statement -Wno-pointer-sign '-DKBUILD_STR(s)=3D#s'
'-DKBUILD_BASENAME=3DKBUILD_STR(page_alloc)'
'-DKBUILD_MODNAME=3DKBUILD_STR(page_alloc)' -c -o mm/page_alloc.o
/usr/src/linux-2.6.17-rc3-pa3/mm/page_alloc.c
hppa64-linux-gnu-gcc-4.1: warning: -pipe ignored because -save-temps spec=
ified

real    0m9.261s
user    0m8.942s
sys     0m0.315s


 
> >     2/ the b2k (default ulimit -v being ulimited) ->  page_alloc.c
compilation 
> >        very long (even thought this only have 256Mb?)
> > 
> > > This is on a machine with 1 GB.  I had found that the VM system
> > > could thrash and the system crash when it tried to allocate about
> > > 1 GB.
> 
> I think this is a UP problem.  When too much VM gets allocated
> to one process, it blocks some userspace kernel support.  The
> following assembler file was where I first noticed the problem:
> 
> 	.data
> foo:
> 	.block -1
> 
Ak ok, will check.

Sorry for confusion,
    Joel=0A=0A----------=0AClub Scarlet : Tout le monde gagne! Si vous de=
venez aujourd'hui Scarlet One grace a un client existant de Scarlet, vous=
 recevez tous les deux un cadeau d'une valeur de 50 euros! Surfez vite su=
r http://www.clubscarlet.be

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
