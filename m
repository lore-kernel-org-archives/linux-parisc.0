From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: [parisc-linux] [PATCH] fix git-checkout-cache segfault on parisc
Date: Sat, 13 Aug 2005 10:29:32 -0500
Message-ID: <1123946972.5115.4.camel__19182.0079730407$1416623892$gmane$org@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>,
 git@vger.kernel.org
To: junkio@cox.net
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

This one I think is Linus' fault, so send him a brown paper bag with my
complements ...

The index cleanup code is executed via atexit() which is *after* main
has completed, so the stack allocated cache_file has gone out of scope.
Parisc seems to use stack in the destructor functions, so cache_file
gets partially overwritten leading to the predictable disastrous
consequences.

Signed-off-by: James Bottomley <James.Bottomley@SteelEye.com>

---

James

diff --git a/checkout-cache.c b/checkout-cache.c
--- a/checkout-cache.c
+++ b/checkout-cache.c
@@ -80,10 +80,11 @@ static int checkout_all(void)
 static const char checkout_cache_usage[] =
 "git-checkout-cache [-u] [-q] [-a] [-f] [-n] [--prefix=<string>] [--] <file>...";
 
+static struct cache_file cache_file;
+
 int main(int argc, char **argv)
 {
 	int i, force_filename = 0;
-	struct cache_file cache_file;
 	int newfd = -1;
 
 	if (read_cache() < 0) {
diff --git a/index.c b/index.c


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
