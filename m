From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] [PATCH] PA-RISC: Fix bogus warnings from modpost
Date: Fri, 20 Oct 2006 07:46:32 -0600
Message-ID: <20061020134632.GW2602__44449.8823061169$1416624614$gmane$org@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: linux-kernel@vger.kernel.org,
 parisc-linux@parisc-linux.org
To: Sam Ravnborg <sam@ravnborg.org>,
 Rusty Russell <rusty@rustcorp.com.au>
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


parisc and parisc64 seem to name sections a little differently from other
targets.  parisc64 gives spurious warnings like:

WARNING: drivers/net/dummy.o - Section mismatch: reference to .init.text:dummy_setup from .data.rel.ro between '.LC1' (at offset 0x0) and '.LC6'

and parisc gives spurious warnings like:

WARNING: drivers/net/dummy.o - Section mismatch: reference to .init.text:dummy_setup from .rodata.cst4 between '.LC1' (at offset 0x0) and '.LC6'

Given the other comments in modpost.c, it seems that the best solution
is to move rodata down to the 'match at start of name' section and add
.data.rel.ro to the 'match entire name' section.

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 4127796..582b58f 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -910,7 +910,7 @@ static int init_section_ref_ok(const cha
 		".opd",   /* see comment [OPD] at exit_section_ref_ok() */
 		".toc1",  /* used by ppc64 */
 		".stab",
-		".rodata",
+		".data.rel.ro", /* used by parisc64 */
 		".text.lock",
 		"__bug_table", /* used by powerpc for BUG() */
 		".pci_fixup_header",
@@ -929,6 +929,7 @@ static int init_section_ref_ok(const cha
 		".altinstructions",
 		".eh_frame",
 		".debug",
+		".rodata",
 		NULL
 	};
 	/* part of section name */
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
