From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] Re: some starting . of glibc test math filaures ;-)
Date: Wed, 10 May 2006 09:44:59 +0200
Message-ID: <IZ1HIZ$4144AA8344DB0FD4D72CB04BB67F306E@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: dave <dave@hiauly1.hia.nrc.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "carlos" <carlos@systemhalted.org>
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

> On 5/9/06, Joel Soete <soete.joel@tiscali.be> wrote:
> > > > If somebody still remember why, that could help me a bit.
> > >
> > > Probably the maxulps data on hppa is out of date. We've fixed one o=
r two
> > > cases from time to time, but there are probably other problems.
> > >
> > > Pls send a patch to fix this case.
> > >
> > Obvioulsy ;-)
> >
> 
> Where is your ChangeLog?!  ;-)
> 
> I'm the hppa libc-ports maintainer. If you send me a well formed
> ChangeLog and patch I can do the checkin.
> 
Appologies, I am not in use to manage project ;</ but I fully agree that
changelogs and comments are even (if not more) important then code.

I just hope that the following will be convinen to you (I let you as
maintainer ;-)):
--- glibc-ports/ChangeLog.hppa.Orig     2006-05-10 09:25:43.000000000 +02=
00
+++ glibc-ports/ChangeLog.hppa  2006-05-10 09:32:14.000000000 +0200
@@ -1,3 +1,7 @@
+2006-05-10  Carlos O'Donell  <carlos@systemhalted.org>
+
+       * sysdeps/hppa/fpu/libm-test-ulps: remove outdated lround maxulps=
.
+
 2006-04-27  Carlos O'Donell  <carlos@systemhalted.org>
 
        * sysdeps/unix/sysv/linux/hppa/bits/fcntl.h: Include uio.h, and
--- glibc-ports/sysdeps/hppa/fpu/libm-test-ulps.Orig    2006-05-10 
9:25:15.000000000 +0200
+++ glibc-ports/sysdeps/hppa/fpu/libm-test-ulps 2006-05-10 09:26:56.00000=
0000
+0200
@@ -479,11 +479,6 @@
 float: 1
 ifloat: 1
 
-# lround
-Test "lround (1071930.0008) =3D=3D 1071930":
-double: -214511494
-idouble: -214511494
