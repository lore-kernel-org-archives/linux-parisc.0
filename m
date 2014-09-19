From: Aaron Tomlin <atomlin@redhat.com>
Subject: Re: [PATCH] Fix end_of_stack() fn and location of stack canary for
 archs using STACK_GROWSUP
Date: Fri, 19 Sep 2014 14:34:15 +0100
Message-ID: <20140919133415.GG25400@atomlin.usersys.redhat.com>
References: <20140916023736.49db964e@as>
 <541C11C1.2060105@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: Chuck Ebbert <cebbert.lkml@gmail.com>,
	Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-metag <linux-metag@vger.kernel.org>,
	James Hogan <james.hogan@imgtec.com>
To: mingo@kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <541C11C1.2060105@imgtec.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Sep 19, 2014 at 12:21:37PM +0100, James Hogan wrote:
> Hi Chuck,
> 
> On 16/09/14 08:37, Chuck Ebbert wrote:
> >  static inline unsigned long *end_of_stack(struct task_struct *p)
> >  {
> > +#ifdef CONFIG_STACK_GROWSUP
> > +	return (unsigned long *)((unsigned long)task_thread_info(p) + THREAD_SIZE) - 1;
> 
> Nit: this line should probably be wrapped to 80 columns.
> 
> Other than that, I've tested this on metag and can confirm that it fixes
> the following BUG which you would otherwise get during boot with Aaron's
> patches:
> 
> BUG: failure at kernel/sched/core.c:2664/schedule_debug()!
> Kernel panic - not syncing: BUG!
> 
> Tested-by: James Hogan <james.hogan@imgtec.com> [metag]
> Acked-by: James Hogan <james.hogan@imgtec.com>

OK.

Acked-by: Aaron Tomlin <atomlin@redhat.com>

> Aaron: please can you try to get this patch applied before your patch
> series.

Ingo,


I hope it's not too late to get this patch in (once the nit has been
addressed) for CONFIG_STACK_GROWSUP?

Regards,

-- 
Aaron Tomlin
