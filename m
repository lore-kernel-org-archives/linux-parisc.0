Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2CC90482E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Dec 2002 11:25:00 -0700 (MST)
Date: Mon, 16 Dec 2002 19:24:28 +0100
Message-ID: <3DED9BF500001EF5@ocpmta8.freegates.net>
In-Reply-To: <20021216181649.D9994@parcelfarce.linux.theplanet.co.uk>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] Re: YA pb with PCI IDE (my merge 2.4.21-pre1)
To: "Matthew Wilcox" <willy@debian.org>
Cc: "Matthew Wilcox" <willy@debian.org>,
	"Alan Cox" <alan@lxorguk.ukuu.org.uk>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

>On Mon, Dec 16, 2002 at 07:13:53PM +0100, jsoe0708@tiscali.be wrote:
>> >
>> >why are you sending word documents?  i'm not reading that shit.
>> >
>> Sorry for confusion, it just contents ascii text. Trust me there is no=

>relation
>> with world, just an extension (a professional habit to make internal
exchange
>> more confortable for the one not familiar with unix).
>
>something's very screwed up then, probably your mail server:
>
>[-- Attachment #2: add_function.diff.doc --]
>[-- Type: application/msword, Encoding: base64, Size: 7.8K --]
>
>[-- application/msword is unsupported (use 'v' to view this part) --]
>
>is what i see.
>
That should be the webmail interface (I do not like it but have no choise=

behind a fw not allowing pop.mail connection)

>> Tell me what is your prefered extension, I will take care to adopt it.=

>
>i prefer it inlined, not as an attachment.  it's easier to reply to.
>
That is ok for me:

diff -NaurwbBX /Develop/Kernel-Linux/dontdiff linux-2.4.21-pre1-pa14-alph=
a/include/asm-parisc/ide.h
linux-2.4.21-pre1-pa14-beta/include/asm-parisc/ide.h
--- linux-2.4.21-pre1-pa14-alpha/include/asm-parisc/ide.h	2002-12-13 14:0=
0:09.000000000
+0100
+++ linux-2.4.21-pre1-pa14-beta/include/asm-parisc/ide.h	2002-12-15 15:34=
:01.000000000
+0100
@@ -20,6 +20,8 @@
 #define MAX_HWIFS	2
 #endif
 
+#define ide__sti()      __sti()
+
 static __inline__ int ide_default_irq(ide_ioreg_t base)
 {
 	switch (base) {
@@ -78,13 +80,116 @@
 #endif /* CONFIG_BLK_DEV_IDEPCI */
 }
 
-/*
+typedef union {
+	unsigned all			: 8;	/* all of the bits together */
+	struct {
+		unsigned bit7		: 1;	/* always 1 */
+		unsigned lba		: 1;	/* using LBA instead of CHS */
+		unsigned bit5		: 1;	/* always 1 */
+		unsigned unit		: 1;	/* drive select number, 0 or 1 */
+		unsigned head		: 4;	/* always zeros here */
+	} b;
+} select_t;
+
+typedef union {
+	unsigned all			: 8;	/* all of the bits together */
+	struct {
+		unsigned bit0		: 1;
+		unsigned nIEN		: 1;	/* device INTRQ to host */
+		unsigned SRST		: 1;	/* host soft reset bit */
+		unsigned bit3		: 1;	/* ATA-2 thingy */
+		unsigned reserved456	: 3;
+		unsigned HOB		: 1;	/* 48-bit address ordering */
+	} b;
+} control_t;
+
 #define ide_request_irq(irq,hand,flg,dev,id)	request_irq((irq),(hand),(f=
lg),(dev),(id))
 #define ide_free_irq(irq,dev_id)		free_irq((irq), (dev_id))
 #define ide_check_region(from,extent)		check_region((from), (extent))
 #define ide_request_region(from,extent,name)	request_region((from), (ext=
ent),
(name))
 #define ide_release_region(from,extent)		release_region((from), (extent)=
)
+
+#define T_CHAR          (0x0000)        /* char:  don't touch  */
+#define T_SHORT         (0x4000)        /* short: 12 -> 21     */
+#define T_INT           (0x8000)        /* int:   1234 -> 4321 */
+#define T_TEXT          (0xc000)        /* text:  12 -> 21     */
+
+#define T_MASK_TYPE     (0xc000)
+#define T_MASK_COUNT    (0x3fff)
+
+#define D_CHAR(cnt)     (T_CHAR  | (cnt))
+#define D_SHORT(cnt)    (T_SHORT | (cnt))
+#define D_INT(cnt)      (T_INT   | (cnt))
+#define D_TEXT(cnt)     (T_TEXT  | (cnt))
+
+static u_short driveid_types[] =3D {
+	D_SHORT(10),	/* config - vendor2 */
+	D_TEXT(20),	/* serial_no */
+	D_SHORT(3),	/* buf_type - ecc_bytes */
+	D_TEXT(48),	/* fw_rev - model */
+	D_CHAR(2),	/* max_multsect - vendor3 */
+	D_SHORT(1),	/* dword_io */
+	D_CHAR(2),	/* vendor4 - capability */
+	D_SHORT(1),	/* reserved50 */
+	D_CHAR(4),	/* vendor5 - tDMA */
+	D_SHORT(4),	/* field_valid - cur_sectors */
+	D_INT(1),	/* cur_capacity */
+	D_CHAR(2),	/* multsect - multsect_valid */
+	D_INT(1),	/* lba_capacity */
+	D_SHORT(194)	/* dma_1word - reservedyy */
+};
+
+#define num_driveid_types       (sizeof(driveid_types)/sizeof(*driveid_t=
ypes))
+
+static __inline__ void ide_fix_driveid(struct hd_driveid *id)
+{
+	u_char *p =3D (u_char *)id;
+	int i, j, cnt;
+	u_char t;
+
+	for (i =3D 0; i < num_driveid_types; i++) {
+		cnt =3D driveid_types[i] & T_MASK_COUNT;
+		switch (driveid_types[i] & T_MASK_TYPE) {
+		case T_CHAR:
+			p +=3D cnt;
+			break;
+		case T_SHORT:
+			for (j =3D 0; j < cnt; j++) {
+				t =3D p[0];
+				p[0] =3D p[1];
+				p[1] =3D t;
+				p +=3D 2;
+			}
+			break;
+		case T_INT:
+			for (j =3D 0; j < cnt; j++) {
+				t =3D p[0];
+				p[0] =3D p[3];
+				p[3] =3D t;
+				t =3D p[1];
+				p[1] =3D p[2];
+				p[2] =3D t;
+				p +=3D 4;
+			}
+			break;
+		case T_TEXT:
+			for (j =3D 0; j < cnt; j +=3D 2) {
+				t =3D p[0];
+				p[0] =3D p[1];
+				p[1] =3D t;
+				p +=3D 2;
+			}
+			break;
+		};
+	}
+}
+
+/*
+ * The following are not needed for the non-m68k ports
  */
+#define ide_ack_intr(hwif)		(1)
+#define ide_release_lock(lock)		do {} while (0)
+#define ide_get_lock(lock, hdlr, data)	do {} while (0)
 
 #endif /* __KERNEL__ */
 
diff -NaurwbBX /Develop/Kernel-Linux/dontdiff linux-2.4.21-pre1-pa14-alph=
a/include/asm-parisc/system.h
linux-2.4.21-pre1-pa14-beta/include/asm-parisc/system.h
--- linux-2.4.21-pre1-pa14-alpha/include/asm-parisc/system.h	2002-12-13
13:58:36.000000000 +0100
+++ linux-2.4.21-pre1-pa14-beta/include/asm-parisc/system.h	2002-12-15 15=
:34:01.000000000
+0100
@@ -66,8 +66,6 @@
 #define sti() __global_sti()
 #define save_flags(x) ((x)=3D__global_save_flags())
 #define restore_flags(x) __global_restore_flags(x)
-#define save_and_cli(x) do { save_flags(x); cli(); } while(0);
-#define save_and_sti(x) do { save_flags(x); sti(); } while(0);
 
 #else
 
@@ -75,8 +73,6 @@
 #define sti() __sti()
 #define save_flags(x) __save_flags(x)
 #define restore_flags(x) __restore_flags(x)
-#define save_and_cli(x) __save_and_cli(x)
-#define save_and_sti(x) __save_and_sti(x)
 
 #endif
 
diff -NaurwbBX /Develop/Kernel-Linux/dontdiff linux-2.4.21-pre1-pa14-alph=
a/include/asm-parisc/system_irqsave.h
linux-2.4.21-pre1-pa14-beta/include/asm-parisc/system_irqsave.h
--- linux-2.4.21-pre1-pa14-alpha/include/asm-parisc/system_irqsave.h	2002=
-12-12
16:12:02.000000000 +0100
+++ linux-2.4.21-pre1-pa14-beta/include/asm-parisc/system_irqsave.h	2002-=
12-15
15:34:01.000000000 +0100
@@ -7,21 +7,10 @@
 #define __cli()	__asm__ __volatile__("rsm %0,%%r0\n" : : "i" (PSW_I) :
"memory" )
 #define __sti()	__asm__ __volatile__("ssm %0,%%r0\n" : : "i" (PSW_I) :
"memory" )
 
-#define __save_and_cli(x)  do { __save_flags(x); __cli(); } while(0);
-#define __save_and_sti(x)  do { __save_flags(x); __sti(); } while(0);
-
-/* For spinlocks etc */
-#if 0
 #define local_irq_save(x) \
 	__asm__ __volatile__("rsm %1,%0" : "=3Dr" (x) :"i" (PSW_I) : "memory" )=

-#define local_irq_set(x) \
-#       "Warning local_irq_set(x) is not yet defined"
-#else
-#define local_irq_save(x)  __save_and_cli(x)
-#define local_irq_set(x)   __save_and_sti(x)
-#endif
-
-#define local_irq_restore(x) __restore_flags(x)
+#define local_irq_restore(x) \
+	__asm__ __volatile__("mtsm %0" : : "r" (x) : "memory" )
 #define local_irq_disable() __cli()
 #define local_irq_enable()  __sti()
 

Hope this is still readable,
    Joel

*************************************************************************=
*******
Controlez mieux votre consommation Internet...surfez Tiscali Complete...h=
ttp://tiscali.complete.be
