Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.umr.edu (mrelay.cc.umr.edu [131.151.1.89])
	by dsl2.external.hp.com (Postfix) with ESMTP id BC7E349E4
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Oct 2001 08:28:46 -0600 (MDT)
Received: (from nneul@localhost)
	by infinity.cc.umr.edu (8.12.1/8.12.0.Beta7) id f95ESiiJ001047
	for parisc-linux@lists.parisc-linux.org; Fri, 5 Oct 2001 09:28:44 -0500
Date: Fri, 5 Oct 2001 09:28:44 -0500
From: Nathan Neulinger <nneul@umr.edu>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20011005092842.A1036@umr.edu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="fdj2RfSjLxBAspz7"
Subject: [parisc-linux] Table version of syscall names patch and some simple wrappers
List-ID: <linux-parisc.vger.kernel.org>

--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This switches the callnames stuff into a table instead of a large switch. It
also includes a couple of simple wrappers that helped flexlm get a bit further
in it's execution. (Looks like it's working from lmdiag/lmstat, but doesn't
actually work from the applications yet unfortunately.)

-- Nathan

------------------------------------------------------------
Nathan Neulinger                       EMail:  nneul@umr.edu
University of Missouri - Rolla         Phone: (573) 341-4841
Computing Services                       Fax: (573) 341-4216

--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="sys_hpux_calls.diff"

Index: arch/parisc/hpux/entry_hpux.S
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/hpux/entry_hpux.S,v
retrieving revision 1.17
diff -u -r1.17 entry_hpux.S
--- entry_hpux.S	2001/10/04 11:05:44	1.17
+++ entry_hpux.S	2001/10/05 14:22:34
@@ -56,7 +56,7 @@
 	ENTRY_NAME(sys_sync)
 	ENTRY_NAME(hpux_unimplemented_wrapper)
 	ENTRY_NAME(sys_newstat)
-	ENTRY_NAME(hpux_unimplemented_wrapper)
+	ENTRY_NAME(hpux_setpgrp3)
 	ENTRY_NAME(sys_newlstat)	/* 40 */
 	ENTRY_NAME(sys_dup)
 	ENTRY_NAME(hpux_pipe_wrapper)
@@ -100,13 +100,13 @@
 	ENTRY_NAME(hpux_unimplemented_wrapper)      /* 80 */
 	ENTRY_NAME(sys_getpgid)
 	ENTRY_NAME(sys_setpgid)
-	ENTRY_NAME(hpux_unimplemented_wrapper)
+	ENTRY_NAME(sys_setitimer)
 	ENTRY_NAME(hpux_unimplemented_wrapper)
 	ENTRY_NAME(hpux_unimplemented_wrapper)      /* 85 */
+	ENTRY_NAME(sys_getitimer)
 	ENTRY_NAME(hpux_unimplemented_wrapper)
 	ENTRY_NAME(hpux_unimplemented_wrapper)
 	ENTRY_NAME(hpux_unimplemented_wrapper)
-	ENTRY_NAME(hpux_unimplemented_wrapper)
 	ENTRY_NAME(sys_dup2)		/* 90 */
 	ENTRY_NAME(hpux_unimplemented_wrapper)
 	ENTRY_NAME(sys_newfstat)
@@ -160,9 +160,9 @@
 	ENTRY_NAME(hpux_unimplemented_wrapper)      /* 140 */
 	ENTRY_NAME(hpux_unimplemented_wrapper)
 	ENTRY_NAME(hpux_unimplemented_wrapper)
-	ENTRY_NAME(hpux_unimplemented_wrapper)
 	ENTRY_NAME(hpux_unimplemented_wrapper)
-	ENTRY_NAME(hpux_unimplemented_wrapper)      /* 145 */
+	ENTRY_NAME(sys_getrlimit)
+	ENTRY_NAME(sys_setrlimit)      /* 145 */
 	ENTRY_NAME(hpux_unimplemented_wrapper)
 	ENTRY_NAME(hpux_unimplemented_wrapper)
 	ENTRY_NAME(hpux_unimplemented_wrapper)
@@ -172,7 +172,7 @@
 	ENTRY_NAME(hpux_unimplemented_wrapper)
 	ENTRY_NAME(hpux_unimplemented_wrapper)
 	ENTRY_NAME(hpux_unimplemented_wrapper)
-	ENTRY_NAME(hpux_unimplemented_wrapper)      /* 155 */
+	ENTRY_NAME(hpux_lockf)      /* 155 */
 	ENTRY_NAME(hpux_unimplemented_wrapper)
 	ENTRY_NAME(hpux_unimplemented_wrapper)
 	ENTRY_NAME(hpux_unimplemented_wrapper)
@@ -202,7 +202,7 @@
 	ENTRY_NAME(hpux_unimplemented_wrapper)
 	ENTRY_NAME(hpux_unimplemented_wrapper)
 	ENTRY_NAME(hpux_unimplemented_wrapper)
-	ENTRY_NAME(hpux_unimplemented_wrapper)      /* 185 */
+	ENTRY_NAME(sys_sigprocmask)      /* 185 */
 	ENTRY_NAME(hpux_unimplemented_wrapper)
 	ENTRY_NAME(hpux_unimplemented_wrapper)
 	ENTRY_NAME(hpux_unimplemented_wrapper)
@@ -213,10 +213,10 @@
 	ENTRY_NAME(hpux_unimplemented_wrapper)
 	ENTRY_NAME(hpux_unimplemented_wrapper)
 	ENTRY_NAME(hpux_unimplemented_wrapper)      /* 195 */
+	ENTRY_NAME(hpux_statfs)
 	ENTRY_NAME(hpux_unimplemented_wrapper)
 	ENTRY_NAME(hpux_unimplemented_wrapper)
 	ENTRY_NAME(hpux_unimplemented_wrapper)
-	ENTRY_NAME(hpux_unimplemented_wrapper)
 	ENTRY_NAME(sys_waitpid)	/* 200 */
 	ENTRY_NAME(hpux_unimplemented_wrapper)
 	ENTRY_NAME(hpux_unimplemented_wrapper)
@@ -350,8 +350,8 @@
 	ENTRY_NAME(hpux_unimplemented_wrapper)      /* 330 */
 	ENTRY_NAME(hpux_unimplemented_wrapper)
 	ENTRY_NAME(sys_lchown)
-	ENTRY_NAME(hpux_unimplemented_wrapper)
 	ENTRY_NAME(hpux_unimplemented_wrapper)
+	ENTRY_NAME(hpux_sysfs)
 	ENTRY_NAME(hpux_unimplemented_wrapper)      /* 335 */
 	ENTRY_NAME(hpux_unimplemented_wrapper)
 	ENTRY_NAME(hpux_unimplemented_wrapper)
@@ -399,8 +399,8 @@
 	ENTRY_NAME(hpux_unimplemented_wrapper)
 	ENTRY_NAME(hpux_unimplemented_wrapper)      /* 380 */
 	ENTRY_NAME(hpux_unimplemented_wrapper)
-	ENTRY_NAME(hpux_unimplemented_wrapper)
 	ENTRY_NAME(hpux_unimplemented_wrapper)
+	ENTRY_NAME(hpux_setpgrp)
 	ENTRY_NAME(hpux_unimplemented_wrapper)
 	ENTRY_NAME(hpux_unimplemented_wrapper)      /* 385 */
 	ENTRY_NAME(hpux_unimplemented_wrapper)
Index: arch/parisc/hpux/sys_hpux.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/hpux/sys_hpux.c,v
retrieving revision 1.9
diff -u -r1.9 sys_hpux.c
--- sys_hpux.c	2001/10/04 11:05:44	1.9
+++ sys_hpux.c	2001/10/05 14:22:34
@@ -9,6 +9,9 @@
 #include <linux/utsname.h>
 #include <asm/errno.h>
 #include <asm/uaccess.h>
+#include <linux/vmalloc.h>
+#include <asm/pgalloc.h>
+#include <linux/slab.h>
 
 unsigned long sys_brk(unsigned long addr);
  
@@ -41,6 +44,17 @@
 	return sys_waitpid(-1, stat_loc, 0);
 }
 
+int hpux_setpgrp(void)
+{
+	extern int sys_setpgid(int, int);
+	return sys_setpgid(0,0);
+}
+
+int hpux_setpgrp3(void)
+{
+	return hpux_setpgrp();
+}
+
 #define _SC_CPU_VERSION	10001
 #define _SC_OPEN_MAX	4
 #define CPU_PA_RISC1_1	0x210
@@ -129,7 +143,67 @@
 	return err;
 }
 
+/*
+ * Wrapper for hpux statfs call. At the moment, just calls the linux native one
+ * and ignores the extra fields at the end of the hpux statfs struct.
+ *
+ */
+
+typedef int32_t hpux_fsid_t[2];              /* file system ID type */
+typedef uint16_t hpux_site_t;
+
+struct hpux_statfs {
+     int32_t f_type;                    /* type of info, zero for now */
+     int32_t f_bsize;                   /* fundamental file system block size */
+     int32_t f_blocks;                  /* total blocks in file system */
+     int32_t f_bfree;                   /* free block in fs */
+     int32_t f_bavail;                  /* free blocks avail to non-superuser */
+     int32_t f_files;                   /* total file nodes in file system */
+     int32_t f_ffree;                   /* free file nodes in fs */
+     hpux_fsid_t  f_fsid;                    /* file system ID */
+     int32_t f_magic;                   /* file system magic number */
+     int32_t f_featurebits;             /* file system features */
+     int32_t f_spare[4];                /* spare for later */
+     hpux_site_t  f_cnode;                   /* cluster node where mounted */
+     int16_t f_pad;
+};
+
+/* hpux statfs */
+int hpux_statfs(const char *path, struct hpux_statfs *buf)
+{
+	int error;
+	int len;
+	char *kpath;
+
+	len = strlen_user((char *)path); 
+
+	kpath = (char *) kmalloc(len+1, GFP_KERNEL);
+	if ( !kpath ) {
+	printk(KERN_DEBUG "failed to kmalloc kpath\n");
+	return 0;
+	}
+
+	if ( copy_from_user(kpath, (char *)path, len+1) ) {
+	printk(KERN_DEBUG "failed to copy_from_user kpath\n");
+	kfree(kpath);
+	return 0;
+	}
+
+	printk(KERN_DEBUG "hpux_statfs(\"%s\",-)\n", kpath);
+
+	kfree(kpath);
+
+	/* just fake it, beginning of structures match */
+	extern int sys_statfs(const char *, struct statfs *);
+	error = sys_statfs(path, (struct statfs *) buf);
+
+	/* ignoring rest of statfs struct, but it should be zeros. Need to do 
+		something with f_fsid[1], which is the fstype for sysfs */
+
+	return error;
+}
 
+
 /*  This function is called from hpux_utssys(); HP-UX implements
  *  uname() as an option to utssys().
  *
@@ -334,6 +412,517 @@
 	return error;
 }
 
+/* lies - says it works, but it really didn't lock anything */
+int hpux_lockf(int fildes, int function, off_t size)
+{
+	return 0;
+}
+
+int hpux_sysfs(int opcode, unsigned long arg1, unsigned long arg2)
+{
+	char *fsname = NULL;
+	int len = 0;
+	int fstype;
+
+/*Unimplemented HP-UX syscall emulation. Syscall #334 (sysfs)
+  Args: 1 80057bf4 0 400179f0 0 0 0 */
+	printk(KERN_DEBUG "in hpux_sysfs\n");
+	printk(KERN_DEBUG "hpux_sysfs called with opcode = %d\n", opcode);
+	printk(KERN_DEBUG "hpux_sysfs called with arg1='%lx'\n", arg1);
+
+	if ( opcode == 1 ) { /* GETFSIND */	
+		len = strlen_user((char *)arg1);
+		printk(KERN_DEBUG "len of arg1 = %d\n", len);
+
+		fsname = (char *) kmalloc(len+1, GFP_KERNEL);
+		if ( !fsname ) {
+			printk(KERN_DEBUG "failed to kmalloc fsname\n");
+			return 0;
+		}
+
+		if ( copy_from_user(fsname, (char *)arg1, len+1) ) {
+			printk(KERN_DEBUG "failed to copy_from_user fsname\n");
+			kfree(fsname);
+			return 0;
+		}
+
+		printk(KERN_DEBUG "that is '%s' as (char *)\n", fsname);
+		if ( !strcmp(fsname, "hfs") ) {
+			fstype = 0;
+		} else {
+			fstype = 0;
+		};
+
+		kfree(fsname);
+
+		printk(KERN_DEBUG "returning fstype=%d\n", fstype);
+		return fstype; /* something other than default */
+	}
+
+
+	return 0;
+}
+
+
+/* Table of syscall names and handle for unimplemented routines */
+static const char *syscall_names[] = {
+	"nosys",                  /* 0 */
+	"exit",                  
+	"fork",                  
+	"read",                  
+	"write",                 
+	"open",                   /* 5 */
+	"close",                 
+	"wait",                  
+	"creat",                 
+	"link",                  
+	"unlink",                 /* 10 */
+	"execv",                 
+	"chdir",                 
+	"time",                  
+	"mknod",                 
+	"chmod",                  /* 15 */
+	"chown",                 
+	"brk",                   
+	"lchmod",                
+	"lseek",                 
+	"getpid",                 /* 20 */
+	"mount",                 
+	"umount",                
+	"setuid",                
+	"getuid",                
+	"stime",                  /* 25 */
+	"ptrace",                
+	"alarm",                 
+	NULL,                    
+	"pause",                 
+	"utime",                  /* 30 */
+	"stty",                  
+	"gtty",                  
+	"access",                
+	"nice",                  
+	"ftime",                  /* 35 */
+	"sync",                  
+	"kill",                  
+	"stat",                  
+	"setpgrp3",              
+	"lstat",                  /* 40 */
+	"dup",                   
+	"pipe",                  
+	"times",                 
+	"profil",                
+	"ki_call",                /* 45 */
+	"setgid",                
+	"getgid",                
+	NULL,                    
+	NULL,                    
+	NULL,                     /* 50 */
+	"acct",                  
+	"set_userthreadid",      
+	NULL,                    
+	"ioctl",                 
+	"reboot",                 /* 55 */
+	"symlink",               
+	"utssys",                
+	"readlink",              
+	"execve",                
+	"umask",                  /* 60 */
+	"chroot",                
+	"fcntl",                 
+	"ulimit",                
+	NULL,                    
+	NULL,                     /* 65 */
+	"vfork",                 
+	NULL,                    
+	NULL,                    
+	NULL,                    
+	NULL,                     /* 70 */
+	"mmap",                  
+	NULL,                    
+	"munmap",                
+	"mprotect",              
+	"madvise",                /* 75 */
+	"vhangup",               
+	"swapoff",               
+	NULL,                    
+	"getgroups",             
+	"setgroups",              /* 80 */
+	"getpgrp2",              
+	"setpgid/setpgrp2",      
+	"setitimer",             
+	"wait3",                 
+	"swapon",                 /* 85 */
+	"getitimer",             
+	NULL,                    
+	NULL,                    
+	NULL,                    
+	"dup2",                   /* 90 */
+	NULL,                    
+	"fstat",                 
+	"select",                
+	NULL,                    
+	"fsync",                  /* 95 */
+	"setpriority",           
+	NULL,                    
+	NULL,                    
+	NULL,                    
+	"getpriority",            /* 100 */
+	NULL,                    
+	NULL,                    
+	NULL,                    
+	NULL,                    
+	NULL,                     /* 105 */
+	NULL,                    
+	NULL,                    
+	"sigvector",             
+	"sigblock",              
+	"sigsetmask",             /* 110 */
+	"sigpause",              
+	"sigstack",              
+	NULL,                    
+	NULL,                    
+	NULL,                     /* 115 */
+	"gettimeofday",          
+	"getrusage",             
+	NULL,                    
+	NULL,                    
+	"readv",                  /* 120 */
+	"writev",                
+	"settimeofday",          
+	"fchown",                
+	"fchmod",                
+	NULL,                     /* 125 */
+	"setresuid",             
+	"setresgid",             
+	"rename",                
+	"truncate",              
+	"ftruncate",              /* 130 */
+	NULL,                    
+	"sysconf",               
+	NULL,                    
+	NULL,                    
+	NULL,                     /* 135 */
+	"mkdir",                 
+	"rmdir",                 
+	NULL,                    
+	"sigcleanup",            
+	"setcore",                /* 140 */
+	NULL,                    
+	"gethostid",             
+	"sethostid",             
+	"getrlimit",             
+	"setrlimit",              /* 145 */
+	NULL,                    
+	NULL,                    
+	"quotactl",              
+	"get_sysinfo",           
+	NULL,                     /* 150 */
+	"privgrp",               
+	"rtprio",                
+	"plock",                 
+	NULL,                    
+	"lockf",                  /* 155 */
+	"semget",                
+	NULL,                    
+	"semop",                 
+	"msgget",                
+	NULL,                     /* 160 */
+	"msgsnd",                
+	"msgrcv",                
+	"shmget",                
+	NULL,                    
+	"shmat",                  /* 165 */
+	"shmdt",                 
+	NULL,                    
+	"csp/nsp_init",          
+	"cluster",               
+	"mkrnod",                 /* 170 */
+	"test",                  
+	"unsp_open",             
+	NULL,                    
+	"getcontext",            
+	"osetcontext",            /* 175 */
+	"bigio",                 
+	"pipenode",              
+	"lsync",                 
+	"getmachineid",          
+	"cnodeid/mysite",         /* 180 */
+	"cnodes/sitels",         
+	"swapclients",           
+	"rmtprocess",            
+	"dskless_stats",         
+	"sigprocmask",            /* 185 */
+	"sigpending",            
+	"sigsuspend",            
+	"sigaction",             
+	NULL,                    
+	"nfssvc",                 /* 190 */
+	"getfh",                 
+	"getdomainname",         
+	"setdomainname",         
+	"async_daemon",          
+	"getdirentries",          /* 195 */
+	"statfs",                
+	"fstatfs",               
+	"vfsmount",              
+	NULL,                    
+	"waitpid",                /* 200 */
+	NULL,                    
+	NULL,                    
+	NULL,                    
+	NULL,                    
+	NULL,                     /* 205 */
+	NULL,                    
+	NULL,                    
+	NULL,                    
+	NULL,                    
+	NULL,                     /* 210 */
+	NULL,                    
+	NULL,                    
+	NULL,                    
+	NULL,                    
+	NULL,                     /* 215 */
+	NULL,                    
+	NULL,                    
+	NULL,                    
+	NULL,                    
+	NULL,                     /* 220 */
+	NULL,                    
+	NULL,                    
+	NULL,                    
+	"sigsetreturn",          
+	"sigsetstatemask",        /* 225 */
+	"bfactl",                
+	"cs",                    
+	"cds",                   
+	NULL,                    
+	"pathconf",               /* 230 */
+	"fpathconf",             
+	NULL,                    
+	NULL,                    
+	"nfs_fcntl",             
+	"ogetacl",                /* 235 */
+	"ofgetacl",              
+	"osetacl",               
+	"ofsetacl",              
+	"pstat",                 
+	"getaudid",               /* 240 */
+	"setaudid",              
+	"getaudproc",            
+	"setaudproc",            
+	"getevent",              
+	"setevent",               /* 245 */
+	"audwrite",              
+	"audswitch",             
+	"audctl",                
+	"ogetaccess",            
+	"fsctl",                  /* 250 */
+	"ulconnect",             
+	"ulcontrol",             
+	"ulcreate",              
+	"uldest",                
+	"ulrecv",                 /* 255 */
+	"ulrecvcn",              
+	"ulsend",                
+	"ulshutdown",            
+	"swapfs",                
+	"fss",                    /* 260 */
+	NULL,                    
+	NULL,                    
+	NULL,                    
+	NULL,                    
+	NULL,                     /* 265 */
+	NULL,                    
+	"tsync",                 
+	"getnumfds",             
+	"poll",                  
+	"getmsg",                 /* 270 */
+	"putmsg",                
+	"fchdir",                
+	"getmount_cnt",          
+	"getmount_entry",        
+	"accept",                 /* 275 */
+	"bind",                  
+	"connect",               
+	"getpeername",           
+	"getsockname",           
+	"getsockopt",             /* 280 */
+	"listen",                
+	"recv",                  
+	"recvfrom",              
+	"recvmsg",               
+	"send",                   /* 285 */
+	"sendmsg",               
+	"sendto",                
+	"setsockopt",            
+	"shutdown",              
+	"socket",                 /* 290 */
+	"socketpair",            
+	"proc_open",             
+	"proc_close",            
+	"proc_send",             
+	"proc_recv",              /* 295 */
+	"proc_sendrecv",         
+	"proc_syscall",          
+	"ipccreate",             
+	"ipcname",               
+	"ipcnamerase",            /* 300 */
+	"ipclookup",             
+	"ipcselect",             
+	"ipcconnect",            
+	"ipcrecvcn",             
+	"ipcsend",                /* 305 */
+	"ipcrecv",               
+	"ipcgetnodename",        
+	"ipcsetnodename",        
+	"ipccontrol",            
+	"ipcshutdown",            /* 310 */
+	"ipcdest",               
+	"semctl",                
+	"msgctl",                
+	"shmctl",                
+	"mpctl",                  /* 315 */
+	"exportfs",              
+	"getpmsg",               
+	"putpmsg",               
+	"strioctl",              
+	"msync",                  /* 320 */
+	"msleep",                
+	"mwakeup",               
+	"msem_init",             
+	"msem_remove",           
+	"adjtime",                /* 325 */
+	"kload",                 
+	"fattach",               
+	"fdetach",               
+	"serialize",             
+	"statvfs",                /* 330 */
+	"fstatvfs",              
+	"lchown",                
+	"getsid",                
+	"sysfs",                 
+	NULL,                     /* 335 */
+	NULL,                    
+	"sched_setparam",        
+	"sched_getparam",        
+	"sched_setscheduler",    
+	"sched_getscheduler",     /* 340 */
+	"sched_yield",           
+	"sched_get_priority_max",
+	"sched_get_priority_min",
+	"sched_rr_get_interval", 
+	"clock_settime",          /* 345 */
+	"clock_gettime",         
+	"clock_getres",          
+	"timer_create",          
+	"timer_delete",          
+	"timer_settime",          /* 350 */
+	"timer_gettime",         
+	"timer_getoverrun",      
+	"nanosleep",             
+	"toolbox",               
+	NULL,                     /* 355 */
+	"getdents",              
+	"getcontext",            
+	"sysinfo",               
+	"fcntl64",               
+	"ftruncate64",            /* 360 */
+	"fstat64",               
+	"getdirentries64",       
+	"getrlimit64",           
+	"lockf64",               
+	"lseek64",                /* 365 */
+	"lstat64",               
+	"mmap64",                
+	"setrlimit64",           
+	"stat64",                
+	"truncate64",             /* 370 */
+	"ulimit64",              
+	NULL,                    
+	NULL,                    
+	NULL,                    
+	NULL,                     /* 375 */
+	NULL,                    
+	NULL,                    
+	NULL,                    
+	NULL,                    
+	"setcontext",             /* 380 */
+	"sigaltstack",           
+	"waitid",                
+	"setpgrp",               
+	"recvmsg2",              
+	"sendmsg2",               /* 385 */
+	"socket2",               
+	"socketpair2",           
+	"setregid",              
+	"lwp_create",            
+	"lwp_terminate",          /* 390 */
+	"lwp_wait",              
+	"lwp_suspend",           
+	"lwp_resume",            
+	"lwp_self",              
+	"lwp_abort_syscall",      /* 395 */
+	"lwp_info",              
+	"lwp_kill",              
+	"ksleep",                
+	"kwakeup",               
+	"ksleep_abort",           /* 400 */
+	"lwp_proc_info",         
+	"lwp_exit",              
+	"lwp_continue",          
+	"getacl",                
+	"fgetacl",                /* 405 */
+	"setacl",                
+	"fsetacl",               
+	"getaccess",             
+	"lwp_mutex_init",        
+	"lwp_mutex_lock_sys",     /* 410 */
+	"lwp_mutex_unlock",      
+	"lwp_cond_init",         
+	"lwp_cond_signal",       
+	"lwp_cond_broadcast",    
+	"lwp_cond_wait_sys",      /* 415 */
+	"lwp_getscheduler",      
+	"lwp_setscheduler",      
+	"lwp_getprivate",        
+	"lwp_setprivate",        
+	"lwp_detach",             /* 420 */
+	"mlock",                 
+	"munlock",               
+	"mlockall",              
+	"munlockall",            
+	"shm_open",               /* 425 */
+	"shm_unlink",            
+	"sigqueue",              
+	"sigwaitinfo",           
+	"sigtimedwait",          
+	"sigwait",                /* 430 */
+	"aio_read",              
+	"aio_write",             
+	"lio_listio",            
+	"aio_error",             
+	"aio_return",             /* 435 */
+	"aio_cancel",            
+	"aio_suspend",           
+	"aio_fsync",             
+	"mq_open",               
+	"mq_unlink",              /* 440 */
+	"mq_send",               
+	"mq_receive",            
+	"mq_notify",             
+	"mq_setattr",            
+	"mq_getattr",             /* 445 */
+	"ksem_open",             
+	"ksem_unlink",           
+	"ksem_close",            
+	"ksem_destroy",          
+	"lw_sem_incr",            /* 450 */
+	"lw_sem_decr",           
+	"lw_sem_read",           
+	"mq_close",              
+};
+static const int syscall_names_max = 453;
+
 int
 hpux_unimplemented(unsigned long arg1,unsigned long arg2,unsigned long arg3,
 		   unsigned long arg4,unsigned long arg5,unsigned long arg6,
@@ -342,10 +931,19 @@
 	/* NOTE: sc_num trashes arg8 for the few syscalls that actually
 	 * have a valid 8th argument.
 	 */
+	const char *name = NULL;
+	if ( sc_num <= syscall_names_max && sc_num >= 0 ) {
+		name = syscall_names[sc_num];
+	}
 
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
 

--fdj2RfSjLxBAspz7--
