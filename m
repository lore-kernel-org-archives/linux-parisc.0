From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] Re: [PATCH] Introduce O_CLOEXEC (take >2)
Date: Fri, 1 Jun 2007 18:55:49 -0400
Message-ID: <20070601225549.GD7714__29449.8752373785$1416624381$gmane$org@fattire.cabal.ca>
References: <200705311809.l4VI9F9X009556@devserv.devel.redhat.com>
	<20070531162021.4cd4e91a.akpm@linux-foundation.org>
	<20070601113840.813463db.sfr@canb.auug.org.au>
	<20070601030754.GB14217@fattire.cabal.ca>
	<Pine.LNX.4.64.0706011510220.26938@winds.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Chris Zankel <chris@zankel.net>,
 linux-kernel@vger.kernel.org,
 Ulrich Drepper <drepper@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 torvalds@linux-foundation.org,
 mingo@elte.hu,
 parisc-linux@lists.parisc-linux.org
To: Byron Stanoszek <bstanoszek@comtime.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.64.0706011510220.26938@winds.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Jun 01, 2007 at 03:17:03PM -0400, Byron Stanoszek wrote:
> These are octal values, so you really want to use 010000000 instead of
> 08000000. :-)
> 

Wow. I am totally a dumbass, I saw a 'x' there. Sigh.

diff --git a/include/asm-parisc/fcntl.h b/include/asm-parisc/fcntl.h
index 317851f..7089507 100644
--- a/include/asm-parisc/fcntl.h
+++ b/include/asm-parisc/fcntl.h
@@ -14,6 +14,7 @@
 #define O_DSYNC		01000000 /* HPUX only */
 #define O_RSYNC		02000000 /* HPUX only */
 #define O_NOATIME	04000000
+#define O_CLOEXEC	010000000	/* set close_on_exec */
 
 #define O_DIRECTORY	00010000 /* must be a directory */
 #define O_NOFOLLOW	00000200 /* don't follow links */
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
