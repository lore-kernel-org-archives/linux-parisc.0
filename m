From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] [PATCH 13/23] [PARISC] Reduce data footprint in
	pdc_stable.c
Date: Sun, 25 Jun 2006 19:34:41 -0400
Message-ID: <11512784933098-git-send-email-kyle@parisc-linux.org>
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

No code change - reduce data footprint.

Signed-off-by: Thibaut VARENE <varenet@parisc-linux.org>
Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>

---

 drivers/parisc/pdc_stable.c |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

e2a55d47bfe9d186d8060194028a5f63114108a9
diff --git a/drivers/parisc/pdc_stable.c b/drivers/parisc/pdc_stable.c
index 4b991d5..a109421 100644
--- a/drivers/parisc/pdc_stable.c
+++ b/drivers/parisc/pdc_stable.c
@@ -628,16 +628,16 @@ pdcs_osid_read(struct subsystem *entry, 
 		return -EINVAL;
 
 	switch (pdcs_osid) {
-		case 0x0000:	tmpstr = "No OS-dependent data"; break;
-		case 0x0001:	tmpstr = "HP-UX dependent data"; break;
-		case 0x0002:	tmpstr = "MPE-iX dependent data"; break;
-		case 0x0003:	tmpstr = "OSF dependent data"; break;
-		case 0x0004:	tmpstr = "HP-RT dependent data"; break;
-		case 0x0005:	tmpstr = "Novell Netware dependent data"; break;
-		case 0x0006:	tmpstr = "Linux dependent data"; break;
+		case 0x0000:	tmpstr = "No OS"; break;
+		case 0x0001:	tmpstr = "HP-UX"; break;
+		case 0x0002:	tmpstr = "MPE-iX"; break;
+		case 0x0003:	tmpstr = "OSF"; break;
+		case 0x0004:	tmpstr = "HP-RT"; break;
+		case 0x0005:	tmpstr = "Novell Netware"; break;
+		case 0x0006:	tmpstr = "Linux"; break;
 		default:	tmpstr = "Unknown"; break;
 	}
-	out += sprintf(out, "%s (0x%.4x)\n", tmpstr, pdcs_osid);
+	out += sprintf(out, "%s dependent data (0x%.4x)\n", tmpstr, pdcs_osid);
 
 	return out - buf;
 }
-- 
1.3.3

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
