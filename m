From: <gregkh@linuxfoundation.org>
Subject: patch "parisc: parisc_bus_type: use dev_groups and not dev_attrs for" added to driver-core-testing
Date: Fri, 09 Jun 2017 11:01:02 +0200
Message-ID: <14969988626832@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
To: gregkh@linuxfoundation.org, bart.vanassche@sandisk.com,
        deller@gmx.de, dledford@redhat.com, jejb@parisc-linux.org,
        linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


This is a note to let you know that I've just added the patch titled

    parisc: parisc_bus_type: use dev_groups and not dev_attrs for

to my driver-core git tree which can be found at
    git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
in the driver-core-testing branch.

The patch will show up in the next release of the linux-next tree
(usually sometime within the next 24 hours during the week.)

The patch will be merged to the driver-core-next branch sometime soon,
after it passes testing, and the merge window is open.

If you have any questions about this process, please let me know.


>From 9b7c6682270043415921ee73e584bdc4ee289fdf Mon Sep 17 00:00:00 2001
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 6 Jun 2017 14:16:38 +0200
Subject: parisc: parisc_bus_type: use dev_groups and not dev_attrs for
 bus_type

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
2.13.1


