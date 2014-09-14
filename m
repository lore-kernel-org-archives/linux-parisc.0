From: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Subject: [PATCH] parisc: pdc_stable.c:  Cleaning up unnecessary use of memset in conjunction with strncpy
Date: Sun, 14 Sep 2014 18:02:12 +0200
Message-ID: <1410710532-14429-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Cc: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: "James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Using memset before strncpy just to ensure a trailing null
character is an unnecessary double writing of a string

Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
---
 drivers/parisc/pdc_stable.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/parisc/pdc_stable.c b/drivers/parisc/pdc_stable.c
index 0f54ab6..76860ad 100644
--- a/drivers/parisc/pdc_stable.c
+++ b/drivers/parisc/pdc_stable.c
@@ -765,8 +765,8 @@ static ssize_t pdcs_auto_write(struct kobject *kobj,
 		return -EINVAL;
 
 	/* We'll use a local copy of buf */
-	memset(in, 0, count+1);
 	strncpy(in, buf, count);
+	in[count] = '\0';
 
 	/* Current flags are stored in primary boot path entry */
 	pathentry = &pdcspath_entry_primary;
-- 
1.7.10.4

