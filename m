From: Helge Deller <deller@gmx.de>
Subject: [PATCH] ipmi/parisc: Add IPMI chassis poweroff
 for certain HP PA-RISC servers
Date: Sat, 24 Mar 2018 20:45:04 +0100
Message-ID: <20180324194504.GA10210@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: linux-parisc@vger.kernel.org, Corey Minyard <minyard@acm.org>,
 openipmi-developer@lists.sourceforge.net,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 John David Anglin <dave.anglin@bell.net>
Return-path: <openipmi-developer-bounces@lists.sourceforge.net>
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
index 38e6af1c8e38..09f34ea370da 100644
--- a/drivers/char/ipmi/ipmi_poweroff.c
+++ b/drivers/char/ipmi/ipmi_poweroff.c
@@ -453,6 +453,13 @@ static int ipmi_dell_chassis_detect(ipmi_user_t user)
 	    ipmi_version_major <= 1 &&
 	    ipmi_version_minor < 5)
 		return 1;
+
+	/* BMC in HP C8000 can handle chassis functions too. */
+	if (IS_ENABLED(CONFIG_PARISC) &&
+	    mfg_id == 0x0b && prod_id == 0x8201 &&
+	    ipmi_version == 1)
+		return 1;
+
 	return 0;
 }
 

------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot
