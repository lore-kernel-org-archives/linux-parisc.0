Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id C6FC048B4
	for <parisc-linux@parisc-linux.org>; Sun, 31 Aug 2003 12:52:26 -0600 (MDT)
Date: Sun, 31 Aug 2003 11:56:49 -0700
From: Randolph Chung <randolph@tausq.org>
To: ron@rongage.org
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] [ron@rongage.org: [Patchbomb] - Copy_to/from_user audit - parisc -RESEND]
Message-ID: <20030831185649.GI10510@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20030831154210.GY13467@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030831154210.GY13467@parcelfarce.linux.theplanet.co.uk>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> This patch catches insures proper return values from 
> copy_to/from_user calls.

um, some of these are not quite correct.

> +++ linux-2.6.0-test4-patched/arch/parisc/kernel/signal32.c	2003-08-29 21:38:02.000000000 -0400
> @@ -38,7 +38,7 @@
>  	if (sz != sizeof *set) panic("put_sigset32()");
>  	sigset_64to32(&s, set);
>  
> -	return copy_to_user(up, &s, sizeof s);
> +	return copy_to_user(up, &s, sizeof s) ? -EFAULT : 0 ;
>  }

this one is for put_sigset32, which is used like this:

        if (!ret && oset && put_sigset32(oset, &old_set, sigsetsize))
                return -EFAULT;

so your patch is not needed.

> --- linux-2.6.0-test4/arch/parisc/kernel/sys_parisc32.c	2003-08-22 19:54:17.000000000 -0400
> +++ linux-2.6.0-test4-patched/arch/parisc/kernel/sys_parisc32.c	2003-08-29 21:36:59.000000000 -0400
> @@ -370,7 +370,7 @@
>  	struct compat_timeval t32;
>  	t32.tv_sec = t->tv_sec;
>  	t32.tv_usec = t->tv_usec;
> -	return copy_to_user(u, &t32, sizeof t32);
> +	return copy_to_user(u, &t32, sizeof t32) ? -EFAULT : 0 ;
>  }

this one is similar.

>  static int
> diff -urN linux-2.6.0-test4/arch/parisc/kernel/sys_parisc.c linux-2.6.0-test4-patched/arch/parisc/kernel/sys_parisc.c
> --- linux-2.6.0-test4/arch/parisc/kernel/sys_parisc.c	2003-08-22 19:59:03.000000000 -0400
> +++ linux-2.6.0-test4-patched/arch/parisc/kernel/sys_parisc.c	2003-08-29 21:36:06.000000000 -0400
> @@ -271,7 +271,7 @@
>  	tbuf.shm_cpid = sbuf->shm_cpid;
>  	tbuf.shm_lpid = sbuf->shm_lpid;
>  	tbuf.shm_nattch = sbuf->shm_nattch;
> -	return copy_to_user(buf, &tbuf, sizeof tbuf);
> +	return copy_to_user(buf, &tbuf, sizeof tbuf) ? -EFAULT : 0;
>  }
>  
>  int sys_msgctl_broken(int msqid, int cmd, struct msqid_ds *buf)

this one seems correct. i'll apply it to the parisc tree.

thx
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
