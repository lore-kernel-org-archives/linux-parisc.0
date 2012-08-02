From: Jiri Kosina <jkosina@suse.cz>
Subject: [PATCH v2] parisc: fix personality flag check in copy_thread()
Date: Thu, 2 Aug 2012 09:12:05 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1208020911300.14910@pobox.suse.cz>
References: <alpine.LNX.2.00.1208012155330.14910@pobox.suse.cz>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: "James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1208012155330.14910@pobox.suse.cz>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Directly comparing task_struct->personality against PER_* is not fully
correct, as it doesn't take flags potentially stored in top three bytes
into account.

Analogically, directly forcefully setting personality to PER_LINUX32 or
PER_LINUX discards any flags stored in the top three bytes.

Signed-off-by: Jiri Kosina <jkosina@suse.cz>
---

changed since v1: fix the bit ops to reflect the fact that PER_LINUX is 
actually 0

 arch/parisc/kernel/process.c    |    2 +-
 arch/parisc/kernel/sys_parisc.c |    8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index d4b94b3..2c05a92 100644
--- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -309,7 +309,7 @@ copy_thread(unsigned long clone_flags, unsigned long usp,
 		cregs->ksp = (unsigned long)stack
 			+ (pregs->gr[21] & (THREAD_SIZE - 1));
 		cregs->gr[30] = usp;
-		if (p->personality == PER_HPUX) {
+		if (personality(p->personality) == PER_HPUX) {
 #ifdef CONFIG_HPUX
 			cregs->kpc = (unsigned long) &hpux_child_return;
 #else
diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
index c9b9322..7f9658e 100644
--- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -225,12 +225,12 @@ long parisc_personality(unsigned long personality)
 	long err;
 
 	if (personality(current->personality) == PER_LINUX32
-	    && personality == PER_LINUX)
-		personality = PER_LINUX32;
+	    && personality(personality) == PER_LINUX)
+		personality |= PER_LINUX32;
 
 	err = sys_personality(personality);
-	if (err == PER_LINUX32)
-		err = PER_LINUX;
+	if (personality(err) == PER_LINUX32)
+		err &= ~PER_LINUX32;
 
 	return err;
 }

-- 
Jiri Kosina
SUSE Labs
