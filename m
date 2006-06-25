From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] [PATCH 19/23] [PARISC] OS_ID_LINUX == 0x0006
Date: Sun, 25 Jun 2006 19:34:47 -0400
Message-ID: <11512784934070-git-send-email-kyle@parisc-linux.org>
References: <20060625233123.GC2837@athena.road.mcmartin.ca>
Reply-To: Kyle McMartin <kyle@parisc-linux.org>
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

We were assigned an OS_ID of 0x0006. Consistently use OS_ID_LINUX
instead of using the magic number. Also update the OS_ID_ defines in
asm/pdc.h to reflect this.

Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>

---

 arch/parisc/kernel/firmware.c |    4 +++-
 arch/parisc/kernel/setup.c    |    2 +-
 drivers/parisc/pdc_stable.c   |    4 ++--
 include/asm-parisc/pdc.h      |    3 +--
 4 files changed, 7 insertions(+), 6 deletions(-)

889a598b271a7ef14c2c7c83b26a82ccf57d9ab9
diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index c80c277..4398d2a 100644
--- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -407,7 +407,9 @@ int pdc_model_info(struct pdc_model *mod
  * pdc_model_sysmodel - Get the system model name.
  * @name: A char array of at least 81 characters.
  *
- * Get system model name from PDC ROM (e.g. 9000/715 or 9000/778/B160L)
+ * Get system model name from PDC ROM (e.g. 9000/715 or 9000/778/B160L).
+ * Using OS_ID_HPUX will return the equivalent of the 'modelname' command
+ * on HP/UX.
  */
 int pdc_model_sysmodel(char *name)
 {
diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index 8471486..278f4b9 100644
--- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -303,7 +303,7 @@ extern void eisa_init(void);
 
 static int __init parisc_init(void)
 {
-	u32 osid = (0x0006 << 16);
+	u32 osid = (OS_ID_LINUX << 16);
 
 	parisc_proc_mkdir();
 	parisc_init_resources();
diff --git a/drivers/parisc/pdc_stable.c b/drivers/parisc/pdc_stable.c
index a109421..97b3458 100644
--- a/drivers/parisc/pdc_stable.c
+++ b/drivers/parisc/pdc_stable.c
@@ -884,7 +884,7 @@ pdcs_osdep1_write(struct subsystem *entr
 	if (!entry || !buf || !count)
 		return -EINVAL;
 
-	if (unlikely(pdcs_osid != 0x0006))
+	if (unlikely(pdcs_osid != OS_ID_LINUX))
 		return -EPERM;
 
 	if (count > 16)
@@ -926,7 +926,7 @@ pdcs_osdep2_write(struct subsystem *entr
 	if (unlikely(pdcs_size <= 224))
 		return -ENOSYS;
 
-	if (unlikely(pdcs_osid != 0x0006))
+	if (unlikely(pdcs_osid != OS_ID_LINUX))
 		return -EPERM;
 
 	size = pdcs_size - 224;
diff --git a/include/asm-parisc/pdc.h b/include/asm-parisc/pdc.h
index 3d3446e..33bff61 100644
--- a/include/asm-parisc/pdc.h
+++ b/include/asm-parisc/pdc.h
@@ -278,12 +278,11 @@ #define PDC_LINK_USB_ENTRY_POINTS	1  /* 
 /* constants for OS (NVM...) */
 #define OS_ID_NONE		0	/* Undefined OS ID	*/
 #define OS_ID_HPUX		1	/* HP-UX OS		*/
-#define OS_ID_LINUX		OS_ID_HPUX /* just use the same value as hpux */
 #define OS_ID_MPEXL		2	/* MPE XL OS		*/
 #define OS_ID_OSF		3	/* OSF OS		*/
 #define OS_ID_HPRT		4	/* HP-RT OS		*/
 #define OS_ID_NOVEL		5	/* NOVELL OS		*/
-#define OS_ID_NT		6	/* NT OS		*/
+#define OS_ID_LINUX		6	/* Linux		*/
 
 
 /* constants for PDC_CHASSIS */
-- 
1.3.3

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
