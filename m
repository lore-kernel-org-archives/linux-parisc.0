From: "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: BUG: non-zero nr_pmds on freeing mm: -1
Date: Fri, 13 Mar 2015 00:07:56 +0200
Message-ID: <20150312220756.GA4792@node.dhcp.inet.fi>
References: <BLU436-SMTP11459F3D9DC424BE50626A797190@phx.gbl>
 <CADjby3WS3cJs2BOmYT4Cdr4i9FncD=BYjrkuQiBH3=VmOndRPw@mail.gmail.com>
 <BLU436-SMTP234E13E9344CBB4D18CEB0D97190@phx.gbl>
 <CAFk90B8ZRnte0K-r8EBacx_WEEEL4fpTLkkVVgj42s1HO6QhFA@mail.gmail.com>
 <BLU436-SMTP233C66DF7A4433DBEA2897997060@phx.gbl>
 <20150312193556.GE587@fuloong-minipc.musicnaut.iki.fi>
 <BLU436-SMTP114E0E2B73148E5EE40047897060@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Graham Gower <graham.gower@gmail.com>,
	Domenico Andreoli <cavokz@gmail.com>,
	linux-parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU436-SMTP114E0E2B73148E5EE40047897060@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Mar 12, 2015 at 03:51:11PM -0400, John David Anglin wrote:
> On 2015-03-12 3:35 PM, Aaro Koskinen wrote:
> >Hi,
> >
> >On Wed, Mar 11, 2015 at 08:21:35PM -0400, John David Anglin wrote:
> >>On 2015-03-11, at 7:31 PM, Graham Gower wrote:
> >>>I thought this patch was supposed to address the problem?
> >>>https://lkml.org/lkml/2015/2/26/230
> >>>
> >>>However, its not fixed it for me either in 4.0.0-rc3.
> >>I doubt the patch is correct for parisc. I believe the system where
> >>I saw the BUG messages has PT_NLEVELS == 3.
> >For 32-bit kernels, the fix helped.
> 32-bit kernels have PT_NLEVELS == 2.  I think the define needs to be moved
> outside #if/#endif
> but didn't get a chance to test last night.

There's hack in pgd_alloc() on parisc to initialize one pmd, which is not
accounted and we get underflow on exit. We need to adjust accounting for
that pmd.

Could you try the patch below?

diff --git a/arch/parisc/include/asm/pgalloc.h b/arch/parisc/include/asm/pgalloc.h
index f213f5b4c423..8ee9a0bdc468 100644
--- a/arch/parisc/include/asm/pgalloc.h
+++ b/arch/parisc/include/asm/pgalloc.h
@@ -38,6 +38,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 		/* The first pmd entry also is marked with _PAGE_GATEWAY as
 		 * a signal that this pmd may not be freed */
 		__pgd_val_set(*pgd, PxD_FLAG_ATTACHED);
+		mm_inc_nr_pmds(mm);
 #endif
 	}
 	return actual_pgd;
-- 
 Kirill A. Shutemov
