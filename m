From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] compat_sys_ptrace conversions for parisc
Date: Mon, 25 Aug 2008 18:52:31 +0200
Message-ID: <20080825165231.GA13428@lst.de>
References: <200808242026.06295.deller@gmx.de> <200808242033.25481.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>,
	Roland McGrath <roland@redhat.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200808242033.25481.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This should probably get a little review from Rland, I've added him to
the Cc list.  Although I suspect splitting this into at least two
patches for compat_sys_ptrace vs the rest might make sense.

On Sun, Aug 24, 2008 at 08:33:25PM +0200, Helge Deller wrote:
> This patch does the compat_sys_ptrace conversion for parisc.
> In addition it does convert the parisc ptrace code to use the
> architecture-independent ptrace infrastructure instead of own coding.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/arch/parisc/include/asm/ptrace.h b/arch/parisc/include/asm/ptrace.h
> index 3e94c5d..afa5333 100644
> --- a/arch/parisc/include/asm/ptrace.h
> +++ b/arch/parisc/include/asm/ptrace.h
> @@ -47,6 +47,16 @@ struct pt_regs {
>  
>  #define task_regs(task) ((struct pt_regs *) ((char *)(task) + TASK_REGS))
>  
> +#define __ARCH_WANT_COMPAT_SYS_PTRACE
> +
> +struct task_struct;
> +#define arch_has_single_step()	1
> +void user_disable_single_step(struct task_struct *task);
> +void user_enable_single_step(struct task_struct *task);
> +
> +#define arch_has_block_step()	1
> +void user_enable_block_step(struct task_struct *task);
> +
>  /* XXX should we use iaoq[1] or iaoq[0] ? */
>  #define user_mode(regs)			(((regs)->iaoq[0] & 3) ? 1 : 0)
>  #define user_space(regs)		(((regs)->iasq[1] != 0) ? 1 : 0)
> diff --git a/arch/parisc/kernel/ptrace.c b/arch/parisc/kernel/ptrace.c
> index 49c6379..90904f9 100644
> --- a/arch/parisc/kernel/ptrace.c
> +++ b/arch/parisc/kernel/ptrace.c
> @@ -4,6 +4,7 @@
>   * Copyright (C) 2000 Hewlett-Packard Co, Linuxcare Inc.
>   * Copyright (C) 2000 Matthew Wilcox <matthew@wil.cx>
>   * Copyright (C) 2000 David Huggins-Daines <dhd@debian.org>
> + * Copyright (C) 2008 Helge Deller <deller@gmx.de>
>   */
>  
>  #include <linux/kernel.h>
> @@ -27,15 +28,149 @@
>  /* PSW bits we allow the debugger to modify */
>  #define USER_PSW_BITS	(PSW_N | PSW_V | PSW_CB)
>  
> -#undef DEBUG_PTRACE
> +/*
> + * Called by kernel/ptrace.c when detaching..
> + *
> + * Make sure single step bits etc are not set.
> + */
> +void ptrace_disable(struct task_struct *task)
> +{
> +	task->ptrace &= ~(PT_SINGLESTEP|PT_BLOCKSTEP);
>  
> -#ifdef DEBUG_PTRACE
> -#define DBG(x...)	printk(x)
> -#else
> -#define DBG(x...)
> -#endif
> +	/* make sure the trap bits are not set */
> +	pa_psw(task)->r = 0;
> +	pa_psw(task)->t = 0;
> +	pa_psw(task)->h = 0;
> +	pa_psw(task)->l = 0;
> +}
> +
> +/*
> + * The following functions are called by ptrace_resume() when
> + * enabling or disabling single/block tracing.
> + */
> +void user_disable_single_step(struct task_struct *task)
> +{
> +	ptrace_disable(task);
> +}
> +
> +void user_enable_single_step(struct task_struct *task)
> +{
> +	task->ptrace &= ~PT_BLOCKSTEP;
> +	task->ptrace |= PT_SINGLESTEP;
> +
> +	if (pa_psw(task)->n) {
> +		struct siginfo si;
> +
> +		/* Nullified, just crank over the queue. */
> +		task_regs(task)->iaoq[0] = task_regs(task)->iaoq[1];
> +		task_regs(task)->iasq[0] = task_regs(task)->iasq[1];
> +		task_regs(task)->iaoq[1] = task_regs(task)->iaoq[0] + 4;
> +		pa_psw(task)->n = 0;
> +		pa_psw(task)->x = 0;
> +		pa_psw(task)->y = 0;
> +		pa_psw(task)->z = 0;
> +		pa_psw(task)->b = 0;
> +		ptrace_disable(task);
> +		/* Don't wake up the task, but let the
> +		   parent know something happened. */
> +		si.si_code = TRAP_TRACE;
> +		si.si_addr = (void __user *) (task_regs(task)->iaoq[0] & ~3);
> +		si.si_signo = SIGTRAP;
> +		si.si_errno = 0;
> +		force_sig_info(SIGTRAP, &si, task);
> +		/* notify_parent(task, SIGCHLD); */
> +		return;
> +	}
> +
> +	/* Enable recovery counter traps.  The recovery counter
> +	 * itself will be set to zero on a task switch.  If the
> +	 * task is suspended on a syscall then the syscall return
> +	 * path will overwrite the recovery counter with a suitable
> +	 * value such that it traps once back in user space.  We
> +	 * disable interrupts in the tasks PSW here also, to avoid
> +	 * interrupts while the recovery counter is decrementing.
> +	 */
> +	pa_psw(task)->r = 1;
> +	pa_psw(task)->t = 0;
> +	pa_psw(task)->h = 0;
> +	pa_psw(task)->l = 0;
> +}
> +
> +void user_enable_block_step(struct task_struct *task)
> +{
> +	task->ptrace &= ~PT_SINGLESTEP;
> +	task->ptrace |= PT_BLOCKSTEP;
> +
> +	/* Enable taken branch trap. */
> +	pa_psw(task)->r = 0;
> +	pa_psw(task)->t = 1;
> +	pa_psw(task)->h = 0;
> +	pa_psw(task)->l = 0;
> +}
> +
> +long arch_ptrace(struct task_struct *child, long request, long addr, long data)
> +{
> +	unsigned long tmp;
> +	long ret = -EIO;
>  
> -#ifdef CONFIG_64BIT
> +	switch (request) {
> +
> +	/* Read the word at location addr in the USER area.  For ptraced
> +	   processes, the kernel saves all regs on a syscall. */
> +	case PTRACE_PEEKUSR:
> +		if ((addr & (sizeof(long)-1)) ||
> +		    (unsigned long) addr >= sizeof(struct pt_regs))
> +			break;
> +		tmp = *(unsigned long *) ((char *) task_regs(child) + addr);
> +		ret = put_user(tmp, (unsigned long *) data);
> +		break;
> +
> +	/* Write the word at location addr in the USER area.  This will need
> +	   to change when the kernel no longer saves all regs on a syscall.
> +	   FIXME.  There is a problem at the moment in that r3-r18 are only
> +	   saved if the process is ptraced on syscall entry, and even then
> +	   those values are overwritten by actual register values on syscall
> +	   exit. */
> +	case PTRACE_POKEUSR:
> +		/* Some register values written here may be ignored in
> +		 * entry.S:syscall_restore_rfi; e.g. iaoq is written with
> +		 * r31/r31+4, and not with the values in pt_regs.
> +		 */
> +		if (addr == PT_PSW) {
> +			/* Allow writing to Nullify, Divide-step-correction,
> +			 * and carry/borrow bits.
> +			 * BEWARE, if you set N, and then single step, it won't
> +			 * stop on the nullified instruction.
> +			 */
> +			data &= USER_PSW_BITS;
> +			task_regs(child)->gr[0] &= ~USER_PSW_BITS;
> +			task_regs(child)->gr[0] |= data;
> +			ret = 0;
> +			break;
> +		}
> +
> +		if ((addr & (sizeof(long)-1)) ||
> +		    (unsigned long) addr >= sizeof(struct pt_regs))
> +			break;
> +		if ((addr >= PT_GR1 && addr <= PT_GR31) ||
> +				addr == PT_IAOQ0 || addr == PT_IAOQ1 ||
> +				(addr >= PT_FR0 && addr <= PT_FR31 + 4) ||
> +				addr == PT_SAR) {
> +			*(unsigned long *) ((char *) task_regs(child) + addr) = data;
> +			ret = 0;
> +		}
> +		break;
> +
> +	default:
> +		ret = ptrace_request(child, request, addr, data);
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +
> +#ifdef CONFIG_COMPAT
>  
>  /* This function is needed to translate 32 bit pt_regs offsets in to
>   * 64 bit pt_regs offsets.  For example, a 32 bit gdb under a 64 bit kernel
> @@ -61,106 +196,25 @@ static long translate_usr_offset(long offset)
>  	else
>  		return -1;
>  }
> -#endif
>  
> -/*
> - * Called by kernel/ptrace.c when detaching..
> - *
> - * Make sure single step bits etc are not set.
> - */
> -void ptrace_disable(struct task_struct *child)
> +long compat_arch_ptrace(struct task_struct *child, compat_long_t request,
> +			compat_ulong_t addr, compat_ulong_t data)
>  {
> -	/* make sure the trap bits are not set */
> -	pa_psw(child)->r = 0;
> -	pa_psw(child)->t = 0;
> -	pa_psw(child)->h = 0;
> -	pa_psw(child)->l = 0;
> -}
> -
> -long arch_ptrace(struct task_struct *child, long request, long addr, long data)
> -{
> -	long ret;
> -#ifdef DEBUG_PTRACE
> -	long oaddr=addr, odata=data;
> -#endif
> +	compat_uint_t tmp;
> +	long ret = -EIO;
>  
>  	switch (request) {
> -	case PTRACE_PEEKTEXT: /* read word at location addr. */ 
> -	case PTRACE_PEEKDATA: {
> -#ifdef CONFIG_64BIT
> -		if (__is_compat_task(child)) {
> -			int copied;
> -			unsigned int tmp;
> -
> -			addr &= 0xffffffffL;
> -			copied = access_process_vm(child, addr, &tmp, sizeof(tmp), 0);
> -			ret = -EIO;
> -			if (copied != sizeof(tmp))
> -				goto out_tsk;
> -			ret = put_user(tmp,(unsigned int *) data);
> -			DBG("sys_ptrace(PEEK%s, %d, %lx, %lx) returning %ld, data %x\n",
> -				request == PTRACE_PEEKTEXT ? "TEXT" : "DATA",
> -				pid, oaddr, odata, ret, tmp);
> -		}
> -		else
> -#endif
> -			ret = generic_ptrace_peekdata(child, addr, data);
> -		goto out_tsk;
> -	}
>  
> -	/* when I and D space are separate, this will have to be fixed. */
> -	case PTRACE_POKETEXT: /* write the word at location addr. */
> -	case PTRACE_POKEDATA:
> -		ret = 0;
> -#ifdef CONFIG_64BIT
> -		if (__is_compat_task(child)) {
> -			unsigned int tmp = (unsigned int)data;
> -			DBG("sys_ptrace(POKE%s, %d, %lx, %lx)\n",
> -				request == PTRACE_POKETEXT ? "TEXT" : "DATA",
> -				pid, oaddr, odata);
> -			addr &= 0xffffffffL;
> -			if (access_process_vm(child, addr, &tmp, sizeof(tmp), 1) == sizeof(tmp))
> -				goto out_tsk;
> -		}
> -		else
> -#endif
> -		{
> -			if (access_process_vm(child, addr, &data, sizeof(data), 1) == sizeof(data))
> -				goto out_tsk;
> -		}
> -		ret = -EIO;
> -		goto out_tsk;
> -
> -	/* Read the word at location addr in the USER area.  For ptraced
> -	   processes, the kernel saves all regs on a syscall. */
> -	case PTRACE_PEEKUSR: {
> -		ret = -EIO;
> -#ifdef CONFIG_64BIT
> -		if (__is_compat_task(child)) {
> -			unsigned int tmp;
> -
> -			if (addr & (sizeof(int)-1))
> -				goto out_tsk;
> -			if ((addr = translate_usr_offset(addr)) < 0)
> -				goto out_tsk;
> -
> -			tmp = *(unsigned int *) ((char *) task_regs(child) + addr);
> -			ret = put_user(tmp, (unsigned int *) data);
> -			DBG("sys_ptrace(PEEKUSR, %d, %lx, %lx) returning %ld, addr %lx, data %x\n",
> -				pid, oaddr, odata, ret, addr, tmp);
> -		}
> -		else
> -#endif
> -		{
> -			unsigned long tmp;
> +	case PTRACE_PEEKUSR:
> +		if (addr & (sizeof(compat_uint_t)-1))
> +			break;
> +		addr = translate_usr_offset(addr);
> +		if (addr < 0)
> +			break;
>  
> -			if ((addr & (sizeof(long)-1)) || (unsigned long) addr >= sizeof(struct pt_regs))
> -				goto out_tsk;
> -			tmp = *(unsigned long *) ((char *) task_regs(child) + addr);
> -			ret = put_user(tmp, (unsigned long *) data);
> -		}
> -		goto out_tsk;
> -	}
> +		tmp = *(compat_uint_t *) ((char *) task_regs(child) + addr);
> +		ret = put_user(tmp, (compat_uint_t *) (unsigned long) data);
> +		break;
>  
>  	/* Write the word at location addr in the USER area.  This will need
>  	   to change when the kernel no longer saves all regs on a syscall.
> @@ -169,185 +223,46 @@ long arch_ptrace(struct task_struct *child, long request, long addr, long data)
>  	   those values are overwritten by actual register values on syscall
>  	   exit. */
>  	case PTRACE_POKEUSR:
> -		ret = -EIO;
>  		/* Some register values written here may be ignored in
>  		 * entry.S:syscall_restore_rfi; e.g. iaoq is written with
>  		 * r31/r31+4, and not with the values in pt_regs.
>  		 */
> -		 /* PT_PSW=0, so this is valid for 32 bit processes under 64
> -		 * bit kernels.
> -		 */
>  		if (addr == PT_PSW) {
> -			/* PT_PSW=0, so this is valid for 32 bit processes
> -			 * under 64 bit kernels.
> -			 *
> -			 * Allow writing to Nullify, Divide-step-correction,
> -			 * and carry/borrow bits.
> -			 * BEWARE, if you set N, and then single step, it won't
> -			 * stop on the nullified instruction.
> +			/* Since PT_PSW==0, it is valid for 32 bit processes
> +			 * under 64 bit kernels as well.
>  			 */
> -			DBG("sys_ptrace(POKEUSR, %d, %lx, %lx)\n",
> -				pid, oaddr, odata);
> -			data &= USER_PSW_BITS;
> -			task_regs(child)->gr[0] &= ~USER_PSW_BITS;
> -			task_regs(child)->gr[0] |= data;
> -			ret = 0;
> -			goto out_tsk;
> -		}
> -#ifdef CONFIG_64BIT
> -		if (__is_compat_task(child)) {
> -			if (addr & (sizeof(int)-1))
> -				goto out_tsk;
> -			if ((addr = translate_usr_offset(addr)) < 0)
> -				goto out_tsk;
> -			DBG("sys_ptrace(POKEUSR, %d, %lx, %lx) addr %lx\n",
> -				pid, oaddr, odata, addr);
> +			ret = arch_ptrace(child, request, addr, data);
> +		} else {
> +			if (addr & (sizeof(compat_uint_t)-1))
> +				break;
> +			addr = translate_usr_offset(addr);
> +			if (addr < 0)
> +				break;
>  			if (addr >= PT_FR0 && addr <= PT_FR31 + 4) {
>  				/* Special case, fp regs are 64 bits anyway */
> -				*(unsigned int *) ((char *) task_regs(child) + addr) = data;
> +				*(__u64 *) ((char *) task_regs(child) + addr) = data;
>  				ret = 0;
>  			}
>  			else if ((addr >= PT_GR1+4 && addr <= PT_GR31+4) ||
>  					addr == PT_IAOQ0+4 || addr == PT_IAOQ1+4 ||
>  					addr == PT_SAR+4) {
>  				/* Zero the top 32 bits */
> -				*(unsigned int *) ((char *) task_regs(child) + addr - 4) = 0;
> -				*(unsigned int *) ((char *) task_regs(child) + addr) = data;
> +				*(__u32 *) ((char *) task_regs(child) + addr - 4) = 0;
> +				*(__u32 *) ((char *) task_regs(child) + addr) = data;
>  				ret = 0;
>  			}
> -			goto out_tsk;
>  		}
> -		else
> -#endif
> -		{
> -			if ((addr & (sizeof(long)-1)) || (unsigned long) addr >= sizeof(struct pt_regs))
> -				goto out_tsk;
> -			if ((addr >= PT_GR1 && addr <= PT_GR31) ||
> -					addr == PT_IAOQ0 || addr == PT_IAOQ1 ||
> -					(addr >= PT_FR0 && addr <= PT_FR31 + 4) ||
> -					addr == PT_SAR) {
> -				*(unsigned long *) ((char *) task_regs(child) + addr) = data;
> -				ret = 0;
> -			}
> -			goto out_tsk;
> -		}
> -
> -	case PTRACE_SYSCALL: /* continue and stop at next (return from) syscall */
> -	case PTRACE_CONT:
> -		ret = -EIO;
> -		DBG("sys_ptrace(%s)\n",
> -			request == PTRACE_SYSCALL ? "SYSCALL" : "CONT");
> -		if (!valid_signal(data))
> -			goto out_tsk;
> -		child->ptrace &= ~(PT_SINGLESTEP|PT_BLOCKSTEP);
> -		if (request == PTRACE_SYSCALL) {
> -			set_tsk_thread_flag(child, TIF_SYSCALL_TRACE);
> -		} else {
> -			clear_tsk_thread_flag(child, TIF_SYSCALL_TRACE);
> -		}		
> -		child->exit_code = data;
> -		goto out_wake_notrap;
> -
> -	case PTRACE_KILL:
> -		/*
> -		 * make the child exit.  Best I can do is send it a
> -		 * sigkill.  perhaps it should be put in the status
> -		 * that it wants to exit.
> -		 */
> -		ret = 0;
> -		DBG("sys_ptrace(KILL)\n");
> -		if (child->exit_state == EXIT_ZOMBIE)	/* already dead */
> -			goto out_tsk;
> -		child->exit_code = SIGKILL;
> -		goto out_wake_notrap;
> -
> -	case PTRACE_SINGLEBLOCK:
> -		DBG("sys_ptrace(SINGLEBLOCK)\n");
> -		ret = -EIO;
> -		if (!valid_signal(data))
> -			goto out_tsk;
> -		clear_tsk_thread_flag(child, TIF_SYSCALL_TRACE);
> -		child->ptrace &= ~PT_SINGLESTEP;
> -		child->ptrace |= PT_BLOCKSTEP;
> -		child->exit_code = data;
> -
> -		/* Enable taken branch trap. */
> -		pa_psw(child)->r = 0;
> -		pa_psw(child)->t = 1;
> -		pa_psw(child)->h = 0;
> -		pa_psw(child)->l = 0;
> -		goto out_wake;
> -
> -	case PTRACE_SINGLESTEP:
> -		DBG("sys_ptrace(SINGLESTEP)\n");
> -		ret = -EIO;
> -		if (!valid_signal(data))
> -			goto out_tsk;
> -
> -		clear_tsk_thread_flag(child, TIF_SYSCALL_TRACE);
> -		child->ptrace &= ~PT_BLOCKSTEP;
> -		child->ptrace |= PT_SINGLESTEP;
> -		child->exit_code = data;
> -
> -		if (pa_psw(child)->n) {
> -			struct siginfo si;
> -
> -			/* Nullified, just crank over the queue. */
> -			task_regs(child)->iaoq[0] = task_regs(child)->iaoq[1];
> -			task_regs(child)->iasq[0] = task_regs(child)->iasq[1];
> -			task_regs(child)->iaoq[1] = task_regs(child)->iaoq[0] + 4;
> -			pa_psw(child)->n = 0;
> -			pa_psw(child)->x = 0;
> -			pa_psw(child)->y = 0;
> -			pa_psw(child)->z = 0;
> -			pa_psw(child)->b = 0;
> -			ptrace_disable(child);
> -			/* Don't wake up the child, but let the
> -			   parent know something happened. */
> -			si.si_code = TRAP_TRACE;
> -			si.si_addr = (void __user *) (task_regs(child)->iaoq[0] & ~3);
> -			si.si_signo = SIGTRAP;
> -			si.si_errno = 0;
> -			force_sig_info(SIGTRAP, &si, child);
> -			//notify_parent(child, SIGCHLD);
> -			//ret = 0;
> -			goto out_wake;
> -		}
> -
> -		/* Enable recovery counter traps.  The recovery counter
> -		 * itself will be set to zero on a task switch.  If the
> -		 * task is suspended on a syscall then the syscall return
> -		 * path will overwrite the recovery counter with a suitable
> -		 * value such that it traps once back in user space.  We
> -		 * disable interrupts in the childs PSW here also, to avoid
> -		 * interrupts while the recovery counter is decrementing.
> -		 */
> -		pa_psw(child)->r = 1;
> -		pa_psw(child)->t = 0;
> -		pa_psw(child)->h = 0;
> -		pa_psw(child)->l = 0;
> -		/* give it a chance to run. */
> -		goto out_wake;
> -
> -	case PTRACE_GETEVENTMSG:
> -                ret = put_user(child->ptrace_message, (unsigned int __user *) data);
> -		goto out_tsk;
> +		break;
>  
>  	default:
> -		ret = ptrace_request(child, request, addr, data);
> -		goto out_tsk;
> +		ret = compat_ptrace_request(child, request, addr, data);
> +		break;
>  	}
>  
> -out_wake_notrap:
> -	ptrace_disable(child);
> -out_wake:
> -	wake_up_process(child);
> -	ret = 0;
> -out_tsk:
> -	DBG("arch_ptrace(%ld, %d, %lx, %lx) returning %ld\n",
> -		request, pid, oaddr, odata, ret);
>  	return ret;
>  }
> +#endif
> +
>  
>  void syscall_trace(void)
>  {
> diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
> index 6b5ac38..e719f27 100644
> --- a/arch/parisc/kernel/syscall_table.S
> +++ b/arch/parisc/kernel/syscall_table.S
> @@ -87,7 +87,7 @@
>  	ENTRY_SAME(setuid)
>  	ENTRY_SAME(getuid)
>  	ENTRY_COMP(stime)		/* 25 */
> -	ENTRY_SAME(ptrace)
> +	ENTRY_COMP(ptrace)
>  	ENTRY_SAME(alarm)
>  	/* see stat comment */
>  	ENTRY_COMP(newfstat)
---end quoted text---
