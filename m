From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] [PATCH 12/23] [PARISC] pdc_stable version 0.30
Date: Sun, 25 Jun 2006 19:34:40 -0400
Message-ID: <1151278492719-git-send-email-kyle@parisc-linux.org>
References: <20060625233123.GC2837@athena.road.mcmartin.ca>
Reply-To: Kyle McMartin <kyle@parisc-linux.org>
Cc: Thibaut Varene <varenet@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060625233123.GC2837@athena.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

From: Thibaut Varene <varenet@parisc-linux.org>

pdc_stable v0.30:

This patch introduces 3 more files to the /sys/firmware/stable tree:
- diagnostic, which contains a cryptic hex string
- osdep1, a 16 bytes os-dependent storage area always available
- osdep2, another os-dependent storage area which existence/size depends
on hversion.

This patch also adds code to setup the "Linux" signature in stable
storage. That is to say that starting with this patch, the kernel will
now sign its OSID (0x0006, thx LaMont) in Stable Storage upon boot,
whether pdc_stable is enabled or not.

Signed-off-by: Thibaut VARENE <varenet@parisc-linux.org>
Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>

---

 arch/parisc/kernel/setup.c  |    5 +
 drivers/parisc/pdc_stable.c |  219 ++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 210 insertions(+), 14 deletions(-)

a77039bc889939409af9726760e9b1b3fe77f6fb
diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index 4a36ec3..8471486 100644
--- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -303,6 +303,8 @@ extern void eisa_init(void);
 
 static int __init parisc_init(void)
 {
+	u32 osid = (0x0006 << 16);
+
 	parisc_proc_mkdir();
 	parisc_init_resources();
 	do_device_inventory();                  /* probe for hardware */
@@ -311,6 +313,9 @@ static int __init parisc_init(void)
 	
 	/* set up a new led state on systems shipped LED State panel */
 	pdc_chassis_send_status(PDC_CHASSIS_DIRECT_BSTART);
+
+	/* tell PDC we're Linux. Nevermind failure. */
+	pdc_stable_write(0x40, &osid, sizeof(osid));
 	
 	processor_init();
 	printk(KERN_INFO "CPU(s): %d x %s at %d.%06d MHz\n",
diff --git a/drivers/parisc/pdc_stable.c b/drivers/parisc/pdc_stable.c
index bbeabe3..4b991d5 100644
--- a/drivers/parisc/pdc_stable.c
+++ b/drivers/parisc/pdc_stable.c
@@ -28,8 +28,15 @@
  *    following code can deal with just 96 bytes of Stable Storage, and all
  *    sizes between 96 and 192 bytes (provided they are multiple of struct
  *    device_path size, eg: 128, 160 and 192) to provide full information.
- *    The code makes no use of data above 192 bytes. One last word: there's one
- *    path we can always count on: the primary path.
+ *    One last word: there's one path we can always count on: the primary path.
+ *    Anything above 224 bytes is used for 'osdep2' OS-dependent storage area.
+ *
+ *    The first OS-dependent area should always be available. Obviously, this is
+ *    not true for the other one. Also bear in mind that reading/writing from/to
+ *    osdep2 is much more expensive than from/to osdep1.
+ *    NOTE: We do not handle the 2 bytes OS-dep area at 0x5D, nor the first
+ *    2 bytes of storage available right after OSID. That's a total of 4 bytes
+ *    sacrificed: -ETOOLAZY :P
  *
  *    The current policy wrt file permissions is:
  *	- write: root only
@@ -64,15 +71,18 @@ #include <asm/page.h>
 #include <asm/uaccess.h>
 #include <asm/hardware.h>
 
-#define PDCS_VERSION	"0.22"
+#define PDCS_VERSION	"0.30"
 #define PDCS_PREFIX	"PDC Stable Storage"
 
 #define PDCS_ADDR_PPRI	0x00
 #define PDCS_ADDR_OSID	0x40
+#define PDCS_ADDR_OSD1	0x48
+#define PDCS_ADDR_DIAG	0x58
 #define PDCS_ADDR_FSIZ	0x5C
 #define PDCS_ADDR_PCON	0x60
 #define PDCS_ADDR_PALT	0x80
 #define PDCS_ADDR_PKBD	0xA0
+#define PDCS_ADDR_OSD2	0xE0
 
 MODULE_AUTHOR("Thibaut VARENE <varenet@parisc-linux.org>");
 MODULE_DESCRIPTION("sysfs interface to HP PDC Stable Storage data");
@@ -82,6 +92,9 @@ MODULE_VERSION(PDCS_VERSION);
 /* holds Stable Storage size. Initialized once and for all, no lock needed */
 static unsigned long pdcs_size __read_mostly;
 
+/* holds OS ID. Initialized once and for all, hopefully to 0x0006 */
+static u16 pdcs_osid __read_mostly;
+
 /* This struct defines what we need to deal with a parisc pdc path entry */
 struct pdcspath_entry {
 	rwlock_t rw_lock;		/* to protect path entry access */
@@ -609,27 +622,74 @@ static ssize_t
 pdcs_osid_read(struct subsystem *entry, char *buf)
 {
 	char *out = buf;
-	__u32 result;
 	char *tmpstr = NULL;
 
 	if (!entry || !buf)
 		return -EINVAL;
 
-	/* get OSID */
-	if (pdc_stable_read(PDCS_ADDR_OSID, &result, sizeof(result)) != PDC_OK)
-		return -EIO;
-
-	/* the actual result is 16 bits away */
-	switch (result >> 16) {
+	switch (pdcs_osid) {
 		case 0x0000:	tmpstr = "No OS-dependent data"; break;
 		case 0x0001:	tmpstr = "HP-UX dependent data"; break;
 		case 0x0002:	tmpstr = "MPE-iX dependent data"; break;
 		case 0x0003:	tmpstr = "OSF dependent data"; break;
 		case 0x0004:	tmpstr = "HP-RT dependent data"; break;
 		case 0x0005:	tmpstr = "Novell Netware dependent data"; break;
+		case 0x0006:	tmpstr = "Linux dependent data"; break;
 		default:	tmpstr = "Unknown"; break;
 	}
-	out += sprintf(out, "%s (0x%.4x)\n", tmpstr, (result >> 16));
+	out += sprintf(out, "%s (0x%.4x)\n", tmpstr, pdcs_osid);
+
+	return out - buf;
+}
+
+/**
+ * pdcs_osdep1_read - Stable Storage OS-Dependent data area 1 output.
+ * @entry: An allocated and populated subsytem struct. We don't use it tho.
+ * @buf: The output buffer to write to.
+ *
+ * This can hold 16 bytes of OS-Dependent data.
+ */
+static ssize_t
+pdcs_osdep1_read(struct subsystem *entry, char *buf)
+{
+	char *out = buf;
+	u32 result[4];
+
+	if (!entry || !buf)
+		return -EINVAL;
+
+	if (pdc_stable_read(PDCS_ADDR_OSD1, &result, sizeof(result)) != PDC_OK)
+		return -EIO;
+
+	out += sprintf(out, "0x%.8x\n", result[0]);
+	out += sprintf(out, "0x%.8x\n", result[1]);
+	out += sprintf(out, "0x%.8x\n", result[2]);
+	out += sprintf(out, "0x%.8x\n", result[3]);
+
+	return out - buf;
+}
+
+/**
+ * pdcs_diagnostic_read - Stable Storage Diagnostic register output.
+ * @entry: An allocated and populated subsytem struct. We don't use it tho.
+ * @buf: The output buffer to write to.
+ *
+ * I have NFC how to interpret the content of that register ;-).
+ */
+static ssize_t
+pdcs_diagnostic_read(struct subsystem *entry, char *buf)
+{
+	char *out = buf;
+	u32 result;
+
+	if (!entry || !buf)
+		return -EINVAL;
+
+	/* get diagnostic */
+	if (pdc_stable_read(PDCS_ADDR_DIAG, &result, sizeof(result)) != PDC_OK)
+		return -EIO;
+
+	out += sprintf(out, "0x%.4x\n", (result >> 16));
 
 	return out - buf;
 }
@@ -645,7 +705,7 @@ static ssize_t
 pdcs_fastsize_read(struct subsystem *entry, char *buf)
 {
 	char *out = buf;
-	__u32 result;
+	u32 result;
 
 	if (!entry || !buf)
 		return -EINVAL;
@@ -664,6 +724,39 @@ pdcs_fastsize_read(struct subsystem *ent
 }
 
 /**
+ * pdcs_osdep2_read - Stable Storage OS-Dependent data area 2 output.
+ * @entry: An allocated and populated subsytem struct. We don't use it tho.
+ * @buf: The output buffer to write to.
+ *
+ * This can hold pdcs_size - 224 bytes of OS-Dependent data, when available.
+ */
+static ssize_t
+pdcs_osdep2_read(struct subsystem *entry, char *buf)
+{
+	char *out = buf;
+	unsigned long size;
+	unsigned short i;
+	u32 result;
+
+	if (unlikely(pdcs_size <= 224))
+		return -ENODATA;
+
+	size = pdcs_size - 224;
+
+	if (!entry || !buf)
+		return -EINVAL;
+
+	for (i=0; i<size; i+=4) {
+		if (unlikely(pdc_stable_read(PDCS_ADDR_OSD2 + i, &result,
+					sizeof(result)) != PDC_OK))
+			return -EIO;
+		out += sprintf(out, "0x%.8x\n", result);
+	}
+
+	return out - buf;
+}
+
+/**
  * pdcs_auto_write - This function handles autoboot/search flag modifying.
  * @entry: An allocated and populated subsytem struct. We don't use it tho.
  * @buf: The input buffer to read from.
@@ -770,13 +863,100 @@ pdcs_autosearch_write(struct subsystem *
 	return pdcs_auto_write(entry, buf, count, PF_AUTOSEARCH);
 }
 
+/**
+ * pdcs_osdep1_write - Stable Storage OS-Dependent data area 1 input.
+ * @entry: An allocated and populated subsytem struct. We don't use it tho.
+ * @buf: The input buffer to read from.
+ * @count: The number of bytes to be read.
+ *
+ * This can store 16 bytes of OS-Dependent data. We use a byte-by-byte
+ * write approach. It's up to userspace to deal with it when constructing
+ * its input buffer.
+ */
+static ssize_t
+pdcs_osdep1_write(struct subsystem *entry, const char *buf, size_t count)
+{
+	u8 in[16];
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EACCES;
+
+	if (!entry || !buf || !count)
+		return -EINVAL;
+
+	if (unlikely(pdcs_osid != 0x0006))
+		return -EPERM;
+
+	if (count > 16)
+		return -EMSGSIZE;
+
+	/* We'll use a local copy of buf */
+	memset(in, 0, 16);
+	memcpy(in, buf, count);
+
+	if (pdc_stable_write(PDCS_ADDR_OSD1, &in, sizeof(in)) != PDC_OK)
+		return -EIO;
+
+	return count;
+}
+
+/**
+ * pdcs_osdep2_write - Stable Storage OS-Dependent data area 2 input.
+ * @entry: An allocated and populated subsytem struct. We don't use it tho.
+ * @buf: The input buffer to read from.
+ * @count: The number of bytes to be read.
+ *
+ * This can store pdcs_size - 224 bytes of OS-Dependent data. We use a
+ * byte-by-byte write approach. It's up to userspace to deal with it when
+ * constructing its input buffer.
+ */
+static ssize_t
+pdcs_osdep2_write(struct subsystem *entry, const char *buf, size_t count)
+{
+	unsigned long size;
+	unsigned short i;
+	u8 in[4];
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EACCES;
+
+	if (!entry || !buf || !count)
+		return -EINVAL;
+
+	if (unlikely(pdcs_size <= 224))
+		return -ENOSYS;
+
+	if (unlikely(pdcs_osid != 0x0006))
+		return -EPERM;
+
+	size = pdcs_size - 224;
+
+	if (count > size)
+		return -EMSGSIZE;
+
+	/* We'll use a local copy of buf */
+
+	for (i=0; i<count; i+=4) {
+		memset(in, 0, 4);
+		memcpy(in, buf+i, (count-i < 4) ? count-i : 4);
+		if (unlikely(pdc_stable_write(PDCS_ADDR_OSD2 + i, &in,
+					sizeof(in)) != PDC_OK))
+			return -EIO;
+	}
+
+	return count;
+}
+
 /* The remaining attributes. */
 static PDCS_ATTR(size, 0444, pdcs_size_read, NULL);
 static PDCS_ATTR(autoboot, 0644, pdcs_autoboot_read, pdcs_autoboot_write);
 static PDCS_ATTR(autosearch, 0644, pdcs_autosearch_read, pdcs_autosearch_write);
 static PDCS_ATTR(timer, 0444, pdcs_timer_read, NULL);
-static PDCS_ATTR(osid, 0400, pdcs_osid_read, NULL);
+static PDCS_ATTR(osid, 0444, pdcs_osid_read, NULL);
+static PDCS_ATTR(osdep1, 0600, pdcs_osdep1_read, pdcs_osdep1_write);
+static PDCS_ATTR(diagnostic, 0400, pdcs_diagnostic_read, NULL);
 static PDCS_ATTR(fastsize, 0400, pdcs_fastsize_read, NULL);
+static PDCS_ATTR(osdep2, 0600, pdcs_osdep2_read, pdcs_osdep2_write);
 
 static struct subsys_attribute *pdcs_subsys_attrs[] = {
 	&pdcs_attr_size,
@@ -784,7 +964,10 @@ static struct subsys_attribute *pdcs_sub
 	&pdcs_attr_autosearch,
 	&pdcs_attr_timer,
 	&pdcs_attr_osid,
+	&pdcs_attr_osdep1,
+	&pdcs_attr_diagnostic,
 	&pdcs_attr_fastsize,
+	&pdcs_attr_osdep2,
 	NULL,
 };
 
@@ -865,6 +1048,7 @@ pdc_stable_init(void)
 {
 	struct subsys_attribute *attr;
 	int i, rc = 0, error = 0;
+	u32 result;
 
 	/* find the size of the stable storage */
 	if (pdc_stable_get_size(&pdcs_size) != PDC_OK) 
@@ -876,6 +1060,13 @@ pdc_stable_init(void)
 
 	printk(KERN_INFO PDCS_PREFIX " facility v%s\n", PDCS_VERSION);
 
+	/* get OSID */
+	if (pdc_stable_read(PDCS_ADDR_OSID, &result, sizeof(result)) != PDC_OK)
+		return -EIO;
+
+	/* the actual result is 16 bits away */
+	pdcs_osid = (u16)(result >> 16);
+
 	/* For now we'll register the stable subsys within this driver */
 	if ((rc = firmware_register(&stable_subsys)))
 		goto fail_firmreg;
@@ -887,7 +1078,7 @@ pdc_stable_init(void)
 	
 	/* register the paths subsys as a subsystem of stable subsys */
 	kset_set_kset_s(&paths_subsys, stable_subsys);
-	if ((rc= subsystem_register(&paths_subsys)))
+	if ((rc = subsystem_register(&paths_subsys)))
 		goto fail_subsysreg;
 
 	/* now we create all "files" for the paths subsys */
-- 
1.3.3

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
