Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2E044482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 10 Apr 2001 02:45:27 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id F4107B007; Tue, 10 Apr 2001 09:46:13 +0100 (BST)
Date: Tue, 10 Apr 2001 09:46:13 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Christoph Plattner <christoph.plattner@dot.at>
Cc: Matt Taggart <taggart@carmen.fc.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Many experience done on 720, but `init' fails !!
Message-ID: <20010410094613.K6992@linuxcare.com>
References: <3AC90274.4687ED7C@dot.at> <20010403001743.G9198@linuxcare.com> <3AC973D3.F1453A4C@alcatel.at> <20010403223441.A11435@parcelfarce.linux.theplanet.co.uk> <3ACAC867.25327463@alcatel.at> <20010404180518.C11435@parcelfarce.linux.theplanet.co.uk> <3AD09AFB.EBDFF975@dot.at> <20010409205209.2FF0437CDB@carmen.fc.hp.com> <3AD225CF.1AF048F1@dot.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3AD225CF.1AF048F1@dot.at>; from christoph.plattner@dot.at on Mon, Apr 09, 2001 at 11:12:47PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Apr 09, 2001 at 11:12:47PM +0200, Christoph Plattner wrote:
> Those procresses have very low pids (2,3,....). So I have to analyse the
> code,
> what pid=9 will become ? The break happens here !

  PID TTY      STAT   TIME COMMAND
    1 ?        S      0:02 init
    2 ?        SW     0:00 [keventd]
    3 ?        SW     0:00 [kswapd]
    4 ?        SW     0:00 [kreclaimd]
    5 ?        SW     0:00 [bdflush]
    6 ?        SW     0:00 [kupdate]
    7 ?        SW     0:00 [scsi_eh_1]
   73 ?        S      0:00 /sbin/portmap
   80 ?        SW     0:00 [rpciod]
   81 ?        SW     0:00 [lockd]
  124 ?        S      0:00 /sbin/syslogd
  127 ?        S      0:00 /sbin/klogd
  134 ?        S      0:00 /usr/sbin/inetd
  144 ?        S      0:01 /usr/sbin/sshd
  148 ?        S      0:00 /usr/sbin/atd
  151 ?        S      0:00 /usr/sbin/cron
  154 ttyS0    S      0:00 /sbin/getty -L ttyS0 9600 vt100
  155 ?        S      0:00 in.telnetd: beast.home
  156 pts/0    S      0:00 -bash
  157 pts/0    R      0:00 ps ax

Looks like PID 9 has run and exited during startup.  This is a freshly
booted B180.

One thought, if you have module support or hotplug support turned on in
your kernel config, you should turn them off for the time being.  The
kernel might be trying to trigger a module load and failing.

Richard
