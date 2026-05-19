Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C5F23BD05
	for <linux-parisc@vger.kernel.org>; Tue, 19 May 2026 01:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779153602; cv=none; b=P7hh8ncpEJDiBmihA+7NECHzZEhXxLue3qEeoq4lTzleAKByfDnyBWYBXsbpUUWJ5bJzAaTq6orAQJIUWhR0gXW8lkFgnAo2PLPGUHwfY1j10zRObzIBiujVQCieIeDvu8LBH3Zss0VYf5zW2g1K7JOTTv4ryqzgatWwhsMAGM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779153602; c=relaxed/simple;
	bh=uC/YTHZQN/5OVj8zrqwkRVYTiYsHlJGxeqoHIVP2gds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GA0L0x36dEeJz/WHQWRHCQo7LTReKG+GHfo7wNK999Iapkl+RDjZYlNsnWigbf5td8rxm4VBXWVP06cK0N0nLzlLcRoMZvGBIyqk2DWAP+MVBOW8t11wncKAfcWVPTwI6nAEp8xMI4tknoGnPSd5/2AmkNoBnK/X7u3sGWrqwY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gnq9KH6L; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gnq9KH6L"
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-2f00a567cfaso2066966eec.0
        for <linux-parisc@vger.kernel.org>; Mon, 18 May 2026 18:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779153598; x=1779758398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=61IH/1X9bdUpbndRHMPT6pWv81GYEfTAPjpqMU4gh2E=;
        b=Gnq9KH6LWICcWk7JWuKm/yO7WrEL8YdF16tJOwwX6ldJtlzHzg3BPOJ5xEFqBZtB+Y
         tRPoXh2UKPZykIPBQ1B2NCVcMrXZd4p2O71mHDrUTiQ+Mu9SheWOXy+e0EKwgA1J5sn+
         kJLd+JOHTDf3Ubb8ibtuh5QOvXaRY74iKP49OIXMtqOTVTBJmIx97QXFq072WIaI7g9/
         EqFGjQzC2UkprAahERIuFlfyxObO3ZWMcnoqPZl/kh6sFUXla246l8PpDSAmOSh/7Pc7
         r98KsIGUv5IXvdjaAonGlfTxKVzsGZJB0DFMy0ttEpIU4Sly8j8QLk36NAPTHdOAAe2N
         AkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779153598; x=1779758398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61IH/1X9bdUpbndRHMPT6pWv81GYEfTAPjpqMU4gh2E=;
        b=kkgAEPNYd4oCM8FJiJVWr9QX1gfijKSPDA7fUD7l5kH5/8K+5jbUd6oH6qOwyXOLTA
         ZSrjQlnu6vKNU2PlyhouB9YbTqiI8oOewekHbxDyCiRyy4cZjTPDj3h3XcJedCzuy7zF
         CWldA6fbxYK0mquf51qDvHB84lMtdKB5+fX11TJuzprTAMkVDPgkeqDFzXdvHjh3qA09
         s2eVezR/rzO5KuG0yrfMc6TPY8D2MVGBjy5fBG5sdW0HFWnlP5KC0Fxblt/xKeCKS/Hg
         eVWydwfe4qa7jDHxq2kZUzVBhGzsHwH0BPxi6H/Kxb3yjFzrDscjYg7OblYe3ZyXPrrV
         c+qg==
X-Forwarded-Encrypted: i=1; AFNElJ+X8CaR5Ba0eipuRmUw5J5NGBGBpHyXQVz0mv44GCZEI3LciqBu44e4FrRrGp4szHEEgtf31c/Wf/8fSp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxinGAzGqWMoXYMcPH+3wLiWemh11q1hRLIfcGpZLeJdIpsTAbD
	TsL1bGwKEdLrVjsWnxJRTFCzyBfvqF6CoNMVkQdqECFUXr9lSQeE29Hf
X-Gm-Gg: Acq92OFRo7QCurzv8sU1zuuniTjrLK26AS+62U9/CnnRCpc1DCDwddNEs9y3NtN0YF5
	USVKUyvsQGN9Ca+MXqqaCkB0dzj/Fv7JaYtSECM0Fz6hT3T3k90X0wpyH5ZQHmUEQ+hRSiG4Z8S
	ncCSnn4ggUCHHv21qtRnTBl8a3RMFB+FnNwE9g3czepsNTFlKVlp5WRoxWrqx6yX5Xvlb11oPd8
	NhYnHmzfSflrZq/ng0tL1KwbCMAJMLb/RNOo1e45uzXdg8XE0q0js92fVpf05wiUidARG3P/BD9
	lO0t/o4eSygyJCwYZrXfzjO1Ny2nhKgrRBKnXU6AITQPO60gYvD7VduR66lcV38e7+1OIcGIdjN
	yBuJNd9Fvm22KBRTkYH2I68HKKd58pdD23Io+csbLB1LBsNKmBtTU89ahDgMjHq+Kqz3ZDIfnHg
	rj67ewNYjh1oEutt22j81qlS5GXl9PvbP8VdwgU2C7W9RBbPDLndL1FTSTVyi1/uqaVpwPXXB6C
	6bx7mOZX+NcI1QiGKKGJ93J8jS/37GbwSkm5brCSr2VrbasGnOGuIRPPtNCZVRrbMMAR7Kk6N6s
	ljPAbFVntoIp9S4avw==
X-Received: by 2002:a05:7300:ec07:b0:302:b44b:b64a with SMTP id 5a478bee46e88-3039785c81fmr7064800eec.1.1779153598298;
        Mon, 18 May 2026 18:19:58 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6adsm17034305eec.15.2026.05.18.18.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 18:19:57 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-arch@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Brian Cain <bcain@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] Generate <asm/asm-offsets.h> and remove identical copies in all architectures
Date: Mon, 18 May 2026 18:18:41 -0700
Message-ID: <20260519011928.78398-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Every architecture supported by the kernel has a functionally identical
copy of <asm/asm-offsets.h> which simply includes
<generated/asm-offsets.h>, even though it is also present in
asm-generic. Eliminate this unnecessary complexity by adding
<asm/asm-offsets.h> to the list of mandatory asm headers, which causes
a copy of it that includes <asm-generic/asm-offsets.h> to be generated
automatically.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arc/include/asm/asm-offsets.h        | 6 ------
 arch/arm/include/asm/asm-offsets.h        | 1 -
 arch/arm64/include/asm/asm-offsets.h      | 1 -
 arch/hexagon/include/asm/asm-offsets.h    | 1 -
 arch/loongarch/include/asm/asm-offsets.h  | 5 -----
 arch/m68k/include/asm/asm-offsets.h       | 1 -
 arch/microblaze/include/asm/asm-offsets.h | 1 -
 arch/mips/include/asm/asm-offsets.h       | 1 -
 arch/nios2/include/asm/asm-offsets.h      | 7 -------
 arch/openrisc/include/asm/asm-offsets.h   | 1 -
 arch/parisc/include/asm/asm-offsets.h     | 1 -
 arch/powerpc/include/asm/asm-offsets.h    | 1 -
 arch/riscv/include/asm/asm-offsets.h      | 1 -
 arch/sh/include/asm/asm-offsets.h         | 2 --
 arch/sparc/include/asm/asm-offsets.h      | 1 -
 arch/x86/include/asm/asm-offsets.h        | 1 -
 arch/xtensa/include/asm/asm-offsets.h     | 1 -
 include/asm-generic/Kbuild                | 1 +
 18 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 arch/arc/include/asm/asm-offsets.h
 delete mode 100644 arch/arm/include/asm/asm-offsets.h
 delete mode 100644 arch/arm64/include/asm/asm-offsets.h
 delete mode 100644 arch/hexagon/include/asm/asm-offsets.h
 delete mode 100644 arch/loongarch/include/asm/asm-offsets.h
 delete mode 100644 arch/m68k/include/asm/asm-offsets.h
 delete mode 100644 arch/microblaze/include/asm/asm-offsets.h
 delete mode 100644 arch/mips/include/asm/asm-offsets.h
 delete mode 100644 arch/nios2/include/asm/asm-offsets.h
 delete mode 100644 arch/openrisc/include/asm/asm-offsets.h
 delete mode 100644 arch/parisc/include/asm/asm-offsets.h
 delete mode 100644 arch/powerpc/include/asm/asm-offsets.h
 delete mode 100644 arch/riscv/include/asm/asm-offsets.h
 delete mode 100644 arch/sh/include/asm/asm-offsets.h
 delete mode 100644 arch/sparc/include/asm/asm-offsets.h
 delete mode 100644 arch/x86/include/asm/asm-offsets.h
 delete mode 100644 arch/xtensa/include/asm/asm-offsets.h

diff --git a/arch/arc/include/asm/asm-offsets.h b/arch/arc/include/asm/asm-offsets.h
deleted file mode 100644
index 32a1d3d518dc..000000000000
--- a/arch/arc/include/asm/asm-offsets.h
+++ /dev/null
@@ -1,6 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2004, 2007-2010, 2011-2012 Synopsys, Inc. (www.synopsys.com)
- */
-
-#include <generated/asm-offsets.h>
diff --git a/arch/arm/include/asm/asm-offsets.h b/arch/arm/include/asm/asm-offsets.h
deleted file mode 100644
index d370ee36a182..000000000000
--- a/arch/arm/include/asm/asm-offsets.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <generated/asm-offsets.h>
diff --git a/arch/arm64/include/asm/asm-offsets.h b/arch/arm64/include/asm/asm-offsets.h
deleted file mode 100644
index d370ee36a182..000000000000
--- a/arch/arm64/include/asm/asm-offsets.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <generated/asm-offsets.h>
diff --git a/arch/hexagon/include/asm/asm-offsets.h b/arch/hexagon/include/asm/asm-offsets.h
deleted file mode 100644
index d370ee36a182..000000000000
--- a/arch/hexagon/include/asm/asm-offsets.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <generated/asm-offsets.h>
diff --git a/arch/loongarch/include/asm/asm-offsets.h b/arch/loongarch/include/asm/asm-offsets.h
deleted file mode 100644
index d9ad88d293e7..000000000000
--- a/arch/loongarch/include/asm/asm-offsets.h
+++ /dev/null
@@ -1,5 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
- */
-#include <generated/asm-offsets.h>
diff --git a/arch/m68k/include/asm/asm-offsets.h b/arch/m68k/include/asm/asm-offsets.h
deleted file mode 100644
index d370ee36a182..000000000000
--- a/arch/m68k/include/asm/asm-offsets.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <generated/asm-offsets.h>
diff --git a/arch/microblaze/include/asm/asm-offsets.h b/arch/microblaze/include/asm/asm-offsets.h
deleted file mode 100644
index d370ee36a182..000000000000
--- a/arch/microblaze/include/asm/asm-offsets.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <generated/asm-offsets.h>
diff --git a/arch/mips/include/asm/asm-offsets.h b/arch/mips/include/asm/asm-offsets.h
deleted file mode 100644
index d370ee36a182..000000000000
--- a/arch/mips/include/asm/asm-offsets.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <generated/asm-offsets.h>
diff --git a/arch/nios2/include/asm/asm-offsets.h b/arch/nios2/include/asm/asm-offsets.h
deleted file mode 100644
index e51465213b53..000000000000
--- a/arch/nios2/include/asm/asm-offsets.h
+++ /dev/null
@@ -1,7 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- *  Copyright (C) 2010 Tobias Klauser <tklauser@distanz.ch>
- *  Copyright (C) 2009 Thomas Chou <thomas@wytron.com.tw>
- */
-
-#include <generated/asm-offsets.h>
diff --git a/arch/openrisc/include/asm/asm-offsets.h b/arch/openrisc/include/asm/asm-offsets.h
deleted file mode 100644
index d370ee36a182..000000000000
--- a/arch/openrisc/include/asm/asm-offsets.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <generated/asm-offsets.h>
diff --git a/arch/parisc/include/asm/asm-offsets.h b/arch/parisc/include/asm/asm-offsets.h
deleted file mode 100644
index d370ee36a182..000000000000
--- a/arch/parisc/include/asm/asm-offsets.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <generated/asm-offsets.h>
diff --git a/arch/powerpc/include/asm/asm-offsets.h b/arch/powerpc/include/asm/asm-offsets.h
deleted file mode 100644
index d370ee36a182..000000000000
--- a/arch/powerpc/include/asm/asm-offsets.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <generated/asm-offsets.h>
diff --git a/arch/riscv/include/asm/asm-offsets.h b/arch/riscv/include/asm/asm-offsets.h
deleted file mode 100644
index d370ee36a182..000000000000
--- a/arch/riscv/include/asm/asm-offsets.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <generated/asm-offsets.h>
diff --git a/arch/sh/include/asm/asm-offsets.h b/arch/sh/include/asm/asm-offsets.h
deleted file mode 100644
index 9f8535716392..000000000000
--- a/arch/sh/include/asm/asm-offsets.h
+++ /dev/null
@@ -1,2 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#include <generated/asm-offsets.h>
diff --git a/arch/sparc/include/asm/asm-offsets.h b/arch/sparc/include/asm/asm-offsets.h
deleted file mode 100644
index d370ee36a182..000000000000
--- a/arch/sparc/include/asm/asm-offsets.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <generated/asm-offsets.h>
diff --git a/arch/x86/include/asm/asm-offsets.h b/arch/x86/include/asm/asm-offsets.h
deleted file mode 100644
index d370ee36a182..000000000000
--- a/arch/x86/include/asm/asm-offsets.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <generated/asm-offsets.h>
diff --git a/arch/xtensa/include/asm/asm-offsets.h b/arch/xtensa/include/asm/asm-offsets.h
deleted file mode 100644
index d370ee36a182..000000000000
--- a/arch/xtensa/include/asm/asm-offsets.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <generated/asm-offsets.h>
diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
index 2c53a1e0b760..9879bba63a38 100644
--- a/include/asm-generic/Kbuild
+++ b/include/asm-generic/Kbuild
@@ -6,6 +6,7 @@
 
 mandatory-y += atomic.h
 mandatory-y += archrandom.h
+mandatory-y += asm-offsets.h
 mandatory-y += barrier.h
 mandatory-y += bitops.h
 mandatory-y += bug.h
-- 
2.43.0

