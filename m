From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] [PATCH] Fixs to work on ARM and PARIC platforms.
Date: Sat, 01 Apr 2006 08:46:59 -0600
Message-ID: <1143902819.3368.3.camel__5349.12873195044$1416624039$gmane$org@mulgrave.il.steeleye.com>
References: <e739902b0604010122tefc6ab5radf8121eea8a3015@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: fuse-devel@lists.sourceforge.net,
 parisc-linux@lists.parisc-linux.org
To: Ryan Bradetich <rbradetich@gmail.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <e739902b0604010122tefc6ab5radf8121eea8a3015@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, 2006-04-01 at 01:22 -0800, Ryan Bradetich wrote:
> 2. I had to add an additional cache flush in the fuse_copy_do
> function.  On both ARM and PARISC, the data was corrupted unless cache
> is flushed first.  Unfortunately I hit it with a very big hammer
> (flush_cache_all) ... I am hoping someone more familiar with the
> caches will suggest a better flush function to use.  I tried to use
> the flush_kernel_dcache_page and flush_dcache_page functions without
> any luck :( 

You're right that a flush_cache_all() isn't going to be acceptable.
However, the patch is to a non-existent file, so I don't really see how
we can help unless you reduce it to a test case like the previous
copytest failures.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
