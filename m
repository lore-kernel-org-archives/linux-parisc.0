From: Kyle McMartin <kyle@mcmartin.ca>
Subject: [parisc-linux] Re: [PATCH] Compat signal fixes for 64-bit parisc.
Date: Mon, 12 Feb 2007 21:18:40 -0500
Message-ID: <20070213021840.GC20686__15703.5382152118$1416624288$gmane$org@athena.road.mcmartin.ca>
References: <119aab440702121814g7fbe0e90tf026c8f75ddd56d3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>,
 Matthew Wilcox <matthew@wil.cx>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440702121814g7fbe0e90tf026c8f75ddd56d3@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Feb 12, 2007 at 09:14:28PM -0500, Carlos O'Donell wrote:
> @@ -505,17 +505,15 @@ asmlinkage long compat_sys_rt_sigqueuein
> 	struct compat_siginfo __user *uinfo)
> {
> 	siginfo_t info;
> +	int ret;
> +	mm_segment_t old_fs = get_fs();
> 
> 	if (copy_siginfo_from_user32(&info, uinfo))
> 		return -EFAULT;
> 
> -	/* Not even root can pretend to send signals from the kernel.
> -	   Nor can they impersonate a kill(), which adds source info.  */
> -	if (info.si_code >= 0)
> -		return -EPERM;
> -	info.si_signo = sig;
> -
> -	/* POSIX.1b doesn't mention process groups.  */
> -	return kill_proc_info(sig, &info, pid);
> +	set_fs (KERNEL_DS);
> +	ret = sys_rt_sigqueueinfo(pid, sig, &info);
> +	set_fs (old_fs);
> +	return ret;
> }
> 

Why? We replicate the code in sys_rt_sigqueueinfo here to avoid the nasty
set_fs/get_fs hacks. See my compat_sys_sysinfo changes for reference.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
