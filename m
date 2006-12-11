From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] kernel BUG at mm/mmap.c:1990
Date: Mon, 11 Dec 2006 23:38:13 +0100
Message-ID: <200612112338.13980.deller__24755.9057352648$1416624230$gmane$org@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: "parisc-linux" <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Maybe someone has an idea ?

The "adjtimex02" test from the Linux Test Project (http://ltp.sf.net) seems to pass all test, but triggers a kernel BUG in mm/mmap.c:1990 when exiting.
strace is attached below.


kernel BUG at mm/mmap.c:1990!

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111111100001011 Not tainted
r00-03  0006ff0b 105a6810 10123e10 776a33a0
r04-07  00000000 776a33a0 00000000 0002695e
r08-11  bff5200a 0004b6d8 0004b6d8 0004b6d8
r12-15  00050ed8 00050ed8 0004b6d8 00050ed8
r16-19  bff527d8 0004b6d8 0004b6d8 00000001
r20-23  00000036 00000035 0000000b 00000000
r24-27  000000e2 8713eb00 10642cc0 104e6010
r28-31  00000000 00100277 7a480200 1016e564
sr00-03  00000000 00000000 00000000 00005040
sr04-07  00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1015dc30 1015dc34
 IIR: 03ffe01f    ISR: 10240001  IOR: 8ea3ac00
 CPU:        0   CR30: 7a480000 CR31: 105d0000
 ORIG_R28: 00000000
 IAOQ[0]: exit_mmap+0x130/0x14c
 IAOQ[1]: exit_mmap+0x134/0x14c
 RP(r2): mmput+0x54/0xd0
Fixing recursive fault but reboot is needed!



root@c3000:~/ltp-full-20061121/testcases/kernel/syscalls/adjtimex# strace -f ./adjtimex02 2>&1 | tee strace.log
execve("./adjtimex02", ["./adjtimex02"], [/* 17 vars */]) = 0
newuname({sys="Linux", node="c3000", ...}) = 0
brk(0)                                  = 0x2c000
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40000000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
open("/opt/kde3/qt/lib/PARISC/libc.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/opt/kde3/qt/lib/PARISC", 0xc05d5488) = -1 ENOENT (No such file or directory)
open("/opt/kde3/qt/lib/libc.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/opt/kde3/qt/lib", {st_mode=0, st_size=0, ...}) = 0
open("/opt/kde3/lib/PARISC/libc.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/opt/kde3/lib/PARISC", 0xc05d5488) = -1 ENOENT (No such file or directory)
open("/opt/kde3/lib/libc.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
stat64("/opt/kde3/lib", {st_mode=0, st_size=0, ...}) = 0
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 67082, PROT_READ, MAP_PRIVATE, 3, 0) = 0x40214000
close(3)                                = 0
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\1\364"..., 512) = 512
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 1364696, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x405c3000
mprotect(0x406f3000, 119512, PROT_NONE) = 0
mmap(0x40702000, 53248, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x12f000) = 0x40702000
mmap(0x4070f000, 4824, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x4070f000
close(3)                                = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40001000
munmap(0x40214000, 67082)               = 0
brk(0)                                  = 0x2c000
brk(0x4d000)                            = 0x4d000
geteuid()                               = 0
rt_sigaction(SIGHUP, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGINT, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGQUIT, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGILL, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGTRAP, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGABRT, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGEMT, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGFPE, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGBUS, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGSEGV, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGSYS, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGPIPE, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGALRM, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGTERM, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGUSR1, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGUSR2, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGCHLD, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGPWR, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGVTALRM, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGPROF, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGIO, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGWINCH, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGTSTP, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGTTIN, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGTTOU, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGURG, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGLOST, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGUNUSED, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIG_32, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGXCPU, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGXFSZ, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIG_35, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGSTKFLT, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigaction(SIGRT_16, {0x26866, [], SA_RESTART}, {SIG_DFL}, 8) = 0
adjtimex({modes=0, offset=0, freq=0, maxerror=16384000, esterror=16384000, status=64, constant=2, precision=1, tolerance=33554432, time={1165876228, 740054}}) = 5
adjtimex(0xffffffff)                    = -1 EFAULT (Bad address)
fstat64(1, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40003000
adjtimex(0x26ae4)                       = -1 EINVAL (Invalid argument)
adjtimex(0x26ae4)                       = -1 EINVAL (Invalid argument)
adjtimex(0x26ae4)                       = -1 EINVAL (Invalid argument)
adjtimex(0x26ae4)                       = -1 EINVAL (Invalid argument)
socket(PF_FILE, SOCK_STREAM, 0)         = 3
fcntl64(3, F_GETFL)                     = 0x2 (flags O_RDWR)
fcntl64(3, F_SETFL, O_RDWR|O_NONBLOCK)  = 0
connect(3, {sa_family=AF_FILE, path="/var/run/nscd/socket"}, 110) = 0
poll([{fd=3, events=POLLOUT|POLLERR|POLLHUP, revents=POLLOUT}], 1, 5000) = 1
writev(3, [{"\0\0\0\2\0\0\0\v\0\0\0\7", 12}, {"passwd\0", 7}], 2) = 19
poll([{fd=3, events=POLLIN|POLLERR|POLLHUP, revents=POLLIN|POLLHUP}], 1, 5000) = 1
recvmsg(3, {msg_name(0)=NULL, msg_iov(1)=[{"passwd\0", 7}], msg_controllen=16, {cmsg_len=16, cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, {4}}, msg_flags=0}, MSG_NOSIGNAL) = 7
fstat64(4, {st_mode=0, st_size=0, ...}) = 0
pread(4, "\0\0\0\1\0\0\0h\0\0\0\320\0\0\0\0\0\0\0\0E}\255B\0\0\0"..., 104, 0) = 104
time(NULL)                              = 1165876228
close(4)                                = 0
close(3)                                = 0
socket(PF_FILE, SOCK_STREAM, 0)         = 3
fcntl64(3, F_GETFL)                     = 0x2 (flags O_RDWR)
fcntl64(3, F_SETFL, O_RDWR|O_NONBLOCK)  = 0
connect(3, {sa_family=AF_FILE, path="/var/run/nscd/socket"}, 110) = 0
poll([{fd=3, events=POLLOUT|POLLERR|POLLHUP, revents=POLLOUT}], 1, 5000) = 1
writev(3, [{"\0\0\0\2\0\0\0\0\0\0\0\7", 12}, {"nobody\0", 7}], 2) = 19
poll([{fd=3, events=POLLIN|POLLERR|POLLHUP, revents=POLLIN|POLLHUP}], 1, 5000) = 1
read(3, "\0\0\0\2\0\0\0\1\0\0\0\7\0\0\0\2\0\0\377\376\0\0\377\376"..., 36) = 36
read(3, "nobody\0x\0nobody\0/nonexistent\0/bi"..., 37) = 37
close(3)                                = 0
setresuid(-1, 65534, -1)                = 0
adjtimex(0x26ae4)                       = -1 EPERM (Operation not permitted)
setresuid(-1, 0, -1)                    = 0
adjtimex({modes=16447, offset=0, freq=0, maxerror=16384000, esterror=16384000, status=64, constant=2, precision=1, tolerance=33554432, time={1165876228, 755765}}) = 5
write(1, "adjtimex02    1  PASS  :  Test P"..., 461adjtimex02    1  PASS  :  Test Passed, adjtimex() returned -1 with errno: 14
adjtimex02    2  PASS  :  Test Passed, adjtimex() returned -1 with errno: 22
adjtimex02    3  PASS  :  Test Passed, adjtimex() returned -1 with errno: 22
adjtimex02    4  PASS  :  Test Passed, adjtimex() returned -1 with errno: 22
adjtimex02    5  PASS  :  Test Passed, adjtimex() returned -1 with errno: 22
adjtimex02    6  PASS  :  Test Passed, adjtimex() returned -1 with errno: 1
) = 461
munmap(0x40003000, 4096)                = 0
exit_group(0)                           = ?


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
