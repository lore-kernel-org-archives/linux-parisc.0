Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A1638C2D8;
	Fri, 31 Jul 2026 12:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785502626; cv=none; b=sJh5DmD9AcOrqGTsemP111yuyE9IjYkuxj3p4YmefBzmKBcofrlWrHtB4sLOvcJTz5oNF+emGOXd+tgqiKdnzf5J2qPvT8BT5DIhzCu9yv6oHHXPJEZ3pB/fI/IGv3468/vZNILUKho4NnBVoYbWtuXIrZHmJhxEH78oCHaXLJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785502626; c=relaxed/simple;
	bh=TJ7dmmVipIZs0Zcl+K7aRhPPgn8oNQNCffkL3Oo2Cf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t90O7K7Warvqk0S4G9aneYlF7+iaryjVUunrS0ksfgDzQo8GsbGTgxqhp8tDb8zlfeYaBE4UVJRD0TsVamyx33qCy73HZ7D0yP4xcqiEirY1tuDZHMXSMeLQb0yw3b0HefGNSlxlJtJSGa+lLLX9A6GOSigRq3bc1c6m83jrLiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EUnrohVQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EUnrohVQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 586C71F000E9;
	Fri, 31 Jul 2026 12:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785502625;
	bh=UV6MLtGG5wez0g/Wu0+mTWGRpvN86p0MV/xad0a+SiM=;
	h=From:To:Cc:Subject:Date;
	b=EUnrohVQ8UKJnLQilPnmypOzEl7Of/icp1ZbEGwrkaR80lPL38CTYR8lThCqOH6SZ
	 vlYF8bSMvyyVu5FSHEykBccqe8+UOvkrvSjbXKPFCOfiRilWi/iQO8sBYoJ8npRb5X
	 5V5dvyoHGHtrWOUre5pMPmUpi6V+tsNUvppTBfw5wXyy9GdFxWKO6QpWR3EI2RLAmz
	 JyxH6MZrem3/hVKNgrBcPJouNX43alfWc/EWy7iduKYQtrNAJ4pqPu9ZQsJ7Zwxb8q
	 r/EdEL5ZUN1LyLCd8JOaBPDA2wY0sCpMivY1WqaAWQlLKvnS5bQW0yaJJQTfI5VtiA
	 XcklkrT2dueYA==
From: Helge Deller <deller@kernel.org>
To: Christoph Hellwig <hch@infradead.org>,
	linux-abi-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org
Cc: deller@gmx.de
Subject: [PATCH] UAPI: Drop PER_HPUX personality
Date: Fri, 31 Jul 2026 14:56:51 +0200
Message-ID: <20260731125651.2924-1-deller@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Helge Deller <deller@gmx.de>

Two and a half decades ago, there were plans to support HP-UX syscalls
in Linux. This was never fully implemented, never worked and was never
actually used by anybody.
Let's simply drop this define now and free it up for other usages.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 include/uapi/linux/personality.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/uapi/linux/personality.h b/include/uapi/linux/personality.h
index 49796b7756af..243f5f80a7b8 100644
--- a/include/uapi/linux/personality.h
+++ b/include/uapi/linux/personality.h
@@ -62,7 +62,6 @@ enum {
 	PER_SOLARIS =		0x000d | STICKY_TIMEOUTS,
 	PER_UW7 =		0x000e | STICKY_TIMEOUTS | MMAP_PAGE_ZERO,
 	PER_OSF4 =		0x000f,			 /* OSF/1 v4 */
-	PER_HPUX =		0x0010,
 	PER_MASK =		0x00ff,
 };
 
-- 
2.54.0

