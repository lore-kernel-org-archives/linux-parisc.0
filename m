From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] [PARISC] Fix bug when syscall nr is
	__NR_Linux_syscalls
Date: Sun, 3 Jun 2007 17:50:46 -0400
Message-ID: <20070603215046.GA1901__15448.7552041703$1416624385$gmane$org@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

From: Kyle McMartin <kyle@minerva.i.cabal.ca>

The bug was that we were comparing __NR_syscalls to be greater or equal
to the syscall number stored in %r20. __NR_syscalls is one greater than
the last syscall though, so we're loading one entry beyond the end of the
syscall table, and trying to jump to it.

Fix this by only checking that we're greater, alternatively, we could
have compared to (__NR_Linux_syscalls - 1)

Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>
---
 arch/parisc/kernel/syscall.S |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 91b2a48..56f6231 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -198,7 +198,7 @@ linux_gateway_entry:
 	ldil	L%sys_call_table, %r1
 	ldo     R%sys_call_table(%r1), %r19
 #endif	
-	comiclr,>>=	__NR_Linux_syscalls, %r20, %r0
+	comiclr,>>	__NR_Linux_syscalls, %r20, %r0
 	b,n	.Lsyscall_nosys
 	
 	LDREGX  %r20(%r19), %r19
-- 
1.5.1.3

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
