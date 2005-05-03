From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] Re: traps, unwind new patch proposal.
Date: Tue, 3 May 2005 02:30:52 -0700
Message-ID: <20050503093052.GF21760@tausq.org>
References: <4274E6C8.9020704@tiscali.be>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4274E6C8.9020704@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Joel,

> Here is my new proposal to attempt to fix the show_stack() bug in the early 
> boot stage:

Can you explain again what is the problem you are seeing? Is it because
of stack overflow? calls to kmalloc()?

> +struct unwind_frame_regs {
> +       unsigned long sp, ip, rp, r31;
> +};

this is better, although i am still not very clear why we can't just use
pt_regs.

> +#define UFI_REGS_BUF_MAX       128     /* about 4k for LP64 */
> +extern struct unwind_frame_regs ufi_regs_buf[UFI_REGS_BUF_MAX];
> +extern unsigned int ufi_regs_buf_i;

this seems to be used to handle recursive calls to show_stack(), is that
right? why do we want to call show_stack() recursively?

i'm not sure why you want to put this array as a global variable. what's
wrong with putting it on the stack of show_stack()?

> +#if 0   /* FIXME: not used */
>  void unwind_frame_init_running(struct unwind_frame_info *info, struct 
>  pt_regs *regs);
> +#endif

please fix this. this function is useful e.g. for kdb.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
