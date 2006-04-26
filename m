From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] Re: Added clobbers to unaligned.c and uaccess.h
Date: Wed, 26 Apr 2006 08:33:48 +0200
Message-ID: <IYBGWC$539A4DB29982C0998C1F16B221A06BBF@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>,
 tsg45800 <tsg45800@scarlet.be>
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

> > > Ok for me to focus on float pb: I just started some month ago and i=
irc
> > > numerous pb are around nan (Not-a-Number) values. TBH, before readi=
ng that I
> > > was ignoring all about this (eventhought I was good in numerical
computing at
> > > school, well 20 years ago, but not yet enough ;-) ). So I need firs=
t to
> > > isolate faulty stuff then attempt to analyse the pb...
> > 
> > Perhaps ask Dave if he has some libstdc++ failures for you to look in=
to?
> > There are all sorts of interesting areas you can learn if you are int=
erested.
> 
> libstdc++ is pretty much ok (1 FAIL on head at the moment).

Well all test are not yet finished but the one you are interested in yes.=

Here are summaries:

Test Run By root on Wed Apr 26 01:16:36 2006
Native configuration is hppa-unknown-linux-gnu

                =3D=3D=3D gfortran tests =3D=3D=3D

Schedule of variations:
    unix

Running target unix
Using /usr/share/dejagnu/baseboards/unix.exp as board description file fo=
r target.
Using /usr/share/dejagnu/config/unix.exp as generic interface file for ta=
rget.
Using
/CAD/parisc-linux/Dpkg/dpkg-work/gcc-snapshot-20060425/src/gcc/testsuite/=
config/default.exp
as tool-and-target-specific interf
ace file.
Running
/CAD/parisc-linux/Dpkg/dpkg-work/gcc-snapshot-20060425/src/gcc/testsuite/=
gfortran.dg/dg.exp
...
FAIL: gfortran.dg/enum_2.f90  -O   (test for errors, line 9)
FAIL: gfortran.dg/enum_2.f90  -O  (test for excess errors)
Running
/CAD/parisc-linux/Dpkg/dpkg-work/gcc-snapshot-20060425/src/gcc/testsuite/=
gfortran.dg/gomp/gomp.exp
...
Running
/CAD/parisc-linux/Dpkg/dpkg-work/gcc-snapshot-20060425/src/gcc/testsuite/=
gfortran.dg/vect/vect.exp
...
Running
/CAD/parisc-linux/Dpkg/dpkg-work/gcc-snapshot-20060425/src/gcc/testsuite/=
gfortran.fortran-torture/compile/compile.exp
...
Running
/CAD/parisc-linux/Dpkg/dpkg-work/gcc-snapshot-20060425/src/gcc/testsuite/=
gfortran.fortran-torture/execute/execute.exp
...

                =3D=3D=3D gfortran Summary =3D=3D=3D

# of expected passes            12718
# of unexpected failures        2
# of expected failures          14
# of unsupported tests          96
/CAD/parisc-linux/Dpkg/dpkg-work/gcc-snapshot-20060425/build/gcc/testsuit=
e/gfortran/../../gfortran
 version 4.2.0 20060425 (experime
ntal)

Personal comment: seems far better then 20060419 buildd?

[snip]
Test Run By root on Wed Apr 26 02:56:44 2006
Native configuration is hppa-unknown-linux-gnu

                =3D=3D=3D libstdc++ tests =3D=3D=3D

Schedule of variations:
    unix

Running target unix
Using /usr/share/dejagnu/baseboards/unix.exp as board description file fo=
r target.
Using /usr/share/dejagnu/config/unix.exp as generic interface file for ta=
rget.
Using
/CAD/parisc-linux/Dpkg/dpkg-work/gcc-snapshot-20060425/src/libstdc++-v3/t=
estsuite/config/default.exp
as tool-and-target-specif
ic interface file.
Running
/CAD/parisc-linux/Dpkg/dpkg-work/gcc-snapshot-20060425/src/libstdc++-v3/t=
estsuite/libstdc++-abi/abi.exp
...
Running
/CAD/parisc-linux/Dpkg/dpkg-work/gcc-snapshot-20060425/src/libstdc++-v3/t=
estsuite/libstdc++-dg/conformance.exp
...
FAIL: 25_algorithms/prev_permutation/1.cc execution test
XPASS: 26_numerics/cmath/c99_classification_macros_c.cc (test for excess =
errors)

                =3D=3D=3D libstdc++ Summary =3D=3D=3D

# of expected passes            3540
# of unexpected failures        1
# of unexpected successes       1
# of expected failures          12
# of unsupported tests          315


Personal comment: same as 20060419 buildd ;-)


>  The easiest
> way to find problems that need work is to go to the bugzilla search pag=
e:
> http://gcc.gnu.org/bugzilla/query.cgi
> 
> Do a search with "hppa" in the target box.
> 
Ok I will check ;-)

Btw: I also check the kernel build (latest 2.6.17-rc2-pa4) with this gcc-=
4.1:
32bit up for D380 build without pb, boot and seems to works fine ;-)

Hth,
    Joel

PS: those build tests were done on a _chroot disk_ on which was installed=

previously mentinoned glibc6 (2.3.6-7 + clone patch) build itself with gc=
c-4.1
(dpkg 4.1.0-1)
(just mentioned this because I noticed some small diff in glibc test resu=
lts
when there were made on a chroot disk?)=0A=0A----------=0AWordt ook lid v=
an de Scarlet Club via een bestaande Scarlet klant en ontvang cadeauchequ=
es twv EUR 50! Bezoek snel http://www.scarletclub.be=0ADevenez aussi memb=
re du Club Scarlet via un client Scarlet existant et recevez des cheques =
cadeaux jusqu'a EUR 50! Surfez vite sur http://www.clubscarlet.be

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
