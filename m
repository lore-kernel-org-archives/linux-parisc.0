Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id EF8464857
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Jun 2002 04:49:16 -0600 (MDT)
Date: Wed, 12 Jun 2002 12:49:15 +0200
Subject: Re: [parisc-linux] 2.4.18-pa35 SMP process hangs on a J200
Content-Type: text/plain; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v482)
Cc: parisc-linux@lists.parisc-linux.org, grundler@cup.hp.com
To: Ryan Bradetich <rbradetich@uswest.net>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <1023773807.7353.19.camel@beavis>
Message-Id: <0A06D350-7DF2-11D6-97C5-0030656F07A2@esiee.fr>
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

Hi all,

We hung again our A500  :/

Still the same symptoms.

It seems that it is the seti process that hung it:
We can access info in /proc/1/, but nothing about the seti process:
see the following:
[varenet@mkhppa3 ~]$ cat seti1/pid.sah
5972
[varenet@mkhppa3 ~]$ ls /proc/5972/

And the command would not return.

We issued a 'w' that got hung too, but we can still access its proc info:
[varenet@mkhppa3 /proc]$ cat 6576/cmdline
w
[varenet@mkhppa3 /proc]$ cat 6576/mem
cat: 6576/mem: No such process
[varenet@mkhppa3 /proc]$ cat 6576/status
Name:   w
State:  D (disk sleep)
Tgid:   6576
Pid:    6576
PPid:   1
TracerPid:      0
Uid:    1001    1001    1001    1001
Gid:    100     100     100     100
FDSize: 256
Groups: 100
VmSize:     1912 kB
VmLck:         0 kB
VmRSS:       812 kB
VmData:       76 kB
VmStk:         0 kB
VmExe:        12 kB
VmLib:      1420 kB
SigPnd: 0000000000000001
SigBlk: 0000000000000000
SigIgn: 8000000000000000
SigCgt: 0000000000000000
CapInh: 0000000000000000
CapPrm: 0000000000000000
CapEff: 0000000000000000

Of course, a 'kill -9 6576' would do nothing.

We can also access the info about the distributed.net client, which 
seems to be hang too:
[varenet@mkhppa3 /proc]$ cat 224/status
Name:   dnetc
State:  D (disk sleep)
Tgid:   224
Pid:    224
PPid:   1
TracerPid:      0
Uid:    1001    1001    1001    1001
Gid:    100     100     100     100
FDSize: 64
Groups: 100
VmSize:     2300 kB
VmLck:         0 kB
VmRSS:      1136 kB
VmData:       84 kB
VmStk:         0 kB
VmExe:       348 kB
VmLib:      1368 kB
SigPnd: 0000000000000000
SigBlk: 0000000000000000
SigIgn: 8000000000001000
SigCgt: 0000000003004027
CapInh: 0000000000000000
CapPrm: 0000000000000000
CapEff: 0000000000000000

Now we are about to test with only 2 dnetc, no seti, to see whether it 
crashes or not.

We'll keep the m-l informed.

Greetings,


Thibaut VARENE
PA/Linux ESIEE Team
http://pateam.esiee.fr/
