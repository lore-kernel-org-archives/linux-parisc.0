Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 851FB4A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Feb 2001 04:34:33 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id WAA02912;
	Thu, 22 Feb 2001 22:34:18 +1100
Date: Thu, 22 Feb 2001 22:34:18 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: pipes
In-Reply-To: <20010222110054.A1129@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0102222202190.14557-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 22 Feb 2001, Richard Hirst wrote:

> On Thu, Feb 22, 2001 at 05:37:55PM +1100, Alan Modra wrote:
> > 
> > I had another look at the fixincludes problem, and found the following:
> > 
> > 14:36:08 write(5, "cd /scsi/tmp\nfile=sys/stat.h\nif ( test  -r types/vxTypesOld.h ) > /dev/null 2>&1\nthen echo TRUE\nelse echo FALSE\nfi\n\necho\necho ShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 158) = 158
> > 14:36:08 alarm(10)                      = 0
> > 14:36:08 read(6, "FALSE\n", 4096)       = 6
> > 14:36:08 alarm(10)                      = 10
> > 14:36:08 read(6, "FALSE\nShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 4096) = -512
> > 14:36:18 --- SIGALRM (Alarm clock) ---
> > 14:36:18 read(6, "FALSE\nShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 4096) = -512
> > 14:36:28 --- SIGINT (Interrupt) ---
> > 14:36:28 +++ killed by SIGINT +++
> > 
> > fd 5 and 6 are pipes to a /bin/sh.  -512 is ERESTARTSYS.  ERESTARTSYS
> > shouldn't happen, and is why fixincludes is bombing.
> > 
> > Nothing suspicious in previous rt_sigaction calls as far as I could see,
> > and putting in a debugging printk in do_sigaction shows sa_flags is being
> > set correctly, to 0x40.
> > 
> > Ideas?
> 
> Simple test case:
> 
> main()
> {
>         char buf[10];
> 
>         strcpy(buf, "my buffer\n");
>         alarm(1);
>         read(0, buf, 10);
> }
> 
> 
> 10:50:05 alarm(1)                       = 0
> 10:50:05 read(0, "my buffer\n", 10)     = -512
> 10:50:06 --- SIGALRM (Alarm clock) ---
> 10:50:06 +++ killed by SIGALRM +++
> 
> 
> Looks like the primary problem is that your read is blocking for 10 seconds
> thinking there is no data available.  Secondary problem is that the kernel
> returns the wrong thing when the syscall is interrupted.

Hi Richard,
   This is a different situation.  Notice in my case that the first
read() returning -512 was before the alarm went off.

> I gather there is something receiving the data written to fd 5, processing
> it, and writing back up fd 6.  We want to know if that something writes
> the missing data or not.

Yeah, it's /bin/sh, and has happily executed numerous commands before
the problem occurs.

Alan
-- 

Here's the complete trace.  You can see things are a little different for
the last command sent over the pipe: fixincl has (rather stupidly) decided
to ignore various signals, but that shouldn't make any difference as
regards ERESTARTSYS.  As I said above, I checked what was happening in the
kernel do_sigaction too.

16:30:08 execve("/scsi/tmp/gcc/gcc/fixinc/fixincl", ["/scsi/tmp/gcc/gcc/fixinc/fixincl"], [/* 26 vars */]) = 0
16:31:01 newuname({sys="Linux", node="tea", ...}) = 0
16:30:08 brk(0)                         = 0x18000
16:30:08 mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4001d000
16:30:08 open("/etc/ld.so.preload", O_RDONLY) = -1 ENOENT (No such file or directory)
16:30:08 open("/etc/ld.so.cache", O_RDONLY) = 4
16:30:08 newfstat(4, {st_mode=S_IFREG|0644, st_size=6548, ...}) = 0
16:30:08 mmap(NULL, 6548, PROT_READ, MAP_PRIVATE, 4, 0) = 0x4001e000
16:30:08 close(4)                       = 0
16:30:08 open("/lib/libc.so.6", O_RDONLY) = 4
16:30:08 read(4, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\2\202\224\0\0\0004\0N(\300\0\0\2\20\0004\0 \0\5\0(\0E\0B\0\0\0\6\0\0\0004\0\0\0004\0\0\0004\0\0\0\240\0\0\0\240\0\0\0\5\0\0\0\4\0\0\0\3\0\22k(\0\22k(\0\22k(\0\0\0\20\0\0\0\20\0\0\0\4\0\0\0\4\0\0\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\22\3618\0\22\3618\0\0\0\5\0\0\20\0\0\0\0\1\0\22\361@\0\23\1@\0\23\1@\0\0\230\304\0\0\316l\0\0\0\7\0\0\20\0\0\0\0\2\0\23\211T\0\23\231T\0\23\231T\0\0\0\260\0\0\0\260\0\0\0\6\0\0\0\4\0\0\3\371\0\0\7\226\0\0\5\373\0\0\2a\0\0\6\302"..., 1024) = 1024
16:30:08 newfstat(4, {st_mode=S_IFREG|0755, st_size=5294284, ...}) = 0
16:30:08 mmap(NULL, 1298348, PROT_READ|PROT_EXEC, MAP_PRIVATE, 4, 0) = 0x40020000
16:30:08 mprotect(0x40150000, 53164, PROT_NONE) = 0
16:30:08 mmap(0x40150000, 40960, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 4, 0x12f000) = 0x40150000
16:30:08 mmap(0x4015a000, 12204, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x4015a000
16:30:08 close(4)                       = 0
16:30:08 munmap(0x4001e000, 6548)       = 0
16:30:08 getpid()                       = 120
16:30:08 brk(0)                         = 0x18000
16:30:08 brk(0x19118)                   = 0x19118
16:30:08 brk(0x1a000)                   = 0x1a000
16:30:08 pipe([4, 5])                   = 0
16:30:08 pipe([6, 7])                   = 0
16:30:08 fork()                         = 121
16:30:08 close(4)                       = 0
16:30:08 close(7)                       = 0
16:30:08 fcntl(6, F_GETFL)              = 0 (flags O_RDONLY)
16:30:08 newfstat(6, {st_mode=S_IFIFO|0600, st_size=0, ...}) = 0
16:30:08 mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4001e000
16:30:08 _llseek(0x6, 0, 0, 0xfaf00a48, 0x1) = -1 ESPIPE (Illegal seek)
16:30:08 fcntl(5, F_GETFL)              = 0x1 (flags O_WRONLY)
16:30:08 newfstat(5, {st_mode=S_IFIFO|0600, st_size=0, ...}) = 0
16:30:08 mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4001f000
16:30:08 _llseek(0x5, 0, 0, 0xfaf00a48, 0x1) = -1 ESPIPE (Illegal seek)
16:30:08 getpid()                       = 120
16:30:08 rt_sigaction(SIGPIPE, {0x1664e, [], SA_RESTART}, {SIG_DFL}, 8) = 0
16:30:08 rt_sigaction(SIGALRM, {0x1664e, [], SA_RESTART}, {SIG_DFL}, 8) = 0
16:30:08 write(5, "trap : 1\n", 9)      = 9
16:30:08 brk(0x1c000)                   = 0x1c000
16:30:08 getcwd("/scsi/tmp", 4096)      = 10
16:31:02 write(5, "cd /scsi/tmp\ncase hppa-unknown-linux-gnu in\ni[34567]86-*-linux* )\n    echo run ;;\n* ) echo skip ;;\nesac\n\necho\necho ShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 147) = 147
16:30:08 alarm(10)                      = 0
16:30:08 read(6, "skip\n", 4096)        = 5
16:30:09 alarm(10)                      = 10
16:30:09 read(6, "\n", 4096)            = 1
16:30:09 alarm(10)                      = 10
16:30:09 read(6, "ShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 4096) = 32
16:30:09 alarm(0)                       = 10
16:30:09 write(5, "cd /scsi/tmp\ncase hppa-unknown-linux-gnu in\ni[34567]86-*-linux* )\n    echo run ;;\n* ) echo skip ;;\nesac\n\necho\necho ShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 147) = 147
16:30:09 alarm(10)                      = 0
16:30:09 read(6, "skip\n\nShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 4096) = 38
16:30:09 alarm(10)                      = 10
16:30:09 alarm(10)                      = 10
16:30:09 alarm(0)                       = 10
16:30:09 write(5, "cd /scsi/tmp\ncase hppa-unknown-linux-gnu in\ni[34567]86-*-linux* )\n    echo run ;;\n* ) echo skip ;;\nesac\n\necho\necho ShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 147) = 147
16:30:09 alarm(10)                      = 0
16:30:09 read(6, "skip\n\nShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 4096) = 38
16:30:09 alarm(10)                      = 10
16:30:09 alarm(10)                      = 10
16:30:09 alarm(0)                       = 10
16:30:09 write(5, "cd /scsi/tmp\ncase hppa-unknown-linux-gnu in\n*-*-sysv4* | \\\ni[34567]86-*-sysv5* | \\\ni[34567]86-*-udk* | \\\ni[34567]86-*-solaris2.[0-4] | \\\npowerpcle-*-solaris2.[0-4] | \\\nsparc-*-solaris2.[0-4] )\n    echo run ;;\n* ) echo skip ;;\nesac\n\necho\necho ShElL-OuTpUt-H"..., 274) = 274
16:30:09 alarm(10)                      = 0
16:30:09 read(6, "skip\n\nShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 4096) = 38
16:30:09 alarm(10)                      = 10
16:30:09 alarm(10)                      = 10
16:30:09 alarm(0)                       = 10
16:30:09 write(5, "cd /scsi/tmp\ncase hppa-unknown-linux-gnu in\n*-*-ultrix4.3 )\n    echo run ;;\n* ) echo skip ;;\nesac\n\necho\necho ShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 141) = 141
16:30:09 alarm(10)                      = 0
16:30:09 read(6, "skip\n\nShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 4096) = 38
16:30:09 alarm(10)                      = 10
16:30:09 alarm(10)                      = 10
16:30:09 alarm(0)                       = 10
16:30:09 write(5, "cd /scsi/tmp\ncase hppa-unknown-linux-gnu in\n*-*-ultrix4.3 )\n    echo run ;;\n* ) echo skip ;;\nesac\n\necho\necho ShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 141) = 141
16:30:09 alarm(10)                      = 0
16:30:09 read(6, "skip\n\nShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 4096) = 38
16:30:09 alarm(10)                      = 10
16:30:09 alarm(10)                      = 10
16:30:09 alarm(0)                       = 10
16:30:09 write(5, "cd /scsi/tmp\ncase hppa-unknown-linux-gnu in\n*-*-ultrix4.3 )\n    echo run ;;\n* ) echo skip ;;\nesac\n\necho\necho ShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 141) = 141
16:30:09 alarm(10)                      = 0
16:30:09 read(6, "skip\n\nShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 4096) = 38
16:30:09 alarm(10)                      = 10
16:30:09 alarm(10)                      = 10
16:30:09 alarm(0)                       = 10
16:30:09 brk(0x1d000)                   = 0x1d000
16:30:09 brk(0x1e000)                   = 0x1e000
16:30:09 write(5, "cd /scsi/tmp\ncase hppa-unknown-linux-gnu in\nm88k-motorola-sysv3* )\n    echo run ;;\n* ) echo skip ;;\nesac\n\necho\necho ShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 148) = 148
16:30:10 alarm(10)                      = 0
16:30:10 read(6, "skip\n\nShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 4096) = 38
16:30:10 alarm(10)                      = 10
16:30:10 alarm(10)                      = 10
16:30:10 alarm(0)                       = 10
16:30:10 brk(0x1f000)                   = 0x1f000
16:30:10 brk(0x20000)                   = 0x20000
16:30:10 write(5, "cd /scsi/tmp\ncase hppa-unknown-linux-gnu in\nm88k-motorola-sysv3* )\n    echo run ;;\n* ) echo skip ;;\nesac\n\necho\necho ShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 148) = 148
16:30:10 alarm(10)                      = 0
16:30:10 read(6, "skip\n\nShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 4096) = 38
16:30:10 alarm(10)                      = 10
16:30:10 alarm(10)                      = 10
16:30:10 alarm(0)                       = 10
16:30:10 write(5, "cd /scsi/tmp\ncase hppa-unknown-linux-gnu in\nm88k-*-sysv3* )\n    echo run ;;\n* ) echo skip ;;\nesac\n\necho\necho ShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 141) = 141
16:30:10 alarm(10)                      = 0
16:30:10 read(6, "skip\n\nShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 4096) = 38
16:30:10 alarm(10)                      = 10
16:30:10 alarm(10)                      = 10
16:30:10 alarm(0)                       = 10
16:30:10 write(5, "cd /scsi/tmp\ncase hppa-unknown-linux-gnu in\nm88k-tektronix-sysv3* )\n    echo run ;;\n* ) echo skip ;;\nesac\n\necho\necho ShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 149) = 149
16:30:10 alarm(10)                      = 0
16:30:10 read(6, "skip\n\nShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 4096) = 38
16:30:10 alarm(10)                      = 10
16:30:10 alarm(10)                      = 10
16:30:10 alarm(0)                       = 10
16:30:10 brk(0x21000)                   = 0x21000
16:30:10 write(5, "cd /scsi/tmp\ncase hppa-unknown-linux-gnu in\nm68k-motorola-sysv* )\n    echo run ;;\n* ) echo skip ;;\nesac\n\necho\necho ShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 147) = 147
16:30:10 alarm(10)                      = 0
16:30:10 read(6, "skip\n\nShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 4096) = 38
16:30:10 alarm(10)                      = 10
16:30:10 alarm(10)                      = 10
16:30:10 alarm(0)                       = 10
16:30:10 brk(0x22000)                   = 0x22000
16:30:10 write(5, "cd /scsi/tmp\ncase hppa-unknown-linux-gnu in\ni?86-*-sco3.2* )\n    echo run ;;\n* ) echo skip ;;\nesac\n\necho\necho ShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 142) = 142
16:30:10 alarm(10)                      = 0
16:30:10 read(6, "skip\n\nShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 4096) = 38
16:30:10 alarm(10)                      = 10
16:30:10 alarm(10)                      = 10
16:30:10 alarm(0)                       = 10
16:30:10 write(5, "cd /scsi/tmp\ncase hppa-unknown-linux-gnu in\ni?86-*-sco3.2* )\n    echo run ;;\n* ) echo skip ;;\nesac\n\necho\necho ShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 142) = 142
16:30:10 alarm(10)                      = 0
16:30:10 read(6, "skip\n\nShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 4096) = 38
16:30:10 alarm(10)                      = 10
16:30:10 alarm(10)                      = 10
16:30:10 alarm(0)                       = 10
16:30:10 write(5, "cd /scsi/tmp\ncase hppa-unknown-linux-gnu in\ni?86-*-sco3.2v4* )\n    echo run ;;\n* ) echo skip ;;\nesac\n\necho\necho ShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 144) = 144
16:30:10 alarm(10)                      = 0
16:30:10 read(6, "skip\n\nShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 4096) = 38
16:30:10 alarm(10)                      = 10
16:30:10 alarm(10)                      = 10
16:30:10 alarm(0)                       = 10
16:30:10 brk(0x23000)                   = 0x23000
16:30:10 brk(0x24000)                   = 0x24000
16:30:10 brk(0x25000)                   = 0x25000
16:30:10 write(5, "cd /scsi/tmp\ncase hppa-unknown-linux-gnu in\n*-*-sysv4* | \\\ni?86-*-sysv5* | \\\ni?86-*-udk* | \\\ni?86-*-solaris2.[0-4] | \\\npowerpcle-*-solaris2.[0-4] | \\\nsparc-*-solaris2.[0-4] )\n    echo run ;;\n* ) echo skip ;;\nesac\n\necho\necho ShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 256) = 256
16:30:10 alarm(10)                      = 0
16:30:10 read(6, "skip\n\nShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 4096) = 38
16:30:10 alarm(10)                      = 10
16:30:10 alarm(10)                      = 10
16:30:10 alarm(0)                       = 10
16:30:10 brk(0x26000)                   = 0x26000
16:30:10 rt_sigaction(SIGQUIT, {SIG_IGN}, {SIG_DFL}, 8) = 0
16:30:10 rt_sigaction(SIGABRT, {SIG_IGN}, {SIG_DFL}, 8) = 0
16:30:10 rt_sigaction(SIGPIPE, {SIG_IGN}, {0x1664e, [STKFLT RT_2 RT_5 RT_6 RT_8 RT_9 RT_10 RT_12 RT_14 RT_16], SA_RESTART}, 8) = 0
16:30:10 rt_sigaction(SIGALRM, {SIG_IGN}, {0x1664e, [STKFLT RT_2 RT_5 RT_6 RT_8 RT_9 RT_10 RT_12 RT_14 RT_16], SA_RESTART}, 8) = 0
16:30:10 rt_sigaction(SIGTERM, {SIG_IGN}, {SIG_DFL}, 8) = 0
16:30:10 ioctl(2, 0x40245410, {B9600 opost isig icanon echo ...}) = 0
16:30:10 newfstat(0, {st_mode=S_IFIFO|0600, st_size=13, ...}) = 0
16:30:10 mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4015d000
16:30:10 read(0, "./sys/stat.h\n", 4096) = 13
16:30:10 read(0, "", 4096)              = 0
16:30:10 close(0)                       = 0
16:30:10 munmap(0x4015d000, 4096)       = 0
16:30:10 open("/dev/null", O_RDONLY|O_LARGEFILE) = 0
16:30:10 access("sys/stat.h", R_OK)     = 0
16:30:10 newstat("sys/stat.h", {st_mode=S_IFREG|0644, st_size=12006, ...}) = 0
16:30:10 open("sys/stat.h", O_RDONLY)   = 4
16:30:10 mmap(NULL, 12007, PROT_READ, MAP_PRIVATE, 4, 0) = 0x4015d000
16:30:10 write(2, " 12007 sys/stat.h                                           \r", 61) = 61
16:30:10 write(5, "cd /scsi/tmp\nfile=sys/stat.h\nif ( test  -r types/vxTypesOld.h ) > /dev/null 2>&1\nthen echo TRUE\nelse echo FALSE\nfi\n\necho\necho ShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 158) = 158
16:30:10 alarm(10)                      = 0
16:30:10 read(6, "FALSE\n", 4096)       = 6
16:30:10 alarm(10)                      = 10
16:30:10 read(6, "FALSE\nShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 4096) = -512
16:30:20 --- SIGALRM (Alarm clock) ---
16:30:20 read(6, "FALSE\nShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 4096) = -512
18:49:04 --- SIGINT (Interrupt) ---
18:49:04 +++ killed by SIGINT +++
