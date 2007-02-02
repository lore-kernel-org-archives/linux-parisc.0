From: Guy Martin <gmsoft@gentoo.org>
Subject: Re: [parisc-linux] glibc 2.5 and binutils CVS
Date: Fri, 2 Feb 2007 19:28:09 +0100
Message-ID: <20070202192809.865707d4.gmsoft__26122.7298331962$1416624273$gmane$org@gentoo.org>
References: <45C37D61.4040507@aurel32.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="Multipart=_Fri__2_Feb_2007_19_28_09_+0100_oiBz8E8FrpMnsfYL"
Cc: parisc-linux@lists.parisc-linux.org
To: Aurelien Jarno <aurelien@aurel32.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <45C37D61.4040507@aurel32.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

This is a multi-part message in MIME format.

--Multipart=_Fri__2_Feb_2007_19_28_09_+0100_oiBz8E8FrpMnsfYL
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable


Aurelien,

The trivial attached patch fix this issue.

Glibc hackers, please commit.

  Guy

On Fri, 02 Feb 2007 19:05:21 +0100
Aurelien Jarno <aurelien@aurel32.net> wrote:

> Hi all,
>=20
> I am trying to build glibc 2.5 with a CVS version of binutils
> (2.17.20070103) in order to enable thread local storage support.
>=20
> I get an error on an assembly file:
> ../ports/sysdeps/hppa/dl-trampoline.S: Assembler messages:
> ../ports/sysdeps/hppa/dl-trampoline.S:287: Error: open CFI at the end of
> file; missing .cfi_endproc directive
>=20
> Does anybody know how to fix that?
>=20
> Thanks,
> Aur=E9lien

--=20
Guy Martin
Gentoo Linux - HPPA port Lead

--Multipart=_Fri__2_Feb_2007_19_28_09_+0100_oiBz8E8FrpMnsfYL
Content-Type: text/x-patch;
 name="glibc-missing-cfi_procend.diff"
Content-Disposition: attachment;
 filename="glibc-missing-cfi_procend.diff"
Content-Transfer-Encoding: 7bit


Add missing cfi_procend.

Signed-off-by: Guy Martin <gmsoft@tuxicoman.be>

diff -uNr glibc-2.5.orig/ports/sysdeps/hppa/dl-trampoline.S glibc-2.5/ports/sysdeps/hppa/dl-trampoline.S
--- glibc-2.5.orig/ports/sysdeps/hppa/dl-trampoline.S	2006-09-07 16:34:43.000000000 +0000
+++ glibc-2.5/ports/sysdeps/hppa/dl-trampoline.S	2007-01-30 15:15:58.000000000 +0000
@@ -284,5 +284,6 @@
 	bv,n	0(%r2)
         .EXIT
         .PROCEND
+	cfi_endproc
 	.size   _dl_runtime_profile, . - _dl_runtime_profile
 

--Multipart=_Fri__2_Feb_2007_19_28_09_+0100_oiBz8E8FrpMnsfYL
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Multipart=_Fri__2_Feb_2007_19_28_09_+0100_oiBz8E8FrpMnsfYL--
