From: Joel Soete <soete.joel@tiscali.be>
Subject: [parisc-linux] init pause() on some systems but not all?
Date: Thu, 29 Dec 2005 21:33:54 +0000
Message-ID: <43B45642.1050909@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
To: parisc-linux@lists.parisc-linux.org
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

Hello all,

I am experimentiting a very werid pb with some of my p-l boxes:

just after a fresh reboot, even after only some 2h, I can launch the reboot cmdl without pb.

But after some uptime, to 'reboot' them i need to force it with 'reboot -f' with inconvenience it supposes ;-(

mmm when the pb arises, simple 'reboot' just shows the common message as the system will reboot, but nothing hapen?

Any other telinit [S6] didn't respond more?

And if I kill a runing getty (a one launched by init at start up), init didn't respawn it?

I already tried:
     o to downgrade sysvinit, no help;
     o to stop nfs/portmap deamon (I read a similar reported about this), no help.

this occures on most systems but not all, see:

no pb on:
	o my c110 running k-2.6.14.4-vs2.1.0-pa0 and unstable debian
	o a b180 running k-2.6.14-pa0 and unstable debian too

but pb on:
	o n4k 64bit smp debian unstable (iirc k-2.6.15-rc6-pa1)
	o b2k 32bit up debian unstable & k-2.6.15-rc6-pa1
	o d380 32bit up debian testing & k-2.6.14.4-vs2.1.0-pa0 (i.e. nearly the same as c110)
	o another b180 runing the exactly the same k-2.6.14-pa0 as b180 above mentioned but debian testing
	o the last b180 runing k-2.6.15-rc6-pa0 (gcc-4.1) and debian unstable

Unfortunately no means to strace init:

# strace -p 1
attach: ptrace(PTRACE_ATTACH, ...): Operation not permitted
(the same on my i386 ;-( )

Anyway Mike help me to figure out that on affected systems, top (with addtional field WCHAN = Sleeping in Function)
init is in 'pause' not on the others (where it's in select)?

I tried following 'Watch_Init' script on d380 and b2k:
#!/bin/sh
#set -x

AWK="/usr/bin/awk"
CAT="/bin/cat"
DATE="/bin/date"
GREP="/bin/grep"
TOP="/usr/bin/top"
TOPRC="/root/.toprc"
TEE="/usr/bin/tee"

if [ -f $TOPRC ]
then
     echo "$TOPRC exist: please save it before retry."
     exit 1
fi

$CAT > $TOPRC <<EOF
RCfile for "top with windows"           # shameless braggin'
Id:a, Mode_altscr=0, Mode_irixps=1, Delay_time=3.000, Curwin=0
Def     fieldscur=AEHIOQTWKNMbcdfgjplrsuvYzX
         winflags=62777, sortindx=10, maxtasks=0
         summclr=1, msgsclr=1, headclr=3, taskclr=1
Job     fieldscur=ABcefgjlrstuvyzMKNHIWOPQDX
         winflags=62777, sortindx=0, maxtasks=0
         summclr=6, msgsclr=6, headclr=7, taskclr=6
Mem     fieldscur=ANOPQRSTUVbcdefgjlmyzWHIKX
         winflags=62777, sortindx=13, maxtasks=0
         summclr=5, msgsclr=5, headclr=4, taskclr=5
Usr     fieldscur=ABDECGfhijlopqrstuvyzMKNWX
         winflags=62777, sortindx=4, maxtasks=0
         summclr=3, msgsclr=3, headclr=2, taskclr=3
EOF

while true
do
     # Sleeping in Function
     WCHAN=$($TOP -p1 -n1 -b | $GREP "    1 root" | $AWK '{print $12}')
     if [ "X$WCHAN" != "Xselect" ]
     then
         break
     else
         sleep 5
     fi
done

$TOP -n1 -b 2>&1 | $TEE /var/logs/Watch_Init.doc

$DATE 2>&1  | $TEE -a /var/logs/Watch_Init.doc

exit 0
====<>====

may be not enough accurate because when it capture the 'switch', the 2 systems where doing different thing:
the d380:
top - 07:40:58 up 12:29,  2 users,  load average: 2.96, 1.80, 0.88
Tasks:  72 total,   3 running,  69 sleeping,   0 stopped,   0 zombie
Cpu(s):  4.4% us,  8.5% sy,  1.1% ni, 84.8% id,  1.1% wa,  0.0% hi,  0.1% si
Mem:    254716k total,   249192k used,     5524k free,    72340k buffers
Swap:   517480k total,        0k used,   517480k free,    66908k cached

   PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  WCHAN     COMMAND
  5956 root      17   0  2900 1340 1024 R  7.3  0.5  13:49.14 syscall_d top
16067 root      16   0  2896 1224  924 R  7.3  0.5   0:00.25 read      top
16072 root      29  10  1368  132  108 R  3.7  0.1   0:00.03 syscall_d cracklib-
16068 root      20   0  1744  528  420 S  2.4  0.2   0:00.03 pipe_wait tee
  1756 jso       16   0  9676 1884 1184 S  1.2  0.7   0:27.06 select    sshd
     1 root      16   0  2292  808  664 S  0.0  0.3   0:48.35 pause     init
     2 root      34  19     0    0    0 S  0.0  0.0   0:00.00 ksoftirqd ksoftirqd
     3 root      RT   0     0    0    0 S  0.0  0.0   0:00.05 msleep_in watchdog/
     4 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 worker_th events/0
...
Thu Dec 29 07:40:59 CET 2005

the b2k:
top - 07:36:21 up 12:21,  3 users,  load average: 1.80, 0.61, 0.25
Tasks:  81 total,   1 running,  80 sleeping,   0 stopped,   0 zombie
Cpu(s):  1.6% us,  2.9% sy,  0.9% ni, 93.9% id,  0.6% wa,  0.0% hi,  0.0% si
Mem:    251828k total,   211644k used,    40184k free,    81176k buffers
Swap:   255928k total,        0k used,   255928k free,    90496k cached

   PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  WCHAN     COMMAND
  7749 root      17   2  2952 1220  920 R  3.7  0.5   0:00.06 alloc_pag top
  1736 root      16   0  2956 1344 1032 S  1.9  0.5  24:30.59 select    top
  7744 nobody    34  19  3584 1224  824 D  1.9  0.5   0:00.38 sync_buff find
     1 root      15   0  1764  684  564 S  0.0  0.3   0:11.50 pause     init
     2 root      34  19     0    0    0 S  0.0  0.0   0:00.00 ksoftirqd ksoftirqd
     3 root      RT   0     0    0    0 S  0.0  0.0   0:00.00 msleep_in watchdog/
     4 root      10  -5     0    0    0 S  0.0  0.0   0:04.52 worker_th events/0
...
Thu Dec 29 07:36:21 CET 2005

in fine, all seems different?

Am i the only one who experiment such pb?

Any idea how may I better tracing this pb? (lttng? for 2.6.14 only)

Thanks in advance,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
