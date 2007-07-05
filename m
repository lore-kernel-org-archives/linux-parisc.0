From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] [PATCH] Fix building palo in a separate directory
Date: Thu, 5 Jul 2007 14:30:40 -0600
Message-ID: <20070705203040.GB3527__9781.788980081$1416624640$gmane$org@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@parisc-linux.org
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


When using an objdir that's different from the srcdir, the initial step
of creating the palo.conf goes awry.

Signed-off-by: Matthew Wilcox <matthew@wil.cx>

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 760567a..c09be26 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -84,10 +84,10 @@ palo: vmlinux
 		false; \
 	fi
 	@if [ ! -f ./palo.conf ]; then \
-		cp arch/parisc/defpalo.conf palo.conf; \
-		echo 'A generic palo config file (./palo.conf) has been created for you.'; \
+		cp $(srctree)/arch/parisc/defpalo.conf ./palo.conf; \
+		echo 'A generic palo config file ($(objtree)/palo.conf) has been created for you.'; \
 		echo 'You should check it and re-run "make palo".'; \
-		echo 'WARNING: the "lifimage" file is now placed in this directory by default!'; \
+		echo WARNING: the lifimage file is placed in $(objtree) by default\!; \
 		false; \
 	fi
 	$(PALO) -f ./palo.conf

-- 
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
