From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] [PATCH] fix possible null ptr deref in
	kallsyms_lookup
Date: Wed, 30 May 2007 02:43:16 -0400
Message-ID: <20070530064316.GA18422__33641.6118698709$1416624379$gmane$org@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: akpm@osdl.org,
 parisc-linux@lists.parisc-linux.org
To: torvalds@osdl.org
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

ugh, this function gets called by our unwinder. recursive backtrace for
the win... bisection to find this one was "fun."

Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>

---

commit ffb45122766db220d0bf3d01848d575fbbcb6430 removed our modname
arg since it was otherwise unused, but i was not cc'd on the patch :/

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index f1bda23..fed5441 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -257,7 +257,8 @@ const char *kallsyms_lookup(unsigned long addr,
 		pos = get_symbol_pos(addr, symbolsize, offset);
 		/* Grab name */
 		kallsyms_expand_symbol(get_symbol_offset(pos), namebuf);
-		*modname = NULL;
+		if (modname)
+			*modname = NULL;
 		return namebuf;
 	}
 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
