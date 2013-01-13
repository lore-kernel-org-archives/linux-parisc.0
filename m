From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: Purge existing TLB entries in set_pte_at and
 ptep_set_wrprotect
Date: Sun, 13 Jan 2013 22:59:39 +0000
Message-ID: <1358117979.2284.6.camel@dabdike.int.hansenpartnership.com>
References: <BLU0-SMTP6386DBEA3C99F954FD63F7972F0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc List <linux-parisc@vger.kernel.org>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP6386DBEA3C99F954FD63F7972F0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2013-01-13 at 16:52 -0500, John David Anglin wrote:

> +void purge_tlb_entries(struct mm_struct *mm, unsigned long addr)
> +{
> +       unsigned long flags, sid;
> +
> +       /* Note: purge_tlb_entries can be called at startup with
> +          no context.  */
> +
> +       /* Disable preemption while we play with %sr1.  */
> +       preempt_disable();
> +       sid = mfsp(1);
> 
There's no need at all to save and restore %sr1 is there?  It's defined
to be a volatile register.  As long as you make sure nothing gets in to
change its value, you never need to restore the previous one.

James
> 
> +       mtsp(mm->context,1);
> +       purge_tlb_start(flags);
> +       pdtlb(addr);
> +       pitlb(addr);
> +       purge_tlb_end(flags);
> +       mtsp(sid,1);
> +       preempt_enable();
> +}

