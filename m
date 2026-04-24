Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E59437754D;
	Fri, 24 Apr 2026 10:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026756; cv=none; b=gDYeMc+Q06hptbZLk/nth4OEws4poq+pPXlinUajLSQf/VFKirQ94LItVvEtaU6uFJjAnkRDr4DuX4SqnVatU/Teamdx4kMEmoBpD/hpDx4zwFnoJvjjcjOoePfTvcY1ptfBpUpzkOlsDkGj4OjZ5xAiNJUnHQMpz1EzIsZuAQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026756; c=relaxed/simple;
	bh=m6Hnqw9YtsGA5fjKjP1McBjtzjnd9zkmi0PMEFWS/gI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VegyX/n1sPUhaq5xqOK6gebYVDNqPhID62Z9KeUzcn2dolEEC7y6Eqvx5d+Bk9aL5Q2/Vr/j5krP56H4mU/Q+P2MOVtsgA5/mziAoTfUyJFHUfd13K+BzI2LK5xsg/Rdl3WPlxOpZPtVKqjlhXXymD5BxQKG8ZdVbb1WPwHWIYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FZtVz8Du; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FZtVz8Du"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971B4C2BCB6;
	Fri, 24 Apr 2026 10:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777026755;
	bh=m6Hnqw9YtsGA5fjKjP1McBjtzjnd9zkmi0PMEFWS/gI=;
	h=From:To:Cc:Subject:Date:From;
	b=FZtVz8Duyme+Q7cHLW/EPch/4G+JSDkJpjLaWFGOyxYS50hqCI1oMpycWeHFobTje
	 hW2RYLrkr7Y80WcE8HTgRd2QzZCR2UDju+AVtEa8gG+udz9qbrHs29b/V50zacOVMM
	 WH+bmqfM8LDgZYKYUcXMWXVigw4csUe6f4qiJX+y3Hi01h6v19FCVWT++ojb0DGsku
	 U1vGfmrQI2HreDbMPCV5TkX2Z+zroNX9+tTgXHhp8joRSg+V0ZColPncbJJaFFZkya
	 KVqDQ6TRwdiU/1l3PZ18VzgsBZMe45YfD9bATJY4g5G9hosruqzVmdyvHSUbcWF1iW
	 4n4thAA3P+5cQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wGDpp-0000000Ayex-1uWT;
	Fri, 24 Apr 2026 12:32:33 +0200
From: Johan Hovold <johan@kernel.org>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] parisc: drivers: switch to dynamic root device
Date: Fri, 24 Apr 2026 12:32:11 +0200
Message-ID: <20260424103211.2616426-1-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver core expects devices to be dynamically allocated and will, for
example, complain loudly if a device that lacks a release function
is ever freed.

Use root_device_register() to allocate and register the root device
instead of open coding using a static device.

While at it, drop the redundant additional reference taken at init.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 arch/parisc/kernel/drivers.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/arch/parisc/kernel/drivers.c b/arch/parisc/kernel/drivers.c
index bc47bbe3026e..b52ad704ec8a 100644
--- a/arch/parisc/kernel/drivers.c
+++ b/arch/parisc/kernel/drivers.c
@@ -41,9 +41,7 @@
 const struct dma_map_ops *hppa_dma_ops __ro_after_init;
 EXPORT_SYMBOL(hppa_dma_ops);
 
-static struct device root = {
-	.init_name = "parisc",
-};
+static struct device *root;
 
 static inline int check_dev(struct device *dev)
 {
@@ -89,7 +87,7 @@ static int for_each_padev(int (*fn)(struct device *, void *), void * data)
 		.obj	= data,
 		.fn	= fn,
 	};
-	return device_for_each_child(&root, &recurse_data, descend_children);
+	return device_for_each_child(root, &recurse_data, descend_children);
 }
 
 /**
@@ -290,7 +288,7 @@ const struct parisc_device *
 find_pa_parent_type(const struct parisc_device *padev, int type)
 {
 	const struct device *dev = &padev->dev;
-	while (dev != &root) {
+	while (dev != root) {
 		struct parisc_device *candidate = to_parisc_device(dev);
 		if (candidate->id.hw_type == type)
 			return candidate;
@@ -319,7 +317,7 @@ static void get_node_path(struct device *dev, struct hardware_path *path)
 		dev = dev->parent;
 	}
 
-	while (dev != &root) {
+	while (dev != root) {
 		if (dev_is_pci(dev)) {
 			unsigned int devfn = to_pci_dev(dev)->devfn;
 			path->bc[i--] = PCI_SLOT(devfn) | (PCI_FUNC(devfn)<< 5);
@@ -482,7 +480,7 @@ static struct parisc_device * __init alloc_tree_node(
 static struct parisc_device *create_parisc_device(struct hardware_path *modpath)
 {
 	int i;
-	struct device *parent = &root;
+	struct device *parent = root;
 	for (i = 0; i < 6; i++) {
 		if (modpath->bc[i] == -1)
 			continue;
@@ -755,7 +753,7 @@ parse_tree_node(struct device *parent, int index, struct hardware_path *modpath)
 struct device *hwpath_to_device(struct hardware_path *modpath)
 {
 	int i;
-	struct device *parent = &root;
+	struct device *parent = root;
 	for (i = 0; i < 6; i++) {
 		if (modpath->bc[i] == -1)
 			continue;
@@ -880,7 +878,7 @@ void __init walk_central_bus(void)
 {
 	walk_native_bus(CENTRAL_BUS_ADDR,
 			CENTRAL_BUS_ADDR + (MAX_NATIVE_DEVICES * NATIVE_DEVICE_OFFSET),
-			&root);
+			root);
 }
 
 static __init void print_parisc_device(struct parisc_device *dev)
@@ -907,9 +905,10 @@ void __init init_parisc_bus(void)
 {
 	if (bus_register(&parisc_bus_type))
 		panic("Could not register PA-RISC bus type\n");
-	if (device_register(&root))
+
+	root = root_device_register("parisc");
+	if (IS_ERR(root))
 		panic("Could not register PA-RISC root device\n");
-	get_device(&root);
 }
 
 static __init void qemu_header(void)
-- 
2.53.0

