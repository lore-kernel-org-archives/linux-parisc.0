Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.istop.com (cpu1693.adsl.bellglobal.com [206.47.27.174])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1300F482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  2 Jan 2002 18:34:22 -0700 (MST)
Received: from old@istop.magma.ca (herbr.istop.com [216.187.107.13])
	by ns.istop.com (Postfix) with ESMTP id CC12517016
	for <parisc-linux@lists.parisc-linux.org>; Wed,  2 Jan 2002 20:34:31 -0500 (EST)
Message-Id: <5.1.0.14.0.20020102201841.0302dec0@mail.magma.ca>
Date: Wed, 02 Jan 2002 20:33:54 -0500
To: parisc-linux@lists.parisc-linux.org
From: Herb Radford <herbr@magma.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: [parisc-linux] Problem with Samba on a D370
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

OK, I'm trying to set up Samba on this D370 and have a small problem.
SMBD daemon starts but fails with "failed to open /etc/samba/secrets.tdb".
So I tried "strace -f smbd -D" and thats where I run out of knowledge!
I'm including the strace output but to me it looks like something I read on 
the Samba mailing list archives while poking about for an answer. It seems 
that there was some problem with 64-bit vs. 32-bit parameters at one time 
(I think in 2.2-2 which is what my version is) and I hope someone can give 
me a few pointers. ;) I don't know if this is  a Samba problem or a Debian 
problem so I'll just ask!

Do a search on secrets and the line in question is 8 lines later where 
fcntl returns EINVAL for a start of -84932400??? which is 0xfaf008d0, 
uncommonly similar to part of the LLSEEK parameter 2 line above.

Well that's my thought anyway.

Regards, Herb

1055  execve("/usr/sbin/smbd", ["smbd", "-D"], [/* 14 vars */]) = 0
1055  newuname({sys="Linux", node="HP-D370", ...}) = 0
1055  brk(0)                            = 0x1e8000
1055  open("/etc/ld.so.preload", O_RDONLY) = -1 ENOENT (No such file or 
directory)
1055  open("/etc/ld.so.cache", O_RDONLY) = 3
1055  fstat64(3, {st_mode=0, st_size=0, ...}) = 0
1055  mmap(NULL, 5568, PROT_READ, MAP_PRIVATE, 3, 0) = 0x40019000
1055  close(3)                          = 0
1055  open("/usr/lib/libcups.so.2", O_RDONLY) = 3
1055  read(3, 
"\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\0E\330"..., 1024) = 1024
1055  fstat64(3, {st_mode=0, st_size=0, ...}) = 0
1055  mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 
0) = 0x4001b000
1055  mmap(NULL, 182992, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x4002a000
1055  mprotect(0x40044000, 76496, PROT_NONE) = 0
1055  mmap(0x40053000, 12288, PROT_READ|PROT_WRITE|PROT_EXEC, 
MAP_PRIVATE|MAP_FIXED, 3, 0x19000) = 0x40053000
1055  mmap(0x40056000, 2768, PROT_READ|PROT_WRITE|PROT_EXEC, 
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40056000
1055  close(3)                          = 0
1055  open("/lib/libdl.so.2", O_RDONLY) = 3
1055  read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\0\37"..., 
1024) = 1024
1055  fstat64(3, {st_mode=0, st_size=0, ...}) = 0
1055  mmap(NULL, 75588, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x40057000
1055  mprotect(0x4005a000, 63300, PROT_NONE) = 0
1055  mmap(0x40069000, 4096, PROT_READ|PROT_WRITE|PROT_EXEC, 
MAP_PRIVATE|MAP_FIXED, 3, 0x2000) = 0x40069000
1055  close(3)                          = 0
1055  open("/lib/libnsl.so.1", O_RDONLY) = 3
1055  read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\0IL"..., 
1024) = 1024
1055  fstat64(3, {st_mode=0, st_size=0, ...}) = 0
1055  mmap(NULL, 169920, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x4006a000
1055  mprotect(0x40081000, 75712, PROT_NONE) = 0
1055  mmap(0x40090000, 8192, PROT_READ|PROT_WRITE|PROT_EXEC, 
MAP_PRIVATE|MAP_FIXED, 3, 0x16000) = 0x40090000
1055  mmap(0x40092000, 6080, PROT_READ|PROT_WRITE|PROT_EXEC, 
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40092000
1055  close(3)                          = 0
1055  open("/lib/libpam.so.0", O_RDONLY) = 3
1055  read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\0\33"..., 
1024) = 1024
1055  fstat64(3, {st_mode=0, st_size=0, ...}) = 0
1055  mmap(NULL, 99184, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x40094000
1055  mprotect(0x4009c000, 66416, PROT_NONE) = 0
1055  mmap(0x400ab000, 8192, PROT_READ|PROT_WRITE|PROT_EXEC, 
MAP_PRIVATE|MAP_FIXED, 3, 0x7000) = 0x400ab000
1055  close(3)                          = 0
1055  open("/lib/libc.so.6", O_RDONLY)  = 3
1055  read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\2?@"..., 
1024) = 1024
1055  fstat64(3, {st_mode=0, st_size=0, ...}) = 0
1055  mmap(NULL, 1404268, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x400ad000
1055  mprotect(0x401e7000, 118124, PROT_NONE) = 0
1055  mmap(0x401f6000, 45056, PROT_READ|PROT_WRITE|PROT_EXEC, 
MAP_PRIVATE|MAP_FIXED, 3, 0x139000) = 0x401f6000
1055  mmap(0x40201000, 11628, PROT_READ|PROT_WRITE|PROT_EXEC, 
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40201000
1055  close(3)                          = 0
1055  open("/lib/libcrypt.so.1", O_RDONLY) = 3
1055  read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\0\v"..., 
1024) = 1024
1055  fstat64(3, {st_mode=0, st_size=0, ...}) = 0
1055  mmap(NULL, 247464, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x40204000
1055  mprotect(0x4020a000, 222888, PROT_NONE) = 0
1055  mmap(0x40219000, 4096, PROT_READ|PROT_WRITE|PROT_EXEC, 
MAP_PRIVATE|MAP_FIXED, 3, 0x5000) = 0x40219000
1055  mmap(0x4021a000, 157352, PROT_READ|PROT_WRITE|PROT_EXEC, 
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x4021a000
1055  close(3)                          = 0
1055  munmap(0x40019000, 5568)          = 0
1055  geteuid()                         = 0
1055  time(NULL)                        = 1009908465
1055  brk(0)                            = 0x1e8000
1055  brk(0x1e8030)                     = 0x1e8030
1055  brk(0x1e9000)                     = 0x1e9000
1055  open("/etc/localtime", O_RDONLY)  = 3
1055  fstat64(3, {st_mode=0, st_size=0, ...}) = 0
1055  mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 
0) = 0x40019000
1055  read(3, "TZif\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\2\0\0\0\2\0"..., 
4096) = 1218
1055  close(3)                          = 0
1055  munmap(0x40019000, 4096)          = 0
1055  open("/dev/urandom", O_RDONLY|O_LARGEFILE) = 3
1055  setresuid(ruid 0, euid 0, suid 0) = 0
1055  setuid(0)                         = 0
1055  geteuid()                         = 0
1055  getuid()                          = 0
1055  setresgid(rgid 0, egid 0, sgid 0) = 0
1055  setgid(0)                         = 0
1055  getegid()                         = 0
1055  getgid()                          = 0
1055  rt_sigaction(SIGSEGV, {0x196bee, [], SA_RESTART}, NULL, 8) = 0
1055  rt_sigaction(SIGBUS, {0x196bee, [], SA_RESTART}, NULL, 8) = 0
1055  rt_sigaction(SIGTERM, {0x19648e, [], SA_RESTART}, NULL, 8) = 0
1055  rt_sigprocmask(SIG_BLOCK, [PIPE], NULL, 8) = 0
1055  rt_sigprocmask(SIG_BLOCK, [FPE], NULL, 8) = 0
1055  rt_sigprocmask(SIG_BLOCK, [USR2], NULL, 8) = 0
1055  rt_sigprocmask(SIG_UNBLOCK, [HUP], NULL, 8) = 0
1055  rt_sigprocmask(SIG_UNBLOCK, [USR1], NULL, 8) = 0
1055  umask(0)                          = 022
1055  geteuid()                         = 0
1055  getegid()                         = 0
1055  getgroups(0, 0xfaf003c8)          = 1
1055  getgroups(1, [0])                 = 1
1055  umask(022)                        = 0
1055  open("/var/log/samba/log.smbd", 
O_WRONLY|O_APPEND|O_CREAT|O_LARGEFILE, 0666) = 4
1055  fstat64(4, {st_mode=0, st_size=0, ...}) = 0
1055  mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 
0) = 0x40019000
1055  fstat64(4, {st_mode=0, st_size=0, ...}) = 0
1055  _llseek(0x4, 0, 0x111e, 0xfaf00a88, 0) = 0
1055  munmap(0x40019000, 4096)          = 0
1055  umask(0)                          = 022
1055  umask(022)                        = 0
1055  open("/var/log/samba/log.smbd", 
O_WRONLY|O_APPEND|O_CREAT|O_LARGEFILE, 0666) = 5
1055  fstat64(5, {st_mode=0, st_size=0, ...}) = 0
1055  mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 
0) = 0x40019000
1055  fstat64(5, {st_mode=0, st_size=0, ...}) = 0
1055  _llseek(0x5, 0, 0x111e, 0xfaf00f08, 0) = 0
1055  munmap(0x40019000, 4096)          = 0
1055  close(4)                          = 0
1055  umask(0)                          = 022
1055  stat64("/etc/samba/smb.conf", {st_mode=0, st_size=0, ...}) = 0
1055  open("/etc/samba/smb.conf", O_RDONLY|O_LARGEFILE) = 4
1055  fstat64(4, {st_mode=0, st_size=0, ...}) = 0
1055  brk(0x1ec000)                     = 0x1ec000
1055  read(4, "# This is the main Samba configu"..., 8882) = 8882
1055  close(4)                          = 0
1055  getpid()                          = 1055
1055  brk(0x1ed000)                     = 0x1ed000
1055  open("/etc/printcap", O_RDONLY|O_LARGEFILE) = 4
1055  fstat64(4, {st_mode=0, st_size=0, ...}) = 0
1055  mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 
0) = 0x40019000
1055  read(4, "# /etc/printcap: printer capabil"..., 4096) = 643
1055  read(4, "", 4096)                 = 0
1055  close(4)                          = 0
1055  munmap(0x40019000, 4096)          = 0
1055  stat64("", 0xfaf00c90)            = -1 ENOENT (No such file or directory)
1055  umask(022)                        = 0
1055  open("/var/log/samba/log.smbd", 
O_WRONLY|O_APPEND|O_CREAT|O_LARGEFILE, 0666) = 4
1055  fstat64(4, {st_mode=0, st_size=0, ...}) = 0
1055  mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 
0) = 0x40019000
1055  fstat64(4, {st_mode=0, st_size=0, ...}) = 0
1055  _llseek(0x4, 0, 0x111e, 0xfaf01388, 0) = 0
1055  munmap(0x40019000, 4096)          = 0
1055  close(5)                          = 0
1055  umask(0)                          = 022
1055  stat64("/etc/samba/smb.conf", {st_mode=0, st_size=0, ...}) = 0
1055  umask(022)                        = 0
1055  open("/var/log/samba/log.smbd", 
O_WRONLY|O_APPEND|O_CREAT|O_LARGEFILE, 0666) = 5
1055  fstat64(5, {st_mode=0, st_size=0, ...}) = 0
1055  mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 
0) = 0x40019000
1055  fstat64(5, {st_mode=0, st_size=0, ...}) = 0
1055  _llseek(0x5, 0, 0x111e, 0xfaf00f08, 0) = 0
1055  munmap(0x40019000, 4096)          = 0
1055  close(4)                          = 0
1055  umask(0)                          = 022
1055  socket(PF_INET, SOCK_DGRAM, IPPROTO_IP) = 4
1055  ioctl(4, 0x8912, 0xfaf015d0)      = 0
1055  ioctl(4, 0x8915, 0xfaf01600)      = 0
1055  ioctl(4, 0x8913, 0xfaf01600)      = 0
1055  ioctl(4, 0x891b, 0xfaf01600)      = 0
1055  ioctl(4, 0x8915, 0xfaf015e0)      = 0
1055  ioctl(4, 0x8913, 0xfaf015e0)      = 0
1055  ioctl(4, 0x891b, 0xfaf015e0)      = 0
1055  close(4)                          = 0
1055  brk(0x1ef000)                     = 0x1ef000
1055  newuname({sys="Linux", node="HP-D370", ...}) = 0
1055  getrlimit(RLIMIT_NOFILE, {rlim_cur=1024, rlim_max=1024}) = 0
1055  setrlimit(RLIMIT_NOFILE, {rlim_cur=1024, rlim_max=10010}) = 0
1055  setrlimit(RLIMIT_NOFILE, {rlim_cur=10010, rlim_max=10010}) = 0
1055  getrlimit(RLIMIT_NOFILE, {rlim_cur=10010, rlim_max=10010}) = 0
1055  open("/etc/samba/secrets.tdb", O_RDWR|O_CREAT|O_LARGEFILE, 0600) = 4
1055  fcntl(4, F_SETLKW, {type=F_WRLCK, whence=SEEK_SET, start=1024, 
len=0}) = 0
1055  fcntl(4, F_SETLK, {type=F_WRLCK, whence=SEEK_SET, start=1024, len=0}) = 0
1055  read(4, "TDB file\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
168) = 168
1055  fstat64(4, {st_mode=0, st_size=0, ...}) = 0
1055  mmap2(NULL, 696, PROT_READ|PROT_WRITE, MAP_SHARED, 4, 0) = 0x40019000
1055  _llseek(0x4, 0, 0x28, 0xfaf00b48, 0) = 0
1055  write(4, "\0\0\0\0", 4)           = 4
1055  fcntl(4, F_SETLK, {type=F_UNLCK, whence=SEEK_SET, start=-84932400, 
len=0}) = -1 EINVAL (Invalid argument)
1055  munmap(0x40019000, 696)           = 0
1055  close(4)                          = 0
1055  time(NULL)                        = 1009908466
1055  brk(0x1f2000)                     = 0x1f2000
1055  time([1009908466])                = 1009908466
1055  getpid()                          = 1055
1055  rt_sigaction(SIGPIPE, {0x401fc39a, [], 0}, {SIG_DFL}, 8) = 0
1055  socket(PF_UNIX, SOCK_DGRAM, 0)    = 4
1055  fcntl(4, F_SETFD, FD_CLOEXEC)     = 0
1055  connect(4, {sin_family=AF_UNIX, path="/dev/log"}, 16) = 0
1055  send(4, "<27>Jan  1 13:07:46 smbd[1055]: "..., 91, 0) = 91
1055  rt_sigaction(SIGPIPE, {SIG_DFL}, NULL, 8) = 0
1055  geteuid()                         = 0
1055  fstat64(5, {st_mode=0, st_size=0, ...}) = 0
1055  write(5, "[2002/01/01 13:07:46, 0] passdb/"..., 59) = 59
1055  time([1009908466])                = 1009908466
1055  getpid()                          = 1055
1055  rt_sigaction(SIGPIPE, {0x401fc39a, [], 0}, {SIG_DFL}, 8) = 0
1055  send(4, "<27>Jan  1 13:07:46 smbd[1055]: "..., 72, 0) = 72
1055  rt_sigaction(SIGPIPE, {SIG_DFL}, NULL, 8) = 0
1055  geteuid()                         = 0
1055  write(5, "  Failed to open /etc/samba/secr"..., 40) = 40
1055  stat64("/usr/share/samba/codepages/codepage.850", {st_mode=0, 
st_size=0, ...}) = 0
1055  open("/usr/share/samba/codepages/codepage.850", O_RDONLY|O_LARGEFILE) = 6
1055  read(6, "\1\0R\3|\0\0\0", 8)      = 8
1055  read(6, 
"\205\267\1\1\240\265\1\1\203\266\1\1\306\307\1\1\204\216"..., 124) = 124
1055  close(6)                          = 0
1055  stat64("/usr/share/samba/codepages/unicode_map.850", {st_mode=0, 
st_size=0, ...}) = 0
1055  open("/usr/share/samba/codepages/unicode_map.850", 
O_RDONLY|O_LARGEFILE) = 6
1055  fstat64(6, {st_mode=0, st_size=0, ...}) = 0
1055  mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 
0) = 0x40019000
1055  read(6, "\1\200850\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\2\0\0\0\0"..., 
4096) = 4096
1055  mmap(NULL, 135168, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, 
-1, 0) = 0x40241000
1055  read(6, "\0_\0_\0_\0_\0_\0_\0_\0_\0_\0_\0_\0_\0_\0_\0_\0_"..., 
126976) = 126976
1055  read(6, "\0_\0_\0_\0_\0_\0_\0_\0_\0_\0_\0_\0_\0_\0_\0_\0_"..., 4096) 
= 542
1055  close(6)                          = 0
1055  munmap(0x40019000, 4096)          = 0
1055  rt_sigaction(SIGHUP, {0x19649e, [], SA_RESTART}, NULL, 8) = 0
1055  fork()                            = 1056
1055  --- SIGCHLD (Child exited) ---
1055  exit(0)                           = ?
