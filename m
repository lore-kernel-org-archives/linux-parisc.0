From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 03/16] parisc: parisc_bus_type: use dev_groups and not dev_attrs for bus_type
Date: Tue,  6 Jun 2017 21:22:08 +0200
Message-ID: <20170606192221.1617-4-gregkh@linuxfoundation.org>
References: <20170606192221.1617-1-gregkh@linuxfoundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "James E.J. Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>,
        Bart Van Assche <bart.vanassche@sandisk.com>,
        Doug Ledford <dledford@redhat.com>,
        linux-parisc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20170606192221.1617-1-gregkh@linuxfoundation.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The dev_attrs field has long been "depreciated" and is finally being
removed, so move the driver to use the "correct" dev_groups field
instead for struct bus_type.

Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>
Cc: Helge Deller <deller@gmx.de>
Cc: Bart Van Assche <bart.vanassche@sandisk.com>
Cc: Doug Ledford <dledford@redhat.com>
Cc: <linux-parisc@vger.kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/parisc/kernel/drivers.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/parisc/kernel/drivers.c b/arch/parisc/kernel/drivers.c
index fa78419100c8..d8f77358e2ba 100644
--- a/arch/parisc/kernel/drivers.c
+++ b/arch/parisc/kernel/drivers.c
@@ -575,7 +575,8 @@ static ssize_t name##_show(struct device *dev, struct device_attribute *attr, ch
 {									\
 	struct parisc_device *padev = to_parisc_device(dev);		\
 	return sprintf(buf, format_string, padev->field);		\
-}
+}									\
+static DEVICE_ATTR_RO(name);
 
 #define pa_dev_attr_id(field, format) pa_dev_attr(field, id.field, format)
 
@@ -589,22 +590,24 @@ static ssize_t modalias_show(struct device *dev, struct device_attribute *attr,
 {
 	return make_modalias(dev, buf);
 }
+static DEVICE_ATTR_RO(modalias);
 
-static struct device_attribute parisc_device_attrs[] = {
-	__ATTR_RO(irq),
-	__ATTR_RO(hw_type),
-	__ATTR_RO(rev),
-	__ATTR_RO(hversion),
-	__ATTR_RO(sversion),
-	__ATTR_RO(modalias),
-	__ATTR_NULL,
+static struct attribute *parisc_device_attrs[] = {
+	&dev_attr_irq.attr,
+	&dev_attr_hw_type.attr,
+	&dev_attr_rev.attr,
+	&dev_attr_hversion.attr,
+	&dev_attr_sversion.attr,
+	&dev_attr_modalias.attr,
+	NULL,
 };
+ATTRIBUTE_GROUPS(parisc_device);
 
 struct bus_type parisc_bus_type = {
 	.name = "parisc",
 	.match = parisc_generic_match,
 	.uevent = parisc_uevent,
-	.dev_attrs = parisc_device_attrs,
+	.dev_groups = parisc_device_groups,
 	.probe = parisc_driver_probe,
 	.remove = parisc_driver_remove,
 };
-- 
2.13.0

