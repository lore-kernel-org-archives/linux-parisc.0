From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] Re: [PATCH] Introduce O_CLOEXEC (take >2)
Date: Thu, 31 May 2007 23:07:54 -0400
Message-ID: <20070601030754.GB14217__21032.8297260732$1416624381$gmane$org@fattire.cabal.ca>
References: <200705311809.l4VI9F9X009556@devserv.devel.redhat.com>
	<20070531162021.4cd4e91a.akpm@linux-foundation.org>
	<20070601113840.813463db.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Chris Zankel <chris@zankel.net>,
 linux-kernel@vger.kernel.org,
 Ulrich Drepper <drepper@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 torvalds@linux-foundation.org,
 mingo@elte.hu,
 parisc-linux@lists.parisc-linux.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070601113840.813463db.sfr@canb.auug.org.au>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Jun 01, 2007 at 11:38:40AM +1000, Stephen Rothwell wrote:
> This also breaks Alpha (which uses 02000000 for O_DIRECT) and parisc
> (which uses 02000000 for O_RSYNC).  So you ether need to choose a
> different value or define O_CLOEXEC for those two architectures.
> 

That's easy enough to fix...

Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>

diff --git a/include/asm-parisc/fcntl.h b/include/asm-parisc/fcntl.h
index 317851f..4ca0fb0 100644
--- a/include/asm-parisc/fcntl.h
+++ b/include/asm-parisc/fcntl.h
@@ -14,6 +14,7 @@
 #define O_DSYNC		01000000 /* HPUX only */
 #define O_RSYNC		02000000 /* HPUX only */
 #define O_NOATIME	04000000
+#define O_CLOEXEC	08000000 /* set close_on_exec */
 
 #define O_DIRECTORY	00010000 /* must be a directory */
 #define O_NOFOLLOW	00000200 /* don't follow links */
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
