Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mgw-x1.nokia.com (mgw-x1.nokia.com [131.228.20.21])
	by dsl2.external.hp.com (Postfix) with ESMTP id AEA9A4829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Feb 2003 03:21:26 -0700 (MST)
Received: from esvir01nok.ntc.nokia.com (esvir01nokt.ntc.nokia.com [172.21.143.33])
	by mgw-x1.nokia.com (Switch-2.2.1/Switch-2.2.0) with ESMTP id h16AKK218523
	for <parisc-linux@lists.parisc-linux.org>; Thu, 6 Feb 2003 12:20:20 +0200 (EET)
Received: from esebh001.NOE.Nokia.com (unverified) by esvir01nok.ntc.nokia.com
 (Content Technologies SMTPRS 4.2.5) with ESMTP id <T603f7e0b4cac158f21083@esvir01nok.ntc.nokia.com> for <parisc-linux@lists.parisc-linux.org>;
 Thu, 6 Feb 2003 12:21:25 +0200
Received: (from mnahkola@localhost)
	by aurinko.ntc.nokia.com (8.11.6/8.11.6) id h16ALM003300
	for parisc-linux@lists.parisc-linux.org; Thu, 6 Feb 2003 12:21:23 +0200 (EET)
Date: Thu, 6 Feb 2003 12:21:22 +0200
From: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030206102122.GW7503@aurinko.ntc.nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: [parisc-linux] ksoftirqd in 2.4.20-pa23
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

Now that there seems to be another generally useful kernel out (as in, 
usable for running KDE and such without lockups), there seems to be an 
interesting thing there...

Why is ksoftirqd_CPU0 taking almost all the free CPU time? Sure, it's 
nice 19, but still... and I don't remember having that on 2.4.18 nor on 
the other .19 and .20 versions that I tried. And of course it's all 
system time.

This is a typical state:

 12:16:28 up 23:32,  3 users,  load average: 1.11, 1.24, 1.20
104 processes: 102 sleeping, 2 running, 0 zombie, 0 stopped
CPU states:   1.2% user,  96.7% system,   0.9% nice,   1.2% idle
Mem:    774288K total,   770800K used,     3488K free,    51464K buffers
Swap:  1500152K total,     1936K used,  1498216K free,   624904K cached

  PID USER     PRI  NI  SIZE  RSS SHARE STAT %CPU %MEM   TIME COMMAND
    3 root      20  19     0    0     0 RWN  87.5  0.0  1211m ksoftirqd_CPU0
16772 root      18  15  1196 1196   924 R N   9.4  0.1   0:02 top
 1006 mnahkola   9   0  9680 9380  8688 S     1.0  1.2  13:49 kdeinit
  153 daemon     9   0   652  652   532 S     0.1  0.0   1:38 portmap
16737 root       9   0  2236 2208  1896 S     0.1  0.2   0:00 sshd
    1 root       9   0   580  580   492 S     0.0  0.0   0:12 init
    2 root       9   0     0    0     0 SW    0.0  0.0   0:00 keventd
    4 root       9   0     0    0     0 SW    0.0  0.0   0:16 kswapd
    5 root       9   0     0    0     0 SW    0.0  0.0   0:00 bdflush
    6 root       9   0     0    0     0 SW    0.0  0.0   0:00 kupdated
    9 root       9   0     0    0     0 SW    0.0  0.0   0:00 scsi_eh_2
   10 root      -1 -20     0    0     0 SW<   0.0  0.0   0:00 mdrecoveryd
   11 root       9   0     0    0     0 SW    0.0  0.0   0:01 kjournald


-- 
Mikko Nahkola   <mikko.nahkola@nokia.com>
Tre-IN sysadmin <mnahkola@trein.ntc.nokia.com>
