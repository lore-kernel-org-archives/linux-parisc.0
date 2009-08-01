From: Frans Pop <elendil@planet.nl>
Subject: Re: Bug#539378: [hppa]: fails to load nfs module: Global =?utf-8?q?Offset=09Table?=
Date: Sat, 1 Aug 2009 10:08:58 +0200
Message-ID: <200908011009.00725.elendil@planet.nl>
References: <119aab440907311413s2e5ef1ebl690fff1bc4f0daea@mail.gmail.com> <20090731233828.GF26333@bombadil.infradead.org> <4A73821A.4020506@gmx.de>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_cg/cK5bZA3H+kDJ"
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	Carlos O'Donell <carlos@systemhalted.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	539378@bugs.debian.org, debian-hppa@lists.debian.org,
	linux-parisc@vger.kernel.org, randolph@tausq.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A73821A.4020506@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Boundary-00=_cg/cK5bZA3H+kDJ
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

tags 539378 patch
thanks

On Saturday 01 August 2009, Helge Deller wrote:
> Kyle, you beat me.
> Attached is my patch ....
>
> Tested and works.

Works for me too. Cool.

Your patch contained a few whitespace errors and, because of that, one 
unnecessary change. Attached a version with those cleaned up.

Thanks,
FJP


--Boundary-00=_cg/cK5bZA3H+kDJ
Content-Type: text/x-diff;
  charset="utf-8";
  name="got.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="got.patch"

parisc: module.c - fix GOT table overflow with large kernel modules on 64 bit kernels

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
index ef5caf2..d291bf9 100644
--- a/arch/parisc/kernel/module.c
+++ b/arch/parisc/kernel/module.c
@@ -86,8 +86,12 @@
  * the bottom of the table, which has a maximum signed displacement of
  * 0x3fff; however, since we're only going forward, this becomes
  * 0x1fff, and thus, since each GOT entry is 8 bytes long we can have
- * at most 1023 entries */
-#define MAX_GOTS	1023
+ * at most 1023 entries.
+ * To overcome this 14bit displacement with some kernel modules, we'll
+ * use instead the unusal 16bit displacement method (see reassemble_16a)
+ * which gives us a maximum positive displacement of 0x7fff, and as such
+ * allows us to allocate up to 4095 GOT entries. */
+#define MAX_GOTS	4095
 
 /* three functions to determine where in the module core
  * or init pieces the location is */
@@ -151,6 +155,16 @@ static inline int reassemble_14(int as14)
 		((as14 & 0x2000) >> 13));
 }
 
+static inline int reassemble_16a(int as16)
+{
+	int s, t;
+
+	/* Unusual 16-bit encoding, for wide mode only. */
+	t = (as16 << 1) & 0xffff;
+	s = (as16 & 0x8000);
+	return (t ^ s ^ (s >> 1)) | (s >> 15);
+}
+
 static inline int reassemble_17(int as17)
 {
 	return (((as17 & 0x10000) >> 16) |
@@ -407,6 +421,7 @@ static Elf_Addr get_stub(struct module *me, unsigned long value, long addend,
 	enum elf_stub_type stub_type, Elf_Addr loc0, unsigned int targetsec)
 {
 	struct stub_entry *stub;
+	int d;
 
 	/* initialize stub_offset to point in front of the section */
 	if (!me->arch.section[targetsec].stub_offset) {
@@ -465,7 +480,12 @@ static Elf_Addr get_stub(struct module *me, unsigned long value, long addend,
 		stub->insns[2] = 0xe820d000;	/* bve (%r1)		*/
 		stub->insns[3] = 0x537b0030;	/* ldd 18(%dp),%dp	*/
 
-		stub->insns[0] |= reassemble_14(get_got(me, value, addend) & 0x3fff);
+		d = get_got(me, value, addend);
+		if (d <= 15)
+			stub->insns[0] |= reassemble_14(d);
+		else
+			stub->insns[0] |= reassemble_16a(d);
+
 		break;
 	case ELF_STUB_MILLI:
 		stub->insns[0] = 0x20200000;	/* ldil 0,%r1		*/

--Boundary-00=_cg/cK5bZA3H+kDJ--
