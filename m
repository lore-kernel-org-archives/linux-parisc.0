Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id 75735482A
	for <parisc-linux@parisc-linux.org>; Tue, 21 May 2002 08:35:48 -0600 (MDT)
Received: from smtp1.fc.hp.com (smtp1.fc.hp.com [15.15.136.127])
	by atlrel8.hp.com (Postfix) with ESMTP id B5DFFA0018A
	for <parisc-linux@parisc-linux.org>; Tue, 21 May 2002 10:35:31 -0400 (EDT)
Received: from ldl.fc.hp.com (ldl.fc.hp.com [15.1.50.190])
	by smtp1.fc.hp.com (Postfix) with ESMTP id 6478037F74
	for <parisc-linux@parisc-linux.org>; Tue, 21 May 2002 08:35:31 -0600 (MDT)
Received: from paul.bame (lart.fc.hp.com [15.1.54.48])
	by ldl.fc.hp.com (Postfix) with ESMTP id 1D1604605
	for <parisc-linux@parisc-linux.org>; Tue, 21 May 2002 08:35:31 -0600 (MDT)
Received: from localhost
	([127.0.0.1] helo=fc.hp.com ident=bame)
	by paul.bame with esmtp (Exim 3.35 #1 (Debian))
	id 17AAjL-00079M-00
	for <parisc-linux@parisc-linux.org>; Tue, 21 May 2002 08:35:15 -0600
To: parisc-linux@parisc-linux.org
Date: Tue, 21 May 2002 08:35:10 -0600
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E17AAjL-00079M-00@paul.bame>
Subject: [parisc-linux] stalling system clues + parisc WCHAN hack
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

I doubt I'm the only who sees parisc systems become unusuably slow,
apparently because any command needing disk I/O has to wait a long time.
This isn't the same symptom as the traditional Linux problem where one
fills the buffer cache (say, by running a large tar) and then the first
interactive command is slow due to paging.  In the traditional problem,
the system fairly quickly recovers normalcy, in our case it never does,
though processes eventually finish.  It's as if a timeout is releasing a
needed lock or something.

FYI the load for reproducing this stalling behavior is to run several
network-based (haven't tried local) 'cvs update' of the linux kernel
mixed with some diffs.  The load is running on a 50+G partition if that
matters, and I've seen problems in both ext2 and ext3.

It sounds like the disk is seeking in the pattern of a heartbeat, twice
a second.  I think the front-panel has a heartbeat monitor with that rhythm.

So I did a quick, simple, ugly hack, mostly to arch-independent code, to
get WCHAN out of parisc (http://ftp.parisc-linux.org/patches/wchan.diff),
and ran a ps on a system which was stalling.  The result is attached, as
is a copy of /proc/meminfo.

The interesting clue in the 'ps' to me are the 'D' processes, which I
suspect are those who've called down_uninterruptable.  The most frequent
WCHAN culprits are wait_on_buffer/page.  Where to go next solving this
problem (oh, with least effort too unfortunately)?

Linux b2000 2.4.18-pa25 #22 Fri May 17 11:04:28 MDT 2002 parisc unknown

  PID CMD              S WCHAN
    1 ini              S pipe_poll
    2 [keventd]        S context_thread
    3 [ksoftirqd_CPU0] S start_context_thread
    4 [kswapd]         S kswapd
    5 [bdflush]        S start_context_thread
    6 [kupdated]       S sync_supers
    9 [mdrecoveryd]    S md_thread
   10 [kjournald]      S wait_on_buffer
   62 [kjournald]      S wait_on_buffer
   98 /sbin/dhclient-2 S datagram_poll
  110 /sbin/portmap    S tcp_poll
  175 /sbin/syslogd    D wait_on_buffer
  178 /sbin/klogd      S syslog
  182 /sbin/rpc.statd  S tcp_poll
  190 /usr/sbin/inetd  S tcp_poll
  206 nmbd -a          S pipe_poll
  208 /usr/sbin/sshd   S tcp_poll
  213 /usr/bin/X11/xfs S unix_poll
  215 /usr/sbin/ntpd   S datagram_poll
  219 /usr/sbin/atd    S wait_on_buffer
  222 /usr/sbin/cron   S wait4
  238 -bash            S wait4
  783 /usr/sbin/apache S wait4
 2748 /usr/sbin/lpd    S tcp_poll
 4356 /usr/sbin/apache S wait_for_connect
 4357 /usr/sbin/apache S wait_for_connect
 4358 /usr/sbin/apache S wait_for_connect
 4359 /usr/sbin/apache S wait_for_connect
 4360 /usr/sbin/apache S wait_for_connect
 4361 /usr/sbin/apache S wait_for_connect
 4717 /usr/sbin/sshd   S normal_poll
 4718 -bash            S read_chan
 4794 /USR/SBIN/CRON   S pipe_wait
 4795 /usr/bin/perl -w S wait4
 4797 /usr/bin/ssh b20 S tcp_poll
 4799 /usr/sbin/sshd   S unix_poll
 4800 /usr/bin/perl -w S wait4
 4802 /usr/sbin/sendma S pipe_wait
 4824 /bin/sh -eux /pr S wait4
 5088 /USR/SBIN/CRON   S pipe_wait
 5089 /bin/sh -c cd ia S wait4
 5090 /bin/sh -uex ./b S wait4
 5092 /usr/sbin/sendma S pipe_wait
 5179 /bin/sh -uex ./b S wait4
 5180 diff -urN --excl D wait_on_page
 5209 /bin/sh -eux /pr S wait4
 5210 cvs -Qfz4 -d:pse D wait_on_page
 5291 /USR/SBIN/CRON   S pipe_wait
 5292 /bin/sh -c test  S wait4
 5293 run-parts --repo S pipe_poll
 5296 /bin/sh /etc/cro S wait4
 5297 /bin/sh /usr/bin S wait4
 5311 /bin/sh /usr/bin S wait4
 5312 sort -f          S pipe_wait
 5313 /usr/lib/locate/ S pipe_wait
 5314 /usr/bin/find /  D wait_on_buffer
 5367 /bin/sh ./daemon S wait4
 5368 setiathome -nice R wait_on_buffer
 5381 ps -eo pid,cmd,s R wait_on_buffer

        total:    used:    free:  shared: buffers:  cached:
Mem:  525357056 521830400  3526656        0 70672384 356921344
Swap: 511696896  5632000 506064896
MemTotal:       513044 kB
MemFree:          3444 kB
MemShared:           0 kB
Buffers:         69016 kB
Cached:         347420 kB
SwapCached:       1136 kB
Active:         112296 kB
Inactive:       329744 kB
HighTotal:           0 kB
HighFree:            0 kB
LowTotal:       513044 kB
LowFree:          3444 kB
SwapTotal:      499704 kB
SwapFree:       494204 kB
