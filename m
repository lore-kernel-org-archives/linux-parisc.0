Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id BCF22483E
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Nov 2003 13:41:18 -0700 (MST)
Message-ID: <3FB1496B.1080504@tiscali.be>
Date: Tue, 11 Nov 2003 20:41:15 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	Randolph Chung <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] what's up with the ipc syscalls?
References: <20031101082451.GJ28967@tausq.org> <20031102180150.GA14554@solo.franken.de> <20031102181252.GY28967@tausq.org> <20031102214200.GA5299@solo.franken.de> <20031102225626.GF26916@systemhalted> <20031103085601.GA9083@solo.franken.de> <20031103214119.GD778@systemhalted> <20031110234414.GA27527@solo.franken.de>
In-Reply-To: <20031110234414.GA27527@solo.franken.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
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


Thomas Bogendoerfer wrote:
> On Mon, Nov 03, 2003 at 04:41:19PM -0500, Carlos O'Donell wrote:
> 
>>On Mon, Nov 03, 2003 at 09:56:01AM +0100, Thomas Bogendoerfer wrote:
> 
> [ stuff about broken ipc syscalls in 2.6 ...]
> 
> I had some thoughts about the conversion stuff, I've added to work
> around problems introduced because of the change of some structures in
> glibc/kernel. I finally realized, that these conversion only works,
> if the "old glibc" is still installed together with the old binary.
> That's because the newer glibcs don't set the IPC_64 bit when doing 
> the syscall, but the old binary still uses the wrong structs, so the
> conversion routine never triggers. I think it's really time to remove that
> crap. Below is an compiled but not booted patch, which removes it and also
> forward ports the necessary bits in ipc/util.c from 2.4.

I also reach to compile 2.4 with this patch :).

Can you point me out what should I apply as change to glibc?

Thanks,
	Joel

> 
> If someone also wants to change glibc, feel free. I still think changing
> glibc is a bad idea, because this new glibc won't work with a current 2.4
> kernel.
> 
> Thomas.
> 
> 
> Index: arch/parisc/kernel/sys_parisc.c
> ===================================================================
> RCS file: /home/cvs/parisc/linux-2.6/arch/parisc/kernel/sys_parisc.c,v
> retrieving revision 1.15
> diff -u -p -r1.15 sys_parisc.c
> --- arch/parisc/kernel/sys_parisc.c	1 Nov 2003 23:44:02 -0000	1.15
> +++ arch/parisc/kernel/sys_parisc.c	10 Nov 2003 23:17:53 -0000
> @@ -241,108 +241,6 @@ asmlinkage ssize_t parisc_readahead(int 
>  }
>  
>  /*
> - * FIXME, please remove this crap as soon as possible
> - *
> - * This is here to fix up broken glibc structures, 
> - * which are already fixed in newer glibcs
> - */
> -#include <linux/msg.h>
> -#include <linux/sem.h>
> -#include <linux/shm.h>
> -#include "sys32.h"
> -
> -struct broken_ipc_perm
> -{
> -    key_t key;			/* Key.  */
> -    uid_t uid;			/* Owner's user ID.  */
> -    gid_t gid;			/* Owner's group ID.  */
> -    uid_t cuid;			/* Creator's user ID.  */
> -    gid_t cgid;			/* Creator's group ID.  */
> -    unsigned short int mode;		/* Read/write permission.  */
> -    unsigned short int __pad1;
> -    unsigned short int seq;		/* Sequence number.  */
> -    unsigned short int __pad2;
> -    unsigned long int __unused1;
> -    unsigned long int __unused2;
> -};
> -		    
> -struct broken_shmid64_ds {
> -	struct broken_ipc_perm	shm_perm;	/* operation perms */
> -	size_t			shm_segsz;	/* size of segment (bytes) */
> -#ifndef __LP64__
> -	unsigned int		__pad1;
> -#endif
> -	__kernel_time_t		shm_atime;	/* last attach time */
> -#ifndef __LP64__
> -	unsigned int		__pad2;
> -#endif
> -	__kernel_time_t		shm_dtime;	/* last detach time */
> -#ifndef __LP64__
> -	unsigned int		__pad3;
> -#endif
> -	__kernel_time_t		shm_ctime;	/* last change time */
> -	__kernel_pid_t		shm_cpid;	/* pid of creator */
> -	__kernel_pid_t		shm_lpid;	/* pid of last operator */
> -	unsigned int		shm_nattch;	/* no. of current attaches */
> -	unsigned int		__unused1;
> -	unsigned int		__unused2;
> -};
> -
> -static void convert_broken_perm (struct broken_ipc_perm *out, struct ipc64_perm *in)
> -{
> -	out->key  = in->key;
> -	out->uid  = in->uid;
> -	out->gid  = in->gid;
> -	out->cuid = in->cuid;
> -	out->cgid = in->cgid;
> -	out->mode = in->mode;
> -	out->seq  = in->seq;
> -}
> -
> -static int copyout_broken_shmid64(struct broken_shmid64_ds *buf, struct shmid64_ds *sbuf)
> -{
> -	struct broken_shmid64_ds tbuf;
> -	
> -	memset(&tbuf, 0, sizeof tbuf);
> -	convert_broken_perm (&tbuf.shm_perm, &sbuf->shm_perm);
> -	tbuf.shm_segsz = sbuf->shm_segsz;
> -	tbuf.shm_atime = sbuf->shm_atime;
> -	tbuf.shm_dtime = sbuf->shm_dtime;
> -	tbuf.shm_ctime = sbuf->shm_ctime;
> -	tbuf.shm_cpid = sbuf->shm_cpid;
> -	tbuf.shm_lpid = sbuf->shm_lpid;
> -	tbuf.shm_nattch = sbuf->shm_nattch;
> -	return copy_to_user(buf, &tbuf, sizeof tbuf) ? -EFAULT : 0;
> -}
> -
> -int sys_msgctl_broken(int msqid, int cmd, struct msqid_ds *buf)
> -{
> -	return sys_msgctl (msqid, cmd & ~IPC_64, buf);
> -}
> -
> -int sys_semctl_broken(int semid, int semnum, int cmd, union semun arg)
> -{
> -	return sys_semctl (semid, semnum, cmd & ~IPC_64, arg);
> -}
> -
> -int sys_shmctl_broken(int shmid, int cmd, struct shmid64_ds *buf)
> -{
> -	struct shmid64_ds sbuf;
> -	int err;
> -
> -	if (cmd & IPC_64) {
> -		cmd &= ~IPC_64;
> -		if (cmd == IPC_STAT || cmd == SHM_STAT) {
> -			KERNEL_SYSCALL(err, sys_shmctl, shmid, cmd, (struct shmid_ds *)&sbuf);
> -			if (err == 0)
> -				err = copyout_broken_shmid64((struct broken_shmid64_ds *)buf, &sbuf);
> -			return err;
> -		}
> -	}
> -	return sys_shmctl (shmid, cmd, (struct shmid_ds *)buf);
> -}
> -
> -/*
>   * This changes the io permissions bitmap in the current task.
>   */
>  asmlinkage int sys_ioperm(unsigned long from, unsigned long num, int turn_on)
> Index: arch/parisc/kernel/sys_parisc32.c
> ===================================================================
> RCS file: /home/cvs/parisc/linux-2.6/arch/parisc/kernel/sys_parisc32.c,v
> retrieving revision 1.11
> diff -u -p -r1.11 sys_parisc32.c
> --- arch/parisc/kernel/sys_parisc32.c	28 Sep 2003 04:04:52 -0000	1.11
> +++ arch/parisc/kernel/sys_parisc32.c	10 Nov 2003 23:19:00 -0000
> @@ -1352,12 +1352,10 @@ asmlinkage int sys32_lseek(unsigned int 
>  	return sys_lseek(fd, offset, origin);
>  }
>  
> -asmlinkage long sys32_semctl_broken(int semid, int semnum, int cmd, union semun arg)
> +asmlinkage long sys32_semctl(int semid, int semnum, int cmd, union semun arg)
>  {
>          union semun u;
>  	
> -	cmd &= ~IPC_64; /* should be removed together with the _broken suffix */
> -
>          if (cmd == SETVAL) {
>                  /* Ugh.  arg is a union of int,ptr,ptr,ptr, so is 8 bytes.
>                   * The int should be in the first 4, but our argument
> Index: arch/parisc/kernel/syscall_table.S
> ===================================================================
> RCS file: /home/cvs/parisc/linux-2.6/arch/parisc/kernel/syscall_table.S,v
> retrieving revision 1.2
> diff -u -p -r1.2 syscall_table.S
> --- arch/parisc/kernel/syscall_table.S	2 Nov 2003 04:40:50 -0000	1.2
> +++ arch/parisc/kernel/syscall_table.S	10 Nov 2003 23:18:46 -0000
> @@ -260,15 +260,15 @@
>  	ENTRY_COMP(recvmsg)
>  	ENTRY_SAME(semop)		/* 185 */
>  	ENTRY_SAME(semget)
> -	ENTRY_DIFF(semctl_broken)
> +	ENTRY_DIFF(semctl)
>  	ENTRY_DIFF(msgsnd)
>  	ENTRY_DIFF(msgrcv)
>  	ENTRY_SAME(msgget)		/* 190 */
> -	ENTRY_SAME(msgctl_broken)
> +	ENTRY_SAME(msgctl)
>  	ENTRY_SAME(shmat_wrapper)
>  	ENTRY_SAME(shmdt)
>  	ENTRY_SAME(shmget)
> -	ENTRY_SAME(shmctl_broken)	/* 195 */
> +	ENTRY_SAME(shmctl)		/* 195 */
>  	ENTRY_SAME(ni_syscall)		/* streams1 */
>  	ENTRY_SAME(ni_syscall)		/* streams2 */
>  	ENTRY_SAME(lstat64)
> Index: ipc/util.c
> ===================================================================
> RCS file: /home/cvs/parisc/linux-2.6/ipc/util.c,v
> retrieving revision 1.3
> diff -u -p -r1.3 util.c
> --- ipc/util.c	8 Oct 2003 20:53:06 -0000	1.3
> +++ ipc/util.c	10 Nov 2003 23:19:41 -0000
> @@ -509,7 +509,7 @@ int ipc_checkid(struct ipc_ids* ids, str
>  	return 0;
>  }
>  
> -#if !defined(__ia64__) && !defined(__x86_64__)
> +#if !defined(__ia64__) && !defined(__x86_64__) && !defined(__hppa__)
>  
>  /**
>   *	ipc_parse_version	-	IPC call version
> Index: ipc/util.h
> ===================================================================
> RCS file: /home/cvs/parisc/linux-2.6/ipc/util.h,v
> retrieving revision 1.1
> diff -u -p -r1.1 util.h
> --- ipc/util.h	29 Jul 2003 17:02:19 -0000	1.1
> +++ ipc/util.h	10 Nov 2003 23:20:13 -0000
> @@ -56,7 +56,7 @@ int ipc_checkid(struct ipc_ids* ids, str
>  void kernel_to_ipc64_perm(struct kern_ipc_perm *in, struct ipc64_perm *out);
>  void ipc64_perm_to_ipc_perm(struct ipc64_perm *in, struct ipc_perm *out);
>  
> -#if defined(__ia64__) || defined(__x86_64__)
> +#if defined(__ia64__) || defined(__x86_64__) || defined(__hppa__)
>    /* On IA-64, we always use the "64-bit version" of the IPC structures.  */ 
>  # define ipc_parse_version(cmd)	IPC_64
>  #else
