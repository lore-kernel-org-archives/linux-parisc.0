From: kyle@mcmartin.ca (Kyle McMartin)
Subject: Re: [parisc-linux] [RFC] head.S merge, take 2
Date: Sun, 8 Aug 2004 16:15:37 -0400
Message-ID: <20040808201537.GA25662@mcmartin.ca>
References: <20040806015554.GA5319@leibniz.int.mcmartin.ca>
	<200408080355.i783tcVg018097@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200408080355.i783tcVg018097@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Aug 07, 2004 at 11:55:37PM -0400, John David Anglin wrote:
> > +#ifdef __LP64__
> > +	stb,ma          %r0,1(%r3)
> > +#else
> >  	stw,ma          %r0,4(%r3)
> > +#endif
> 
> This may not matter much but if you can use a stw for the 32-bit path
> you should also be able to use for __LP64__.
>
I tested this using stw,ma on both 32 and 64 bit, thanks!

> I seems like you may be able to get rid of this difference by making
> the destination register the same in the following hunk:
>
Nod. It cleans up a bit of the following code.

> +       ldo             ASM_PMD_ENTRY*ASM_PMD_ENTRY_SIZE(%r5),%r5
> +#else
> +        ldo             ASM_PGD_ENTRY*ASM_PGD_ENTRY_SIZE(%r4),%r4
> +#endif
> 
I'm not entirely sure. The idea of being able to fold 3 level page
tables over 2 level on 32 bit might work here... I should check to see
if the offsets are the same...

Regards,
-- 
Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
