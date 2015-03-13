From: "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: BUG: non-zero nr_pmds on freeing mm: -1
Date: Fri, 13 Mar 2015 12:29:32 +0200
Message-ID: <20150313102932.GA7251@node.dhcp.inet.fi>
References: <BLU436-SMTP11459F3D9DC424BE50626A797190@phx.gbl>
 <CADjby3WS3cJs2BOmYT4Cdr4i9FncD=BYjrkuQiBH3=VmOndRPw@mail.gmail.com>
 <BLU436-SMTP234E13E9344CBB4D18CEB0D97190@phx.gbl>
 <CAFk90B8ZRnte0K-r8EBacx_WEEEL4fpTLkkVVgj42s1HO6QhFA@mail.gmail.com>
 <BLU436-SMTP233C66DF7A4433DBEA2897997060@phx.gbl>
 <20150312193556.GE587@fuloong-minipc.musicnaut.iki.fi>
 <BLU436-SMTP114E0E2B73148E5EE40047897060@phx.gbl>
 <20150312220756.GA4792@node.dhcp.inet.fi>
 <BLU437-SMTP12BED7F073649D0DDB5D0A97070@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Graham Gower <graham.gower@gmail.com>,
	Domenico Andreoli <cavokz@gmail.com>,
	linux-parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU437-SMTP12BED7F073649D0DDB5D0A97070@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Mar 12, 2015 at 08:41:37PM -0400, John David Anglin wrote:
> On 2015-03-12, at 6:07 PM, Kirill A. Shutemov wrote:
> 
> > There's hack in pgd_alloc() on parisc to initialize one pmd, which is not
> > accounted and we get underflow on exit. We need to adjust accounting for
> > that pmd.
> > 
> > Could you try the patch below?
> > 
> > diff --git a/arch/parisc/include/asm/pgalloc.h b/arch/parisc/include/asm/pgalloc.h
> > index f213f5b4c423..8ee9a0bdc468 100644
> > --- a/arch/parisc/include/asm/pgalloc.h
> > +++ b/arch/parisc/include/asm/pgalloc.h
> > @@ -38,6 +38,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
> > 		/* The first pmd entry also is marked with _PAGE_GATEWAY as
> > 		 * a signal that this pmd may not be freed */
> > 		__pgd_val_set(*pgd, PxD_FLAG_ATTACHED);
> > +		mm_inc_nr_pmds(mm);
> > #endif
> > 	}
> > 	return actual_pgd;
> 
> The patch fixes the BUG messages.
> 
> Helge, the #ifdef in pgd_alloc doesn't seem correct.  We only have a L2/L3 scheme when
> "defined(CONFIG_64BIT) && defined(CONFIG_PARISC_PAGE_SIZE_4KB)".

Looks like you're correct. But that's separate issue. Please, post a
patch.

-- 
 Kirill A. Shutemov
