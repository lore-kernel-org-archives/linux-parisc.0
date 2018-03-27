From: Helge Deller <deller@gmx.de>
Subject: [PATCH v2] ipmi/parisc: Add IPMI chassis
 poweroff for certain HP PA-RISC and IA-64 servers
Date: Tue, 27 Mar 2018 17:58:32 +0200
Message-ID: <20180327155832.GA19408@ls3530.fritz.box>
References: <20180324194504.GA10210@ls3530.fritz.box>
 <54f020d1-55a1-e1a5-88c3-cb9cbf7add9c@acm.org>
 <69751fab-c471-4d3a-257a-0001425d5821@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
 John David Anglin <dave.anglin@bell.net>, linux-parisc@vger.kernel.org
To: minyard@acm.org, openipmi-developer@lists.sourceforge.net,
 Matt Turner <mattst88@gmail.com>
Return-path: <openipmi-developer-bounces@lists.sourceforge.net>
In-Reply-To: <69751fab-c471-4d3a-257a-0001425d5821@gmx.de>
List-Id: Developer list of OpenIPMI library and Linux driver
 <openipmi-developer.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/openipmi-developer>,
 <mailto:openipmi-developer-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=openipmi-developer>
List-Post: <mailto:openipmi-developer@lists.sourceforge.net>
List-Help: <mailto:openipmi-developer-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/openipmi-developer>,
 <mailto:openipmi-developer-request@lists.sourceforge.net?subject=subscribe>
Errors-To: openipmi-developer-bounces@lists.sourceforge.net

This patch allows HP PA-RISC servers like rp3410/rp3440 and the HP C8000
workstation with an IPMI controller that predate IPMI 1.5 to use the standard
poweroff or powercycle commands.

These systems firmware don't set the chassis capability bit in the Get
Device ID, but they do implement the standard poweroff and powercycle
commands.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/char/ipmi/ipmi_poweroff.c b/drivers/char/ipmi/ipmi_poweroff.c
index 38e6af1c8e38..943c8bc1c364 100644
--- a/drivers/char/ipmi/ipmi_poweroff.c
+++ b/drivers/char/ipmi/ipmi_poweroff.c
@@ -457,6 +457,24 @@ static int ipmi_dell_chassis_detect(ipmi_user_t user)
 }
 
 /*
+ * ipmi_hp_chassis_detect()
+ * HP PA-RISC servers rp3410/rp3440, the C8000 workstation and the rx2600 and
+ * zx6000 machines support IPMI vers 1 and don't set the chassis capability bit
+ * but they can handle a chassis poweroff or powercycle command.
+ */
+
+#define HP_IANA_MFR_ID 0x0b
+#define HP_BMC_PROD_ID 0x8201
+static int ipmi_hp_chassis_detect(ipmi_user_t user)
+{
+	if (mfg_id == HP_IANA_MFR_ID
+		&& prod_id == HP_BMC_PROD_ID
+		&& ipmi_version == 1)
+		return 1;
+	return 0;
+}
+
+/*
  * Standard chassis support
  */
 
@@ -533,6 +551,9 @@ static struct poweroff_function poweroff_functions[] = {
 	{ .platform_type	= "chassis",
 	  .detect		= ipmi_dell_chassis_detect,
 	  .poweroff_func	= ipmi_poweroff_chassis },
+	{ .platform_type	= "chassis",
+	  .detect		= ipmi_hp_chassis_detect,
+	  .poweroff_func	= ipmi_poweroff_chassis },
 	/* Chassis should generally be last, other things should override
 	   it. */
 	{ .platform_type	= "chassis",

------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot
