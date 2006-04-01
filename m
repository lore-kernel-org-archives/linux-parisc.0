From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [fuse-devel] Re: [parisc-linux] [PATCH] Fixs to work on ARM
	and PARIC platforms.
Date: Sat, 01 Apr 2006 16:38:04 -0600
Message-ID: <1143931084.3368.18.camel__22459.7846194685$1416624039$gmane$org@mulgrave.il.steeleye.com>
References: <e739902b0604010122tefc6ab5radf8121eea8a3015@mail.gmail.com>
	<1143906395.3368.10.camel@mulgrave.il.steeleye.com>
	<E1FPjJe-0001cw-00@dorka.pomaz.szeredi.hu>
Mime-Version: 1.0
Content-Type: text/plain
Cc: fuse-devel@lists.sourceforge.net,
 parisc-linux@lists.parisc-linux.org
To: Miklos Szeredi <miklos@szeredi.hu>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <E1FPjJe-0001cw-00@dorka.pomaz.szeredi.hu>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, 2006-04-01 at 18:51 +0200, Miklos Szeredi wrote:
> BTW, these seem to be needed for ARM too.  Do you have any idea who I
> should bug about this?  The MAINTAINERS file is far from clear on this
> point.

Erm, not just arm.  The anon page problem looks like it might afflict
other incoherent architectures (like sparc and ppc); it just depends
whether their flush_dcache_page() accidentally flushes anonymous pages
or not.

For arm, it does look like the arm list won't accept postings, so I'd
send patches to Russell King <rmk@arm.linux.org.uk>

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
