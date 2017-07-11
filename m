From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH] parisc: pdc_stable: constify attribute_group structures.
Date: Tue, 11 Jul 2017 14:30:34 +0530
Message-ID: <d7b7c51aafc608a9be4d136d63d8d0a05f36dd82.1499763477.git.arvind.yadav.cs@gmail.com>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: jejb@parisc-linux.org, deller@gmx.de
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

attribute_groups are not supposed to change at runtime. All functions
working with attribute_groups provided by <linux/sysfs.h> work
with const attribute_group. So mark the non-const structs as const.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/parisc/pdc_stable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/parisc/pdc_stable.c b/drivers/parisc/pdc_stable.c
index 055f83f..7147aa5 100644
--- a/drivers/parisc/pdc_stable.c
+++ b/drivers/parisc/pdc_stable.c
@@ -954,7 +954,7 @@ static ssize_t pdcs_osdep2_write(struct kobject *kobj,
 	NULL,
 };
 
-static struct attribute_group pdcs_attr_group = {
+static const struct attribute_group pdcs_attr_group = {
 	.attrs = pdcs_subsys_attrs,
 };
 
-- 
1.9.1
