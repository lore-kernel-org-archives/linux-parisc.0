Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8B026486B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 10 Jul 2002 05:35:16 -0600 (MDT)
Date: Wed, 10 Jul 2002 13:35:13 +0200
Subject: Re: [parisc-linux] SMP (in)stability
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v482)
Cc: tsbogend@alpha.franken.de, Jeremy Drake <jeremyd@apptechsys.com>,
	Grant Grundler <grundler@dsl2.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
To: Thibaut VARENE <varenet@esiee.fr>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <8CE455AF-93F4-11D6-BEE2-0030656F07A2@esiee.fr>
Message-Id: <19AB0C7A-93F9-11D6-BEE2-0030656F07A2@esiee.fr>
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

Le mercredi 10 juillet 2002, =E0 01:02 , Thibaut VARENE a =E9crit :

>
> Le mercredi 10 juillet 2002, =E0 11:24 , Thomas Bogendoerfer a =E9crit =
:
>
>> On Wed, Jul 10, 2002 at 10:51:09AM +0200, Thibaut VARENE wrote:
>>> It also seems to me (though i cannot confirm atm) that the 'PIO =
mode'=20
>>> in
>>> SYM53C8XX driver improves stability.
>>
>> I always use sym-2 now, because I had this strange harddisk slow down=20=

>> problem
>> with the old sym driver. That might be worth a try, too.
> Well, we were using sym-2 on A500 before switching to sym-1, and at=20
> that time it
> used to hang very often...
>
>
Talking about which; something weird happened:
we got a couple of segfault on previous ISOs build, but relaunching the=20=

build was enough to solve the problem.
Here I got something quite more subtle:

a make process (11859) seems to be stuck (running for about 2hours),=20
though seen as 'running', and the machine did not hang.
ctrl-c was enough to stop it...

I have no idea whether it's related to SMP pb we're tracking down=20
anyway...


Thibaut VARENE
PA/Linux ESIEE Team
http://pateam.esiee.fr/

PS: as you can see, dumps are pretty *massive*, that's why i didn't post=20=

them on the m-l previously ;o)

ouputs:

mkhppa3:/proc/11859# uname -a
Linux mkhppa3 2.4.18-pa51-rbrad #1 SMP Mon Jul 8 00:41:45 CEST 2002=20
parisc64 unknown

mkhppa3:/proc/11859# ps -efljmw
   F S UID        PID  PPID  PGID   SID  C PRI  NI ADDR SZ WCHAN  STIME=20=

TTY          TIME CMD
100 S root         1     0     0     0  0  69   0 -   381 ?     =20
Jul08 ?        00:00:08 init
040 S root         2     1     1     1  0  69   0 -     0 ?     =20
Jul08 ?        00:00:00 [keventd]
040 S root         3     0     1     1  0  79  19 -     0 ?     =20
Jul08 ?        00:00:00 [ksoftirqd_CPU0]
040 S root         4     0     1     1  0  78  19 -     0 ?     =20
Jul08 ?        00:00:00 [ksoftirqd_CPU1]
040 S root         5     0     1     1  0  69   0 -     0 ?     =20
Jul08 ?        00:00:02 [kswapd]
040 S root         6     0     1     1  0  69   0 -     0 ?     =20
Jul08 ?        00:00:00 [bdflush]
040 S root         7     0     1     1  0  69   0 -     0 ?     =20
Jul08 ?        00:00:03 [kupdated]
040 S root         8     1     1     1  0  69   0 -     0 ?     =20
Jul08 ?        00:00:02 [kjournald]
040 S root        71     1     1     1  0  69   0 -     0 ?     =20
Jul08 ?        00:00:10 [kjournald]
040 S root        72     1     1     1  0  69   0 -     0 ?     =20
Jul08 ?        00:00:00 [kjournald]
140 S daemon      95     1    95    95  0  69   0 -   444 ?     =20
Jul08 ?        00:00:00 /sbin/portmap
040 S root       140     1   140   140  0  69   0 -   681 ?     =20
Jul08 ?        00:00:00 /sbin/syslogd
040 S root       143     1   143   143  0  69   0 -   577 ?     =20
Jul08 ?        00:00:00 /sbin/klogd
140 S root       147     1   147   147  0  69   0 -   479 ?     =20
Jul08 ?        00:00:00 /sbin/rpc.statd
140 S root       152     1   152   152  0  68   0 -   668 ?     =20
Jul08 ?        00:00:00 /usr/sbin/inetd
140 S root       161     1   161   161  0  69   0 -   911 ?     =20
Jul08 ?        00:00:00 /usr/sbin/sshd
140 S root       164     1   164   164  0  69   0 -   732 ?     =20
Jul08 ?        00:00:00 /usr/sbin/ntpd
040 S root       167     1   167   167  0  69   0 -   883 ?     =20
Jul08 ?        00:00:00 /usr/sbin/rpc.nfsd
040 S root       170     1   134   134  0  69   0 -   897 ?     =20
Jul08 ?        00:00:00 /usr/sbin/rpc.mountd
040 S root       173     1   173   173  0  68   0 -   563 ?     =20
Jul08 ?        00:00:00 /usr/sbin/cron
000 R varenet    978     1   978   186 92  79  19 -  3927 ?     =20
Jul09 ?        20:01:26 ./setiathome -nice 20 -proxy cache:3128
000 R varenet    979     1   979   186 92  79  19 -  3927 ?     =20
Jul09 ?        20:01:14 ./setiathome -nice 20 -proxy cache:3128
000 S root       987     1   987   987  0  69   0 -   377 ?      Jul09=20=

ttyS0    00:00:00 /sbin/getty -L ttyS0 9600 vt102
140 S root      1526   161   161   161  0  69   0 -  1560 ?     =20
10:34 ?        00:00:00 /usr/sbin/sshd
100 S varenet   1527  1526  1527  1527  0  69   0 -   731 ?      10:34=20=

pts/1    00:00:00 -bash
100 S root      1532  1527  1532  1527  0  69   0 -   735 ?      10:34=20=

pts/1    00:00:00 bash
000 S root     11363  1532 11363  1527  0  69   0 -   651 ?      10:46=20=

pts/1    00:00:00 /bin/sh ./isobuild.sh
100 S root     11389 11363 11363  1527  0  69   0 -   653 ?      10:46=20=

pts/1    00:00:00 /bin/sh /usr/bin/dpkg-buildpackage
000 S root     11532 11389 11363  1527  0  69   0 -   418 ?      10:48=20=

pts/1    00:00:00 /usr/bin/make -f debian/rules binary
140 R root     15428   161   161   161  0  70   0 -  1603 ?     =20
10:51 ?        00:00:00 /usr/sbin/sshd
100 S varenet  15445 15428 15445 15445  0  69   0 -   735 ?      10:51=20=

pts/2    00:00:00 -bash
000 S root     17219 11532 11363  1527  0  69   0 -   647 ?      10:55=20=

pts/1    00:00:00 sh -e -c for i in 32-smp 32 64 64-smp; do  cd=20
build-$i;  make-kpkg --append-to-version=3D-$i kernel_image;  cd ..;  =
cat=20
build-$i/debian/files >> debian/files;  done
000 S root      3675 17219 11363  1527  0  69   0 -   435 ?      11:21=20=

pts/1    00:00:00 /usr/bin/make -f /usr/share/kernel-package/rules=20
APPEND_TO_VERSION=3D-64 kernel_image
000 S root     11323  3675 11363  1527  0  68   0 -   599 ?      11:31=20=

pts/1    00:00:00 /usr/bin/make -j2 EXTRAVERSION=3D-64 ARCH=3Dparisc =
modules
000 S root     11333 11323 11363  1527  0  68   0 -   592 ?      11:31=20=

pts/1    00:00:00 /usr/bin/make -C drivers CFLAGS=3D-D__KERNEL__=20
-I/home/varenet/newiso/kernel-image-2.4.18-hppa-12.1/build-64/include=20
-Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer=20
-fno-strict-aliasing -fno-
000 R root     11859 11333 11363  1527 99  77   0 -   675 ?      11:32=20=

pts/1    01:53:59 /usr/bin/make -C scsi modules
100 S root     12119 15445 12119 15445  0  69   0 -   734 ?      13:22=20=

pts/2    00:00:00 bash
100 R root     12135 12119 12135 15445  0  79   0 -  1047 ?      13:27=20=

pts/2    00:00:00 ps -efljmw

mkhppa3:/proc/11859# cat cpu
cpu  698952 31
cpu0 668398 16
cpu1 30554 15

mkhppa3:/proc/11859# cat status
Name:   make
State:  R (running)
Tgid:   11859
Pid:    11859
PPid:   11333
TracerPid:      0
Uid:    0       0       0       0
Gid:    0       0       0       0
FDSize: 64
Groups: 0
VmSize:     2700 kB
VmLck:         0 kB
VmRSS:      1832 kB
VmData:     1128 kB
VmStk:         0 kB
VmExe:       132 kB
VmLib:      1240 kB
SigPnd: 0000000000000000
SigBlk: 0000000000000000
SigIgn: 8000000000000000
SigCgt: 000000030002c007
CapInh: 0000000000000000
CapPrm: 00000000fffffeff
CapEff: 00000000fffffeff

mkhppa3:/proc/11859# cat stat
11859 (make) R 11333 11363 1527 34817 11363 0 3237 31730 180 14620=20
704315 31 1827 382 15 0 0 0 17837321 2764800 458 18446744073709551615=20
65536 265672 3220182224 3220191360 152663 0 0 0 180231 3735928559 0 0=20
18 1
mkhppa3:/proc/11859# cat statm
456 456 163 33 6 417 293


telnet> send break
SysRq : Show State

                                  free                        sibling
   task                 PC        stack   pid father child younger older
init          {{ flush_scheduled_tasks }} S 0000000000abcdef   112    =20=

1      0   978       3       (NOTLB)
keventd       {{ do_fork }} S 0000000000abcdef   112     2     =20
1             8       (L-TLB)
ksoftirqd_CPU {{ do_fork }} S 0000000000abcdef   112     3     =20
0             4     1 (L-TLB)
ksoftirqd_CPU {{ do_fork }} S 0000000000abcdef   112     4     =20
0             5     3 (L-TLB)
kswapd        {{ do_fork }} S 0000000000abcdef   112     5     =20
0             6     4 (L-TLB)
bdflush       {{ do_fork }} S 0000000000abcdef   112     6     =20
0             7     5 (L-TLB)
kupdated      {{ __wait_on_buffer }} S 0000000000abcdef   112     7     =20=

0                   6 (L-TLB)
kjournald     {{ __wait_on_buffer }} S 0000000000abcdef   112     8     =20=

1            72     2 (L-TLB)
kjournald     {{ __wait_on_buffer }} S 0000000000abcdef     0    71     =20=

1            95    72 (L-TLB)
kjournald     {{ __wait_on_buffer }} S 0000000000abcdef   112    72     =20=

1            71     8 (L-TLB)
portmap       {{ __wait_on_buffer }} S 0000000000abcdef     0    95     =20=

1           140    71 (NOTLB)
syslogd       {{ __wait_on_buffer }} D 0000000000abcdef   112   140     =20=

1           143    95 (NOTLB)
klogd         {{ ___wait_on_page }} S 0000000000abcdef   112   143     =20=

1           147   140 (NOTLB)
rpc.statd     {{ __wait_on_buffer }} S 0000000000abcdef   112   147     =20=

1           152   143 (NOTLB)
inetd         {{ do_fork }} S 0000000000abcdef   112   152     =20
1           161   147 (NOTLB)
sshd          {{ __lock_page }} S 0000000000abcdef   112   161      1=20
15428     164   152 (NOTLB)
ntpd          {{ __wait_on_buffer }} S 0000000000abcdef   112   164     =20=

1           167   161 (NOTLB)
rpc.nfsd      {{ __lock_page }} S 0000000000abcdef   112   167     =20
1           170   164 (NOTLB)
rpc.mountd    {{ do_fork }} S 0000000000abcdef   112   170     =20
1           173   167 (NOTLB)
cron          {{ __wait_on_buffer }} S 0000000000abcdef   112   173     =20=

1           987   170 (NOTLB)
setiathome    {{ __wait_on_buffer }} R 0000000000abcdef   112   978     =20=

1                 979 (NOTLB)
setiathome    {{ sleep_on }} R   current task       0   979     =20
1           978   987 (NOTLB)
getty         {{ ___wait_on_page }} S 0000000000abcdef   112   987     =20=

1           979   173 (NOTLB)
sshd          {{ __lock_page }} S 0000000000abcdef     0  1526    161 =20=

1527   15428       (NOTLB)
bash          {{ do_fork }} S 0000000000abcdef     0  1527   1526 =20
1532               (NOTLB)
bash          {{ __wait_on_buffer }} S 0000000000abcdef     0  1532  =20
1527 11363               (NOTLB)
isobuild.sh   {{ do_fork }} S 0000000000abcdef     0 11363   1532=20
11389               (NOTLB)
dpkg-buildpac {{ do_fork }} S 0000000000abcdef     0 11389  11363=20
11532               (NOTLB)
rules         {{ do_fork }} S 0000000000abcdef     0 11532  11389=20
17219               (NOTLB)
sshd          {{ do_fork }} S 0000000000abcdef     0 15428    161=20
15445          1526 (NOTLB)
bash          {{ __wait_on_buffer }} S 0000000000abcdef     0 15445 =20
15428 12119               (NOTLB)
sh            {{ do_fork }} S 0000000000abcdef     0 17219  11532 =20
3675               (NOTLB)
rules         {{ do_fork }} S 0000000000abcdef     0  3675  17219=20
11323               (NOTLB)
make          {{ do_fork }} S 0000000000abcdef   112 11323   3675=20
11333               (NOTLB)
make          {{ do_fork }} S 0000000000abcdef     0 11333  11323=20
11859               (NOTLB)
make          {{ do_fork }} R 0000000000abcdef   112 11859 =20
11333                     (NOTLB)
bash          {{ __wait_on_buffer }} S 0000000000abcdef     0 12119 =20
15445                     (NOTLB)
