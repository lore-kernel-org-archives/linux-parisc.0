Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.umr.edu (mrelay.cc.umr.edu [131.151.1.89])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5FAF84949
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Oct 2001 10:11:08 -0600 (MDT)
Received: (from nneul@localhost)
	by infinity.cc.umr.edu (8.12.1/8.12.0.Beta7) id f94GB6Sb018107
	for parisc-linux@lists.parisc-linux.org; Thu, 4 Oct 2001 11:11:06 -0500
Date: Thu, 4 Oct 2001 11:11:06 -0500
From: Nathan Neulinger <nneul@umr.edu>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20011004111104.A18052@umr.edu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="zYM0uCDKw75PZbzx"
Subject: [parisc-linux] Small patch to output hpux syscall names
List-ID: <linux-parisc.vger.kernel.org>

--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This causes the printk in sys_hpux.c to output the missing hpux syscall
name when known. Makes it a little easier to see what is unimplemented.

i.e.

Unimplemented HP-UX syscall emulation. Syscall #185 (sigprocmask)
  Args: 2 80014a80 bb002398 bb000da0 bb000da0 bb002398 800154b0
Unimplemented HP-UX syscall emulation. Syscall #185 (sigprocmask)
  Args: 2 bb002398 0 800154b0 bb000da0 44 800154b0
Unimplemented HP-UX syscall emulation. Syscall #155 (lockf)
  Args: 5 2 0 bb000da0 40003960 40003968 2f
Unimplemented HP-UX syscall emulation. Syscall #185 (sigprocmask)
  Args: 2 80014a80 bb002398 bb000da0 bb000da0 bb002398 800154b0

Quick question - I don't suppose there is any way that the sys_hpux.c stuff
could be made into a module? Sure would make debugging wrapper development
a lot easier.

-- Nathan

------------------------------------------------------------
Nathan Neulinger                       EMail:  nneul@umr.edu
University of Missouri - Rolla         Phone: (573) 341-4841
Computing Services                       Fax: (573) 341-4216

--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="syscall-names.diff"

Index: arch/parisc/hpux/sys_hpux.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/hpux/sys_hpux.c,v
retrieving revision 1.9
diff -u -r1.9 sys_hpux.c
--- sys_hpux.c	2001/10/04 11:05:44	1.9
+++ sys_hpux.c	2001/10/04 16:02:37
@@ -342,10 +346,379 @@
 	/* NOTE: sc_num trashes arg8 for the few syscalls that actually
 	 * have a valid 8th argument.
 	 */
+	char *name = NULL;
+
+	switch(sc_num) {
+		case 0: name = "nosys"; break;
+		case 1: name = "exit"; break;
+		case 2: name = "fork"; break;
+		case 3: name = "read"; break;
+		case 4: name = "write"; break;
+		case 5: name = "open"; break;
+		case 6: name = "close"; break;
+		case 7: name = "wait"; break;
+		case 8: name = "creat"; break;
+		case 9: name = "link"; break;
+		case 10: name = "unlink"; break;
+		case 11: name = "execv"; break;
+		case 12: name = "chdir"; break;
+		case 13: name = "time"; break;
+		case 14: name = "mknod"; break;
+		case 15: name = "chmod"; break;
+		case 16: name = "chown"; break;
+		case 17: name = "brk"; break;
+		case 18: name = "lchmod"; break;
+		case 19: name = "lseek"; break;
+		case 20: name = "getpid"; break;
+		case 21: name = "mount"; break;
+		case 22: name = "umount"; break;
+		case 23: name = "setuid"; break;
+		case 24: name = "getuid"; break;
+		case 25: name = "stime"; break;
+		case 26: name = "ptrace"; break;
+		case 27: name = "alarm"; break;
+		case 29: name = "pause"; break;
+		case 30: name = "utime"; break;
+		case 31: name = "stty"; break;
+		case 32: name = "gtty"; break;
+		case 33: name = "access"; break;
+		case 34: name = "nice"; break;
+		case 35: name = "ftime"; break;
+		case 36: name = "sync"; break;
+		case 37: name = "kill"; break;
+		case 38: name = "stat"; break;
+		case 39: name = "setpgrp3"; break;
+		case 40: name = "lstat"; break;
+		case 41: name = "dup"; break;
+		case 42: name = "pipe"; break;
+		case 43: name = "times"; break;
+		case 44: name = "profil"; break;
+		case 45: name = "ki_call"; break;
+		case 46: name = "setgid"; break;
+		case 47: name = "getgid"; break;
+		case 51: name = "acct"; break;
+		case 52: name = "set_userthreadid"; break;
+		case 54: name = "ioctl"; break;
+		case 55: name = "reboot"; break;
+		case 56: name = "symlink"; break;
+		case 57: name = "utssys"; break;
+		case 58: name = "readlink"; break;
+		case 59: name = "execve"; break;
+		case 60: name = "umask"; break;
+		case 61: name = "chroot"; break;
+		case 62: name = "fcntl"; break;
+		case 63: name = "ulimit"; break;
+		case 66: name = "vfork"; break;
+		case 71: name = "mmap"; break;
+		case 73: name = "munmap"; break;
+		case 74: name = "mprotect"; break;
+		case 75: name = "madvise"; break;
+		case 76: name = "vhangup"; break;
+		case 77: name = "swapoff"; break;
+		case 79: name = "getgroups"; break;
+		case 80: name = "setgroups"; break;
+		case 81: name = "getpgrp2"; break;
+		case 82: name = "setpgid/setpgrp2"; break;
+		case 83: name = "setitimer"; break;
+		case 84: name = "wait3"; break;
+		case 85: name = "swapon"; break;
+		case 86: name = "getitimer"; break;
+		case 90: name = "dup2"; break;
+		case 92: name = "fstat"; break;
+		case 93: name = "select"; break;
+		case 95: name = "fsync"; break;
+		case 96: name = "setpriority"; break;
+		case 100: name = "getpriority"; break;
+		case 108: name = "sigvector"; break;
+		case 109: name = "sigblock"; break;
+		case 110: name = "sigsetmask"; break;
+		case 111: name = "sigpause"; break;
+		case 112: name = "sigstack"; break;
+		case 116: name = "gettimeofday"; break;
+		case 117: name = "getrusage"; break;
+		case 120: name = "readv"; break;
+		case 121: name = "writev"; break;
+		case 122: name = "settimeofday"; break;
+		case 123: name = "fchown"; break;
+		case 124: name = "fchmod"; break;
+		case 126: name = "setresuid"; break;
+		case 127: name = "setresgid"; break;
+		case 128: name = "rename"; break;
+		case 129: name = "truncate"; break;
+		case 130: name = "ftruncate"; break;
+		case 132: name = "sysconf"; break;
+		case 136: name = "mkdir"; break;
+		case 137: name = "rmdir"; break;
+		case 139: name = "sigcleanup"; break;
+		case 140: name = "setcore"; break;
+		case 142: name = "gethostid"; break;
+		case 143: name = "sethostid"; break;
+		case 144: name = "getrlimit"; break;
+		case 145: name = "setrlimit"; break;
+		case 148: name = "quotactl"; break;
+		case 149: name = "get_sysinfo"; break;
+		case 151: name = "privgrp"; break;
+		case 152: name = "rtprio"; break;
+		case 153: name = "plock"; break;
+		case 155: name = "lockf"; break;
+		case 156: name = "semget"; break;
+		case 158: name = "semop"; break;
+		case 159: name = "msgget"; break;
+		case 161: name = "msgsnd"; break;
+		case 162: name = "msgrcv"; break;
+		case 163: name = "shmget"; break;
+		case 165: name = "shmat"; break;
+		case 166: name = "shmdt"; break;
+		case 168: name = "csp/nsp_init"; break;
+		case 169: name = "cluster"; break;
+		case 170: name = "mkrnod"; break;
+		case 171: name = "test"; break;
+		case 172: name = "unsp_open"; break;
+		case 174: name = "getcontext"; break;
+		case 175: name = "osetcontext"; break;
+		case 176: name = "bigio"; break;
+		case 177: name = "pipenode"; break;
+		case 178: name = "lsync"; break;
+		case 179: name = "getmachineid"; break;
+		case 180: name = "cnodeid/mysite"; break;
+		case 181: name = "cnodes/sitels"; break;
+		case 182: name = "swapclients"; break;
+		case 183: name = "rmtprocess"; break;
+		case 184: name = "dskless_stats"; break;
+		case 185: name = "sigprocmask"; break;
+		case 186: name = "sigpending"; break;
+		case 187: name = "sigsuspend"; break;
+		case 188: name = "sigaction"; break;
+		case 190: name = "nfssvc"; break;
+		case 191: name = "getfh"; break;
+		case 192: name = "getdomainname"; break;
+		case 193: name = "setdomainname"; break;
+		case 194: name = "async_daemon"; break;
+		case 195: name = "getdirentries"; break;
+		case 196: name = "statfs"; break;
+		case 197: name = "fstatfs"; break;
+		case 198: name = "vfsmount"; break;
+		case 200: name = "waitpid"; break;
+		case 224: name = "sigsetreturn"; break;
+		case 225: name = "sigsetstatemask"; break;
+		case 226: name = "bfactl"; break;
+		case 227: name = "cs"; break;
+		case 228: name = "cds"; break;
+		case 230: name = "pathconf"; break;
+		case 231: name = "fpathconf"; break;
+		case 234: name = "nfs_fcntl"; break;
+		case 235: name = "ogetacl"; break;
+		case 236: name = "ofgetacl"; break;
+		case 237: name = "osetacl"; break;
+		case 238: name = "ofsetacl"; break;
+		case 239: name = "pstat"; break;
+		case 240: name = "getaudid"; break;
+		case 241: name = "setaudid"; break;
+		case 242: name = "getaudproc"; break;
+		case 243: name = "setaudproc"; break;
+		case 244: name = "getevent"; break;
+		case 245: name = "setevent"; break;
+		case 246: name = "audwrite"; break;
+		case 247: name = "audswitch"; break;
+		case 248: name = "audctl"; break;
+		case 249: name = "ogetaccess"; break;
+		case 250: name = "fsctl"; break;
+		case 251: name = "ulconnect"; break;
+		case 252: name = "ulcontrol"; break;
+		case 253: name = "ulcreate"; break;
+		case 254: name = "uldest"; break;
+		case 255: name = "ulrecv"; break;
+		case 256: name = "ulrecvcn"; break;
+		case 257: name = "ulsend"; break;
+		case 258: name = "ulshutdown"; break;
+		case 259: name = "swapfs"; break;
+		case 260: name = "fss"; break;
+		case 267: name = "tsync"; break;
+		case 268: name = "getnumfds"; break;
+		case 269: name = "poll"; break;
+		case 270: name = "getmsg"; break;
+		case 271: name = "putmsg"; break;
+		case 272: name = "fchdir"; break;
+		case 273: name = "getmount_cnt"; break;
+		case 274: name = "getmount_entry"; break;
+		case 275: name = "accept"; break;
+		case 276: name = "bind"; break;
+		case 277: name = "connect"; break;
+		case 278: name = "getpeername"; break;
+		case 279: name = "getsockname"; break;
+		case 280: name = "getsockopt"; break;
+		case 281: name = "listen"; break;
+		case 282: name = "recv"; break;
+		case 283: name = "recvfrom"; break;
+		case 284: name = "recvmsg"; break;
+		case 285: name = "send"; break;
+		case 286: name = "sendmsg"; break;
+		case 287: name = "sendto"; break;
+		case 288: name = "setsockopt"; break;
+		case 289: name = "shutdown"; break;
+		case 290: name = "socket"; break;
+		case 291: name = "socketpair"; break;
+		case 292: name = "proc_open"; break;
+		case 293: name = "proc_close"; break;
+		case 294: name = "proc_send"; break;
+		case 295: name = "proc_recv"; break;
+		case 296: name = "proc_sendrecv"; break;
+		case 297: name = "proc_syscall"; break;
+		case 298: name = "ipccreate"; break;
+		case 299: name = "ipcname"; break;
+		case 300: name = "ipcnamerase"; break;
+		case 301: name = "ipclookup"; break;
+		case 302: name = "ipcselect"; break;
+		case 303: name = "ipcconnect"; break;
+		case 304: name = "ipcrecvcn"; break;
+		case 305: name = "ipcsend"; break;
+		case 306: name = "ipcrecv"; break;
+		case 307: name = "ipcgetnodename"; break;
+		case 308: name = "ipcsetnodename"; break;
+		case 309: name = "ipccontrol"; break;
+		case 310: name = "ipcshutdown"; break;
+		case 311: name = "ipcdest"; break;
+		case 312: name = "semctl"; break;
+		case 313: name = "msgctl"; break;
+		case 314: name = "shmctl"; break;
+		case 315: name = "mpctl"; break;
+		case 316: name = "exportfs"; break;
+		case 317: name = "getpmsg"; break;
+		case 318: name = "putpmsg"; break;
+		case 319: name = "strioctl"; break;
+		case 320: name = "msync"; break;
+		case 321: name = "msleep"; break;
+		case 322: name = "mwakeup"; break;
+		case 323: name = "msem_init"; break;
+		case 324: name = "msem_remove"; break;
+		case 325: name = "adjtime"; break;
+		case 326: name = "kload"; break;
+		case 327: name = "fattach"; break;
+		case 328: name = "fdetach"; break;
+		case 329: name = "serialize"; break;
+		case 330: name = "statvfs"; break;
+		case 331: name = "fstatvfs"; break;
+		case 332: name = "lchown"; break;
+		case 333: name = "getsid"; break;
+		case 334: name = "sysfs"; break;
+		case 337: name = "sched_setparam"; break;
+		case 338: name = "sched_getparam"; break;
+		case 339: name = "sched_setscheduler"; break;
+		case 340: name = "sched_getscheduler"; break;
+		case 341: name = "sched_yield"; break;
+		case 342: name = "sched_get_priority_max"; break;
+		case 343: name = "sched_get_priority_min"; break;
+		case 344: name = "sched_rr_get_interval"; break;
+		case 345: name = "clock_settime"; break;
+		case 346: name = "clock_gettime"; break;
+		case 347: name = "clock_getres"; break;
+		case 348: name = "timer_create"; break;
+		case 349: name = "timer_delete"; break;
+		case 350: name = "timer_settime"; break;
+		case 351: name = "timer_gettime"; break;
+		case 352: name = "timer_getoverrun"; break;
+		case 353: name = "nanosleep"; break;
+		case 354: name = "toolbox"; break;
+		case 356: name = "getdents"; break;
+		case 357: name = "getcontext"; break;
+		case 358: name = "sysinfo"; break;
+		case 359: name = "fcntl64"; break;
+		case 360: name = "ftruncate64"; break;
+		case 361: name = "fstat64"; break;
+		case 362: name = "getdirentries64"; break;
+		case 363: name = "getrlimit64"; break;
+		case 364: name = "lockf64"; break;
+		case 365: name = "lseek64"; break;
+		case 366: name = "lstat64"; break;
+		case 367: name = "mmap64"; break;
+		case 368: name = "setrlimit64"; break;
+		case 369: name = "stat64"; break;
+		case 370: name = "truncate64"; break;
+		case 371: name = "ulimit64"; break;
+		case 380: name = "setcontext"; break;
+		case 381: name = "sigaltstack"; break;
+		case 382: name = "waitid"; break;
+		case 383: name = "setpgrp"; break;
+		case 384: name = "recvmsg2"; break;
+		case 385: name = "sendmsg2"; break;
+		case 386: name = "socket2"; break;
+		case 387: name = "socketpair2"; break;
+		case 388: name = "setregid"; break;
+		case 389: name = "lwp_create"; break;
+		case 390: name = "lwp_terminate"; break;
+		case 391: name = "lwp_wait"; break;
+		case 392: name = "lwp_suspend"; break;
+		case 393: name = "lwp_resume"; break;
+		case 394: name = "lwp_self"; break;
+		case 395: name = "lwp_abort_syscall"; break;
+		case 396: name = "lwp_info"; break;
+		case 397: name = "lwp_kill"; break;
+		case 398: name = "ksleep"; break;
+		case 399: name = "kwakeup"; break;
+		case 400: name = "ksleep_abort"; break;
+		case 401: name = "lwp_proc_info"; break;
+		case 402: name = "lwp_exit"; break;
+		case 403: name = "lwp_continue"; break;
+		case 404: name = "getacl"; break;
+		case 405: name = "fgetacl"; break;
+		case 406: name = "setacl"; break;
+		case 407: name = "fsetacl"; break;
+		case 408: name = "getaccess"; break;
+		case 409: name = "lwp_mutex_init"; break;
+		case 410: name = "lwp_mutex_lock_sys"; break;
+		case 411: name = "lwp_mutex_unlock"; break;
+		case 412: name = "lwp_cond_init"; break;
+		case 413: name = "lwp_cond_signal"; break;
+		case 414: name = "lwp_cond_broadcast"; break;
+		case 415: name = "lwp_cond_wait_sys"; break;
+		case 416: name = "lwp_getscheduler"; break;
+		case 417: name = "lwp_setscheduler"; break;
+		case 418: name = "lwp_getprivate"; break;
+		case 419: name = "lwp_setprivate"; break;
+		case 420: name = "lwp_detach"; break;
+		case 421: name = "mlock"; break;
+		case 422: name = "munlock"; break;
+		case 423: name = "mlockall"; break;
+		case 424: name = "munlockall"; break;
+		case 425: name = "shm_open"; break;
+		case 426: name = "shm_unlink"; break;
+		case 427: name = "sigqueue"; break;
+		case 428: name = "sigwaitinfo"; break;
+		case 429: name = "sigtimedwait"; break;
+		case 430: name = "sigwait"; break;
+		case 431: name = "aio_read"; break;
+		case 432: name = "aio_write"; break;
+		case 433: name = "lio_listio"; break;
+		case 434: name = "aio_error"; break;
+		case 435: name = "aio_return"; break;
+		case 436: name = "aio_cancel"; break;
+		case 437: name = "aio_suspend"; break;
+		case 438: name = "aio_fsync"; break;
+		case 439: name = "mq_open"; break;
+		case 440: name = "mq_unlink"; break;
+		case 441: name = "mq_send"; break;
+		case 442: name = "mq_receive"; break;
+		case 443: name = "mq_notify"; break;
+		case 444: name = "mq_setattr"; break;
+		case 445: name = "mq_getattr"; break;
+		case 446: name = "ksem_open"; break;
+		case 447: name = "ksem_unlink"; break;
+		case 448: name = "ksem_close"; break;
+		case 449: name = "ksem_destroy"; break;
+		case 450: name = "lw_sem_incr"; break;
+		case 451: name = "lw_sem_decr"; break;
+		case 452: name = "lw_sem_read"; break;
+		case 453: name = "mq_close"; break;
+	};
 
-	printk(KERN_DEBUG \
-		"Unimplemented HP-UX syscall emulation. Syscall #%d\n",
+	if ( name ) {
+		printk(KERN_DEBUG "Unimplemented HP-UX syscall emulation. Syscall #%lu (%s)\n",
+		sc_num, name);
+	} else {
+		printk(KERN_DEBUG "Unimplemented unknown HP-UX syscall emulation. Syscall #%lu\n",
 		sc_num);
+	}
+	
 	printk(KERN_DEBUG "  Args: %lx %lx %lx %lx %lx %lx %lx\n",
 		arg1, arg2, arg3, arg4, arg5, arg6, arg7);
 

--zYM0uCDKw75PZbzx--
