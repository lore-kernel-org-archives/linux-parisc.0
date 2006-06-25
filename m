From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] [PATCH 20/23] [PARISC] Add os_id_to_string helper
Date: Sun, 25 Jun 2006 19:34:48 -0400
Message-ID: <11512784934079-git-send-email-kyle@parisc-linux.org>
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

Add a helper to asm/pdc.h to translate OS_ID values to strings
and use it in the pdc_stable driver.

Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>

---

 drivers/parisc/pdc_stable.c |   14 ++------------
 include/asm-parisc/pdc.h    |   13 +++++++++++++
 2 files changed, 15 insertions(+), 12 deletions(-)

484e05640cb33480c6cbd8c9f8e519a635424d1a
diff --git a/drivers/parisc/pdc_stable.c b/drivers/parisc/pdc_stable.c
index 97b3458..ea1b7a6 100644
--- a/drivers/parisc/pdc_stable.c
+++ b/drivers/parisc/pdc_stable.c
@@ -622,22 +622,12 @@ static ssize_t
 pdcs_osid_read(struct subsystem *entry, char *buf)
 {
 	char *out = buf;
-	char *tmpstr = NULL;
 
 	if (!entry || !buf)
 		return -EINVAL;
 
-	switch (pdcs_osid) {
-		case 0x0000:	tmpstr = "No OS"; break;
-		case 0x0001:	tmpstr = "HP-UX"; break;
-		case 0x0002:	tmpstr = "MPE-iX"; break;
-		case 0x0003:	tmpstr = "OSF"; break;
-		case 0x0004:	tmpstr = "HP-RT"; break;
-		case 0x0005:	tmpstr = "Novell Netware"; break;
-		case 0x0006:	tmpstr = "Linux"; break;
-		default:	tmpstr = "Unknown"; break;
-	}
-	out += sprintf(out, "%s dependent data (0x%.4x)\n", tmpstr, pdcs_osid);
+	out += sprintf(out, "%s dependent data (0x%.4x)\n",
+		os_id_to_string(pdcs_osid), pdcs_osid);
 
 	return out - buf;
 }
diff --git a/include/asm-parisc/pdc.h b/include/asm-parisc/pdc.h
index 33bff61..7a21f10 100644
--- a/include/asm-parisc/pdc.h
+++ b/include/asm-parisc/pdc.h
@@ -284,6 +284,19 @@ #define OS_ID_HPRT		4	/* HP-RT OS		*/
 #define OS_ID_NOVEL		5	/* NOVELL OS		*/
 #define OS_ID_LINUX		6	/* Linux		*/
 
+static inline char * os_id_to_string(u16 os_id) {
+	switch(os_id) {
+	case OS_ID_NONE:	return "No OS";
+	case OS_ID_HPUX:	return "HP-UX";
+	case OS_ID_MPEXL:	return "MPE-iX";
+	case OS_ID_OSF:		return "OSF";
+	case OS_ID_HPRT:	return "HP-RT";
+	case OS_ID_NOVEL:	return "Novell Netware";
+	case OS_ID_LINUX:	return "Linux";
+	default:	return "Unknown";
+	}
+}
+
 
 /* constants for PDC_CHASSIS */
 #define OSTAT_OFF		0
-- 
1.3.3

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
