From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] [PATCH] Fixs to work on ARM and PARIC platforms.
Date: Sat, 01 Apr 2006 09:46:35 -0600
Message-ID: <1143906395.3368.10.camel__21941.4684958339$1416624038$gmane$org@mulgrave.il.steeleye.com>
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
> --- fuse-2.6.0-pre2/kernel/dev.c.orig   2006-04-01 00:40:28.000000000
> -0800
> +++ fuse-2.6.0-pre2/kernel/dev.c        2006-04-01 00:40:43.000000000
> -0800

Is this path just wrong and you meant fs/fuse/dev.c?

In which case, the placement of the flush and the fact that
flush_dcache_page() doesn't bring coherency indicates one of the input
pages is incoherent at the user level.  So it looks like you have an
anonymous page you haven't called get_user_pages() on .... and by the
way, you have checked that you're actually using the kernel with the
parisc implementations of flush_kernel_dcache_page() and
flush_anon_page()?

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
