From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: [parisc-linux] [PATCH] Add TLS relocs for hppa.
Date: Sun, 14 May 2006 21:16:40 -0400
Message-ID: <119aab440605141816l78545927g3f98b082d9b7a4ec__25595.898126676$1416624091$gmane$org@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="----=_Part_4666_30231266.1147655800996"
To: libc-alpha@sources.redhat.com,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
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

------=_Part_4666_30231266.1147655800996
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

The following patch adds the TLS relocations required for hppa.

The specification draft for TLS support under hppa-linux is located here:
http://parisc-linux.org/documentation/tls/hppa-tls-implementation.pdf

Original TeX file:
http://cvs.parisc-linux.org/*checkout*/web/src/documentation/tls/hppa-tls-i=
mplementation.tex?content-type=3Dtext%2Fplain

Binutils patches are sent and awaiting approval.
GCC patches for TLS support are already in place.
GLIBC support is in place in libc-ports.

Please commit.

Cheers,
Carlos.

------=_Part_4666_30231266.1147655800996
Content-Type: application/octet-stream; name=Changelog.libc
Content-Transfer-Encoding: 7bit
X-Attachment-Id: f_en84ftam
Content-Disposition: attachment; filename="Changelog.libc"

2006-05-15  Carlos O'Donell  <carlos@systemhalted.org>

	* elf/elf.h (R_PARISC_PLABEL21L, R_PARISC_PLABEL14R,
	R_PARISC_GNU_VTENTRY, R_PARISC_GNU_VTINHERIT, R_PARISC_TLS_GD21L,
	R_PARISC_TLS_GD14R, R_PARISC_TLS_GDCALL, R_PARISC_TLS_LDM21L,
	R_PARISC_TLS_LDM14R, R_PARISC_TLS_LDMCALL, R_PARISC_TLS_LDO21L,
	R_PARISC_TLS_LDO14R, R_PARISC_TLS_DTPMOD32, R_PARISC_TLS_DTPMOD64,
	R_PARISC_TLS_DTPOFF32, R_PARISC_TLS_DTPOFF64, R_PARISC_TLS_LE21L,
	R_PARISC_TLS_LE14R, R_PARISC_TLS_IE21L, R_PARISC_TLS_IE14R,
	R_PARISC_TLS_TPREL32, R_PARISC_TLS_TPREL64): Define.



------=_Part_4666_30231266.1147655800996
Content-Type: application/octet-stream; name=patch-glibc-elf-2006-05-15.diff
Content-Transfer-Encoding: 7bit
X-Attachment-Id: f_en84fxf1
Content-Disposition: attachment; filename="patch-glibc-elf-2006-05-15.diff"

Index: elf/elf.h
===================================================================
RCS file: /cvs/glibc/libc/elf/elf.h,v
retrieving revision 1.154
diff -u -p -r1.154 elf.h
--- elf/elf.h	25 Feb 2006 01:57:44 -0000	1.154
+++ elf/elf.h	15 May 2006 00:55:57 -0000
@@ -1704,6 +1704,8 @@ typedef Elf32_Addr Elf32_Conflict;
 #define R_PARISC_LTOFF_FPTR14R	62	/* LT-rel. fct ptr, right 14 bits. */
 #define R_PARISC_FPTR64		64	/* 64 bits function address.  */
 #define R_PARISC_PLABEL32	65	/* 32 bits function address.  */
+#define R_PARISC_PLABEL21L	66	/* Left 21 bits of fdesc address */
+#define R_PARISC_PLABEL14R	70	/* Right 14 bits of fdesc address */
 #define R_PARISC_PCREL64	72	/* 64 bits PC-rel. address.  */
 #define R_PARISC_PCREL22F	74	/* 22 bits PC-rel. address.  */
 #define R_PARISC_PCREL14WR	75	/* PC-rel. address, right 14 bits.  */
@@ -1764,6 +1766,29 @@ typedef Elf32_Addr Elf32_Conflict;
 #define R_PARISC_LTOFF_TP16F	229	/* 16 bits LT-TP-rel. address.  */
 #define R_PARISC_LTOFF_TP16WF	230	/* 16 bits LT-TP-rel. address.  */
 #define R_PARISC_LTOFF_TP16DF	231	/* 16 bits LT-TP-rel. address.  */
+
+#define R_PARISC_GNU_VTENTRY    232
+#define R_PARISC_GNU_VTINHERIT  233
+#define R_PARISC_TLS_GD21L      234	/* GD 21-bit left */
+#define R_PARISC_TLS_GD14R      235	/* GD 14-bit right */
+#define R_PARISC_TLS_GDCALL     236	/* GD call to __t_g_a */
+#define R_PARISC_TLS_LDM21L     237	/* LD module 21-bit left */
+#define R_PARISC_TLS_LDM14R     238	/* LD module 14-bit right */
+#define R_PARISC_TLS_LDMCALL    239	/* LD module call to __t_g_a */
+#define R_PARISC_TLS_LDO21L     240	/* LD offset 21-bit left */
+#define R_PARISC_TLS_LDO14R     241	/* LD offset 14-bit right */
+#define R_PARISC_TLS_DTPMOD32   242	/* DTP module 32-bit */
+#define R_PARISC_TLS_DTPMOD64   243	/* DTP module 64-bit */
+#define R_PARISC_TLS_DTPOFF32   244	/* DTP offset 32-bit */
+#define R_PARISC_TLS_DTPOFF64   245	/* DTP offset 32-bit */
+
+#define R_PARISC_TLS_LE21L      R_PARISC_TPREL21L
+#define R_PARISC_TLS_LE14R      R_PARISC_TPREL14R
+#define R_PARISC_TLS_IE21L      R_PARISC_LTOFF_TP21L
+#define R_PARISC_TLS_IE14R      R_PARISC_LTOFF_TP14R
+#define R_PARISC_TLS_TPREL32    R_PARISC_TPREL32
+#define R_PARISC_TLS_TPREL64    R_PARISC_TPREL64
+
 #define R_PARISC_HIRESERVE	255
 
 /* Legal values for p_type field of Elf32_Phdr/Elf64_Phdr.  */


------=_Part_4666_30231266.1147655800996
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
------=_Part_4666_30231266.1147655800996--
