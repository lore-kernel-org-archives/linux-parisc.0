From: David Howells <dhowells@redhat.com>
Subject: [PATCH 03/59] CRED: Wrap task credential accesses in the PA-RISC arch
Date: Wed, 27 Aug 2008 14:45:57 +0100
Message-ID: <20080827134557.19980.40787.stgit@warthog.procyon.org.uk>
References: <20080827134541.19980.61042.stgit@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Cc: linux-security-module@vger.kernel.org,
	David Howells <dhowells@redhat.com>,
	Serge Hallyn <serue@us.ibm.com>,
	Kyle McMartin <kyle@mcmartin.ca>,
	Matthew Wilcox <matthew@wil.cx>,
	Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <20080827134541.19980.61042.stgit@warthog.procyon.org.uk>
List-ID: <linux-security-module.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Wrap access to task credentials so that they can be separated more easily from
the task_struct during the introduction of COW creds.

Change most current->(|e|s|fs)[ug]id to current_(|e|s|fs)[ug]id().

Change some task->e?[ug]id to task_e?[ug]id().  In some places it makes more
sense to use RCU directly rather than a convenient wrapper; these will be
addressed by later patches.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: James Morris <jmorris@namei.org>
Acked-by: Serge Hallyn <serue@us.ibm.com>
Cc: Kyle McMartin <kyle@mcmartin.ca>
Cc: Matthew Wilcox <matthew@wil.cx>
Cc: Grant Grundler <grundler@parisc-linux.org>
Cc: linux-parisc@vger.kernel.org
---

 arch/parisc/kernel/signal.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)


diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
index 06213d1..f825442 100644
--- a/arch/parisc/kernel/signal.c
+++ b/arch/parisc/kernel/signal.c
@@ -182,7 +182,7 @@ give_sigsegv:
 	si.si_errno = 0;
 	si.si_code = SI_KERNEL;
 	si.si_pid = task_pid_vnr(current);
-	si.si_uid = current->uid;
+	si.si_uid = current_uid();
 	si.si_addr = &frame->uc;
 	force_sig_info(SIGSEGV, &si, current);
 	return;

