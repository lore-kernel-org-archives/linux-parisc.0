From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] new gcc-default for hppa
Date: Thu, 16 Jan 2003 12:35:18 +0100
Message-ID: <3E1AAEFA00001880__22245.9681252532$1416622125$gmane$org@ocpmta6.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: "Randolph Chung" <tausq@debian.org>,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
To: grundler@dsl2.external.hp.com
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

...
>
>Or make them available via http or ftp.

The best idea I had, was to put those stuff on a testdrive server but Ran=
dolph
do not have access.

>Otherwise, posting what symbols the IAOQ/GR02 values point at
>is even better.
>
>> I also forget to recall: this only occurs for incoming ethernet trafic=
(ie
>> ssh, telnet, ftp, coming from an external server). The outgoing traffi=
c
>> works fine (I just do a telnet and a ftp from this server to an extern=
al
>> one without crash)
>
>Interesting. "outgoing" has both inbound and outbound data.
>That doesn't sound like a tulip driver bug though it's certainly
>possible.
>
>Have you tried sending UDP (not TCP) traffic?
>(Not sure how to do that...suggestions?)

Well as per Jeremy suggestion I do some following test and obtain strange=

results:

from the 'server' runing gcc32 kernel
cat /something | nc -u host 23
# no problem
cat /samething | nc host 23
# no problem
telnet host
...
# no problem

OTC from an external server to this gcc32 kernel server (which I call pal=
x)

cat /something | nc -u palx 23
# no problem

cat /samething | nc palx 23
# ??? no problem and that is strange because I well address the same 'tel=
net'
port

telnet palx

immediate crash?

so I try to strace telnetd and make it leasen on a port 6800
nohup /usr/sbin/in.telnetd -debug 6800 &

palx2000:~# strace -p  324
poll([{fd=3D3, events=3DPOLLIN, revents=3DPOLLIN}], 1, -1) =3D 1
accept(3, 0, NULL)                      =3D 4
dup2(4, 0)                              =3D 0
close(4)                                =3D 0
close(3)                                =3D 0
lock(0, {sa_family=3DAF_INET, sin_port=3Dhtons(1187), sin_addr=3Dinet_add=
r("172.16.248.169")},
[16]) =3D 0
setsockopt(0, SOL_SOCKET, SO_KEEPALIVE, [1], 4) =3D 0
setsockopt(0, SOL_IP, IP_TOS, [16], 4)  =3D 0
open("/dev/ptmx", O_RDWR)               =3D 3
statfs("/dev/pts", {f_type=3D"DEVPTS_SUPER_MAGIC", f_bsize=3D1024, f_bloc=
ks=3D0,
f_bfree=3D0, f_files=3D0, f_ffree=3D0, f_namelen=3D255}) =3D 0
ioctl(3, 0x40245410, {B38400 opost isig icanon echo ...}) =3D 0
ioctl(3, 0x40045430, [0])               =3D 0
stat64("/dev/pts/0", {st_mode=3D0, st_size=3D5, ...}) =3D 0
statfs("/dev/pts/0", {f_type=3D"DEVPTS_SUPER_MAGIC", f_bsize=3D1024, f_bl=
ocks=3D0,
f_bfree=3D0, f_files=3D0, f_ffree=3D0, f_namelen=3D255}) =3D 0
ioctl(3, 0x80045431, [0])               =3D 0
ioctl(3, 0x40245410, {B38400 opost isig icanon echo ...}) =3D 0
ioctl(3, 0x40045430, [0])               =3D 0
stat64("/dev/pts/0", {st_mode=3D0, st_size=3D5, ...}) =3D 0
open("/dev/pts/0", O_RDWR|O_NOCTTY)     =3D 4
ioctl(4, 0x40245410, {B38400 opost isig icanon echo ...}) =3D 0
readlink("/proc/self/fd/4", "/dev/pts/0", 4095) =3D 10
socket(PF_UNIX, SOCK_STREAM, 0)         =3D 5
connect(5, {sa_family=3DAF_UNIX, path=3D"/var/run/.nscd_socket"}, 110) =3D=
 -1
ENOENT (No such file or directory)
close(5)                                =3D 0
open("/etc/nsswitch.conf", O_RDONLY)    =3D 5
fstat64(5, {st_mode=3D0, st_size=3D0, ...}) =3D 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
=3D 0x40017000
read(5, "# /etc/nsswitch.conf\n#\n# Example"..., 4096) =3D 465
read(5, "", 4096)                       =3D 0
close(5)                                =3D 0
munmap(0x40017000, 4096)                =3D 0
open("/etc/ld.so.cache", O_RDONLY)      =3D 5
fstat64(5, {st_mode=3D0, st_size=3D0, ...}) =3D 0
mmap(NULL, 25974, PROT_READ, MAP_PRIVATE, 5, 0) =3D 0x40017000
close(5)                                =3D 0
open("/lib/libnss_files.so.2", O_RDONLY) =3D 5
read(5, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\0(\234"...,
1024) =3D 1024
fstat64(5, {st_mode=3D0, st_size=3D0, ...}) =3D 0
mmap(NULL, 116188, PROT_READ|PROT_EXEC, MAP_PRIVATE, 5, 0) =3D 0x40196000=

mprotect(0x401a2000, 67036, PROT_NONE)  =3D 0
mmap(0x401b1000, 8192, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FI=
XED,
5, 0xb000) =3D 0x401b1000
close(5)                                =3D 0
munmap(0x40017000, 25974)               =3D 0
gettimeofday({1042712090, 356267}, NULL) =3D 0
getpid()                                =3D 324
open("/etc/resolv.conf", O_RDONLY)      =3D 5
fstat64(5, {st_mode=3D0, st_size=3D0, ...}) =3D 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
=3D 0x40017000
read(5, "", 4096)                       =3D 0
close(5)                                =3D 0
munmap(0x40017000, 4096)                =3D 0
newuname({sys=3D"Linux", node=3D"palx2000", ...}) =3D 0
open("/etc/host.conf", O_RDONLY)        =3D 5
fstat64(5, {st_mode=3D0, st_size=3D0, ...}) =3D 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
=3D 0x40017000
read(5, "order hosts,bind\nmulti on\n", 4096) =3D 26
read(5, "", 4096)                       =3D 0
close(5)                                =3D 0
munmap(0x40017000, 4096)                =3D 0
open("/etc/hosts", O_RDONLY)            =3D 5
fcntl64(5, F_GETFD)                     =3D 0
fcntl64(5, F_SETFD, FD_CLOEXEC)         =3D 0
fstat64(5, {st_mode=3D0, st_size=3D0, ...}) =3D 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
=3D 0x40017000
read(5, "127.0.0.1\tlocalhost\n172.16.248.1"..., 4096) =3D 484
close(5)                                =3D 0
munmap(0x40017000, 4096)                =3D 0
newuname({sys=3D"Linux", node=3D"palx2000", ...}) =3D 0
open("/etc/hosts", O_RDONLY)            =3D 5
fcntl64(5, F_GETFD)                     =3D 0
fcntl64(5, F_SETFD, FD_CLOEXEC)         =3D 0
fstat64(5, {st_mode=3D0, st_size=3D0, ...}) =3D 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
=3D 0x40017000
read(5, "127.0.0.1\tlocalhost\n172.16.248.1"..., 4096) =3D 484
read(5, "", 4096)                       =3D 0
close(5)                                =3D 0
munmap(0x40017000, 4096)                =3D 0
open("/etc/hosts", O_RDONLY)            =3D 5
fcntl64(5, F_GETFD)                     =3D 0
fcntl64(5, F_SETFD, FD_CLOEXEC)         =3D 0
fstat64(5, {st_mode=3D0, st_size=3D0, ...}) =3D 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
=3D 0x40017000
read(5, "127.0.0.1\tlocalhost\n172.16.248.1"..., 4096) =3D 484
read(5, "", 4096)                       =3D 0
close(5)                                =3D 0
munmap(0x40017000, 4096)                =3D 0
socket(PF_UNIX, SOCK_STREAM, 0)         =3D 5
connect(5, {sa_family=3DAF_UNIX, path=3D"/var/run/.nscd_socket"}, 110) =3D=
 -1
ENOENT (No such file or directory)
close(5)                                =3D 0
open("/etc/hosts", O_RDONLY)            =3D 5
fcntl64(5, F_GETFD)                     =3D 0
fcntl64(5, F_SETFD, FD_CLOEXEC)         =3D 0
fstat64(5, {st_mode=3D0, st_size=3D0, ...}) =3D 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
=3D 0x40017000
read(5, "127.0.0.1\tlocalhost\n172.16.248.1"..., 4096) =3D 484
close(5)                                =3D 0
munmap(0x40017000, 4096)                =3D 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
=3D 0x40017000
writev(0, [{"\377\375\30", 3}, {"\377\375 ", 3}, {"\377\375#", 3}, {"\377=
\375\'",
3}], 4) =3D 12
read(0, "#!/usr/bin/env ruby \n\nrequire \'g"..., 8192) =3D 4236
read(0, "", 8192)                       =3D 0
brk(0)                                  =3D 0x35000
brk(0x37000)                            =3D 0x37000
time([1042712118])                      =3D 1042712118
brk(0)                                  =3D 0x37000
brk(0x38000)                            =3D 0x38000
open("/etc/localtime", O_RDONLY)        =3D 5
fstat64(5, {st_mode=3D0, st_size=3D0, ...}) =3D 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
=3D 0x40019000
read(5, "TZif\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\n\0"..., 4096=
)
=3D 1067
close(5)                                =3D 0
munmap(0x40019000, 4096)                =3D 0
getpid()                                =3D 324
rt_sigaction(SIGPIPE, {0x4018fa3a, [], 0}, {SIG_DFL}, 8) =3D 0
socket(PF_UNIX, SOCK_DGRAM, 0)          =3D 5
fcntl64(5, F_SETFD, FD_CLOEXEC)         =3D 0
connect(5, {sa_family=3DAF_UNIX, path=3D"/dev/log"}, 16) =3D 0
send(5, "<30>Jan 16 11:15:18 telnetd[324]"..., 57, 0) =3D 57
rt_sigaction(SIGPIPE, {SIG_DFL}, NULL, 8) =3D 0
munmap(0x40017000, 8192)                =3D 0
exit(1)                                 =3D ?


palx2000:~# strace -p  324 palx2000:~# ps -ef | grep telnetdpalx2000:~#
lrt   nohup /usr/sbin/in.telnetd -debug 6800 &
[1] 332
palx2000:~# nohup: appending output to `nohup.out'
nohup /usr/sbin/in.telnetd -debug 6800 &palx2000:~# more nohup.out palx20=
00:~#
strace -p  324 palx2000:~# ps -ef | grep telnetd
root       332   285  0 11:15 ttyS0    00:00:00 /usr/sbin/in.telnetd -deb=
ug
6800
root       336   285  0 11:15 ttyS0    00:00:00 grep telnetd
palx2000:~# ps -ef | grep telnetdpalx2000:~# nohup /usr/sbin/in.telnetd
-debug 6800 &palx2000:~# more nohup.out palx2000:~# strace -p  324
       332 2>&1 | tee /var/logs/StraceTelnetdDebug.doc
poll([{fd=3D3, events=3DPOLLIN, revents=3DPOLLIN}], 1, -1) =3D 1
accept(3, 0, NULL)                      =3D 4
dup2(4, 0)                              =3D 0
close(4)                                =3D 0
close(3)                                =3D 0
lock(0, {sa_family=3DAF_INET, sin_port=3Dhtons(1188), sin_addr=3Dinet_add=
r("172.16.248.169")},
[16]) =3D 0
setsockopt(0, SOL_S
Stack Dump:
 1c6a1b80:  0004ff0e 00000000 00000000 00000000
 1c6a1b70:  00000000 00000000 00000000 00000000
 1c6a1b60:  00000000 00000000 00000000 00000001
 1c6a1b50:  143133fc 00000001 00000003 14313340
 1c6a1b40:  5455509e 00000000 00000000 00000000
 1c6a1b30:  00000000 102bc794 00000000 1811fb60

Kernel addresses on the stack:
 [<102bc794>]  [<10299a38>]  [<102bf3fc>]  [<102c6b90>]
 [<102c38dc>]  [<10126298>]  [<10125cf4>]  [<1012256c>]
 [<1012241c>]  [<10122154>]  [<10109078>]  [<101e2a10>]
 [<101e2a0c>]  [<1013ff24>]  [<1013e3e4>]  [<1014ec28>]
 [<101e49c4>]  [<101e1678>]  [<101e1710>]  [<101e1710>]
 [<101e49c4>]  [<101e07d8>]  [<101e0e7c>]  [<101e11c8>]
 [<101e2b28>]  [<101e1710>]  [<101e49c4>]  [<101e07d8>]
 [<101e0e7c>]  [<101e11c8>]  [<101e2b28>]  [<101e1710>]
 [<101e49c4>]  [<101e07d8>]  [<101e0e7c>]  [<101e11c8>]
 [<101e2b28>]  [<101e1710>]  [<101e49c4>]  [<101e07d8>]
 [<101e0e7c>]  [<101e11c8>]  [<101e2b28>]  [<101e1710>]
 [<101e49c4>]  [<101e07d8>]  [<101e0e7c>]  [<101e11c8>]
 [<101e2b28>]  [<101e1710>]  [<101e49c4>]  [<101e07d8>]
 [<101e0e7c>]  [<101e11c8>]  [<101e2b28>]  [<101e1710>]
 [<101e49c4>]  [<101e07d8>]  [<101e0e7c>]  [<101e11c8>]
 [<101e2b28>]  [<101e1710>]  [<101e49c4>]  [<101e07d8>]
 [<101e0e7c>]  [<101e11c8>]  [<101e2b28>]  [<101e1710>]
 [<101e49c4>]  [<101e07d8>]  [<101e0e7c>]

Kernel Fault: Code=3D26 regs=3D1c6a1b80 (Addr=3D00000001)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001110 Not tainted
r00-03  00000000 10340810 10299a38 1c6a1b00
r04-07  19ba8810 103a58b4 1f37586c 00000001
r08-11  10340bc0 00000001 0000000f 10342810
r12-15  103fc010 00000000 0000b71b 00035054
r16-19  1c6a1600 faf00208 000020a8 19ba8810
r20-23  00000000 00000001 10299a08 00000005
r24-27  00000001 00000001 1f37586c 10330010
r28-31  00000000 00000000 1c6a1b80 102bf3fc
sr0-3   00000000 00000383 00000000 00000383
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1011a73c 1011a740
 IIR: 0ea01093    ISR: 00000000  IOR: 00000001
 CPU:        0   CR30: 19a90000 CR31: 103e8000
 ORIG_R28: 00000000

For which crash dump_analyser.sh give me:
IAOQ =3D 1011a73c
Func: __wake_up, Off: 64, Addr: 0x1011a73c
1011a730:	34 28 07 60 	ldo 3b0(r1),r8
1011a734:	0c 99 10 95 	ldw -4(sr0,r4),r21
1011a738:	34 14 00 00 	ldi 0,r20
1011a73c:	0e a0 10 93 	ldw 0(sr0,r21),r19
1011a77c:	88 86 3f 6f 	cmpb,<>,n r6,r4,1011a738 <__wake_up+0x60>

GR0 =3D 00000000

GR1 =3D 10340810
Func: syscall_names, Off: 39c, Addr: 0x10340810

GR2 =3D 10299a38
Func: sock_def_readable, Off: 30, Addr: 0x10299a38
10299a14:	86 80 20 38 	cmpib,=3D 0,r20,10299a38 <sock_def_readable+0x30>
10299a28:	82 74 20 10 	cmpb,=3D r20,r19,10299a38 <sock_def_readable+0x30>=

10299a30:	e8 4f 04 e8 	b,l 102b7cac <tcp_recvmsg+0xa3c>,rp
10299a34:	08 00 02 40 	nop
10299a38:	48 73 05 a8 	ldw 2d4(r3),r19
10299a3c:	86 60 20 2a 	cmpib,=3D,n 0,r19,10299a58 <sock_def_readable+0x50=
>

GR3 =3D 1c6a1b00

GR4 =3D 19ba8810

GR5 =3D 103a58b4
Func: identify_ramdisk_image, Off: 78, Addr: 0x103a58b4
103a58b0:	08 04 02 58 	copy r4,r24
103a58b4:	0c 60 10 14 	ldb 0(sr0,r3),r20
103a58b8:	34 13 00 3e 	ldi 1f,r19
103a58bc:	82 93 22 58 	cmpb,=3D r19,r20,103a59f0 <identify_ramdisk_image+=
0x1b4>

GR6 =3D 1f37586c

GR7 =3D 00000001

GR8 =3D 10340bc0
Func: runqueue_head, Off: 0, Addr: 0x10340bc0

GR9 =3D 00000001

GR10 =3D 0000000f

GR11 =3D 10342810
Func: kstat, Off: 1bf8, Addr: 0x10342810

GR12 =3D 103fc010
Func: tv1, Off: 358, Addr: 0x103fc010

GR13 =3D 00000000

GR14 =3D 0000b71b

GR15 =3D 00035054

GR16 =3D 1c6a1600

GR17 =3D faf00208

GR18 =3D 000020a8

GR19 =3D 19ba8810

GR20 =3D 00000000

GR21 =3D 00000001

GR22 =3D 10299a08
Func: sock_def_readable, Off: 0, Addr: 0x10299a08
10299a00:	34 42 3f d9 	ldo -14(rp),rp
10299a04:	08 00 02 40 	nop
10299a08 <sock_def_readable>:
10299a08:	6b c2 3f d9 	stw rp,-14(sp)
10299a0c:	6f c3 00 80 	stw,ma r3,40(sp)

GR23 =3D 00000005

GR24 =3D 00000001

GR25 =3D 00000001

GR26 =3D 1f37586c

GR27 =3D 10330010
Func: $global$, Off: 0, Addr: 0x10330010

GR28 =3D 00000000

GR29 =3D 00000000

GR30 =3D 1c6a1b80

GR31 =3D 102bf3fc
Func: tcp_rcv_established, Off: 6bc, Addr: 0x102bf3fc
102bf3f0:	34 19 00 00 	ldi 0,r25
102bf3f4:	e6 c0 20 00 	be,l 0(sr4,r22),%sr0,%r31
102bf3f8:	08 1f 02 42 	copy r31,rp
102bf3fc:	e8 1f 15 55 	b,l 102beeac <tcp_rcv_established+0x16c>,r0

(nothing change for kernel)

That does not help me more but may be somebody else?



>
>You have any iptables (firewall) filtering enabled?
>

I check and there well iptables foreseen as module bu not loaded?

>Maybe an issue with opening a new connection in the interrupt context?
>My weak understanding of the network stack is that a TCP packet comes
>in with SYN (on the interrupt stack) and gets queued for the bottom
>half. The bottom half is invoked with interrupts re-enabled but
>on the kernel stack in the "interrupt context". Did I get that right?
>
IIRC Carlos suspect a tty problem?

hth,
Joel



*********************************************
Vous surfez toujours avec une ligne classique ?
Faites des economies avec Tiscali Complete...
Plus d'info sur ... http://complete.tiscali.be
