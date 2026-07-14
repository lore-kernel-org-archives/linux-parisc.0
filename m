Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E989F188CC9;
	Tue, 14 Jul 2026 07:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784012581; cv=none; b=QPmXOwGlTcb5POHT6UnuFM/M5qZnoboehnBtFL28NA6zVwxGOTZkA+Ymx1uq1/MGn9P4B2KedgZc7n1FvEjh28S6YGQkwAXBrj4d0FF7mZxwATfJh7q8D6X6GpJlgI+yvKSEkLTLU45amR2pr9QeihYGO+uTSJViyRfT/Tri/4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784012581; c=relaxed/simple;
	bh=YW5fytAf+Dbed/ho3b7AckZOo6j4OMJtiPgDUKDyB9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GI06Wi8PqeVM+Fm9vPJca33xVHz4abUfdujBXsXVoOCwkGS+dj6wZvbVVXtPDtwRTxoHrVM6NGzMJ8c8t4YGmdioAG7mp7xhxkotOSy3VqGvCIwiLtHChUAqFmvW69MtMG4HENna7wOGkFB5E2Ymd3sgsg/zpvWKY31fxGU8rFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B2B71F000E9;
	Tue, 14 Jul 2026 07:02:57 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: "Martin K . Petersen" <martin.petersen@oracle.com>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] parisc: superio: Spelling s/Peterson/Petersen/
Date: Tue, 14 Jul 2026 09:02:52 +0200
Message-ID: <feede3d4d3203379678dad30a78305fb17dcf939.1784012424.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct a typo in Martin's surname.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/parisc/superio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/parisc/superio.c b/drivers/parisc/superio.c
index e973c689320387be..3aaab40df86ecb12 100644
--- a/drivers/parisc/superio.c
+++ b/drivers/parisc/superio.c
@@ -15,7 +15,7 @@
  *	(C) Copyright 2005 Kyle McMartin <kyle@parisc-linux.org>
  *	(C) Copyright 2006 Helge Deller <deller@gmx.de>
  *
- *	The initial version of this is by Martin Peterson.  Alex deVries
+ *	The initial version of this is by Martin Petersen.  Alex deVries
  *	has spent a bit of time trying to coax it into working.
  *
  *      Major changes to get basic interrupt infrastructure working to
-- 
2.43.0

