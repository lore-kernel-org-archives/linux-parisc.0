From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Bug#539378: [hppa]: fails to load nfs module: Global Offset Table
Date: Sat, 1 Aug 2009 15:07:13 -0400 (EDT)
Message-ID: <20090801190715.0929A500B@hiauly1.hia.nrc.ca>
References: <20090801003740.8BBDE5160@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, kyle@mcmartin.ca, carlos@systemhalted.org,
	elendil@planet.nl, 539378@bugs.debian.org,
	debian-hppa@lists.debian.org, linux-parisc@vger.kernel.org,
	randolph@tausq.org, submit@bugs.debian.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090801003740.8BBDE5160@hiauly1.hia.nrc.ca> from "John David Anglin" at Jul 31, 2009 08:37:39 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> >  	case ELF_STUB_GOT:
> > -		stub->insns[0] = 0x537b0000;	/* ldd 0(%dp),%dp	*/
> > +		stub->insns[0] = 0x537b0000;    /* ldd 0(%dp),%dp	*/
> >  		stub->insns[1] = 0x53610020;	/* ldd 10(%dp),%r1	*/
> >  		stub->insns[2] = 0xe820d000;	/* bve (%r1)		*/
> >  		stub->insns[3] = 0x537b0030;	/* ldd 18(%dp),%dp	*/
> >  
> > -		stub->insns[0] |= reassemble_14(get_got(me, value, addend) & 0x3fff);
> > +		d = get_got(me, value, addend);
> > +		if (d <= 15)
> > +			stub->insns[0] |= reassemble_14(d);
> 
> reassemble_14 is wrong for ldd format 3.  Need format 5 and im5 insertion.

Since I complained about not using format 5 for small displacements,
here's an updated patch for review.  Seems to work:

dave@mx3210:/usr/src/D$ lsmod
Module                  Size  Used by
dm_snapshot            45680  0 
dm_mirror              27480  0 
dm_region_hash         17408  1 dm_mirror
dm_log                 18968  2 dm_mirror,dm_region_hash
dm_mod                111200  3 dm_snapshot,dm_mirror,dm_log
ext2                   99648  2 
sd_mod                 63792  4 
crc_t10dif              2368  1 sd_mod
tg3                   196428  0 
sym53c8xx             127568  3 
libphy                 39280  1 tg3
scsi_transport_spi     43528  1 sym53c8xx
scsi_mod              261104  3 sd_mod,sym53c8xx,scsi_transport_spi

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

Signed-off-by: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>

diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
index ecd1c50..88989cb 100644
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
@@ -145,12 +149,40 @@ struct stub_entry {
 /* The reassemble_* functions prepare an immediate value for
    insertion into an opcode. pa-risc uses all sorts of weird bitfields
    in the instruction to hold the value.  */
+static inline int sign_unext (int x, int len)
+{
+	int len_ones;
+
+	len_ones = (1 << len) - 1;
+	return x & len_ones;
+}
+
+static inline int low_sign_unext(int x, int len)
+{
+	int sign, temp;
+
+	sign = (x >> (len-1)) & 1;
+	temp = sign_unext (x, len-1);
+	return (temp << 1) | sign;
+}
+
 static inline int reassemble_14(int as14)
 {
 	return (((as14 & 0x1fff) << 1) |
 		((as14 & 0x2000) >> 13));
 }
 
+static inline int reassemble_16a(int as16)
+{
+	int s, t;
+
+	/* Unusual 16-bit encoding, for wide mode only.  */
+	t = (as16 << 1) & 0xffff;
+	s = (as16 & 0x8000);
+	return (t ^ s ^ (s >> 1)) | (s >> 15);
+}
+
+
 static inline int reassemble_17(int as17)
 {
 	return (((as17 & 0x10000) >> 16) |
@@ -409,6 +441,7 @@ static Elf_Addr get_stub(struct module *me, unsigned long value, long addend,
 	enum elf_stub_type stub_type, Elf_Addr loc0, unsigned int targetsec)
 {
 	struct stub_entry *stub;
+	int d;
 
 	/* initialize stub_offset to point in front of the section */
 	if (!me->arch.section[targetsec].stub_offset) {
@@ -462,12 +495,19 @@ static Elf_Addr get_stub(struct module *me, unsigned long value, long addend,
  */
 	switch (stub_type) {
 	case ELF_STUB_GOT:
-		stub->insns[0] = 0x537b0000;	/* ldd 0(%dp),%dp	*/
+		d = get_got(me, value, addend);
+		if (d <= 15) {
+			/* Format 5 */
+			stub->insns[0] = 0x0f6010db; /* ldd 0(%dp),%dp	*/
+			stub->insns[0] |= low_sign_unext(d, 5) << 16;
+		} else {
+			/* Format 3 */
+			stub->insns[0] = 0x537b0000; /* ldd 0(%dp),%dp	*/
+			stub->insns[0] |= reassemble_16a(d);
+		}
 		stub->insns[1] = 0x53610020;	/* ldd 10(%dp),%r1	*/
 		stub->insns[2] = 0xe820d000;	/* bve (%r1)		*/
 		stub->insns[3] = 0x537b0030;	/* ldd 18(%dp),%dp	*/
