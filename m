From: Jeremy Drake <jeremyd@apptechsys.com>
Subject: Re: [parisc-linux] Kernel 2.4.17-32-smp problem
Date: Mon, 25 Mar 2002 09:44:27 -0800 (PST)
Message-ID: <Pine.LNX.4.33L2.0203250941180.13376-100000__46621.8833848417$1416621183$gmane$org@eiger.apptechsys.com>
References: <Pine.LNX.4.33L2.0203231953470.13376-100000@eiger.apptechsys.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: <debian-hppa@lists.debian.org>
To: <parisc-linux@parisc-linux.org>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <Pine.LNX.4.33L2.0203231953470.13376-100000@eiger.apptechsys.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sat, 23 Mar 2002, Jeremy Drake wrote:

> I have been running debian hppa for a while now without incedent.
> Recently, I ran apt-get upgrade, and it upgraded my kernel-image
> 2.4.17-32-smp.  I rebooted, and the box now crashes periodically.  It has
> done this twice.  Since I have not had physical access to the box for a
> while, I can't get any logs or even bring the box back up.  Hopefully by
> monday I'll be able to be more help.
>
> Thanks for the great work on this port, and hopefully you can help me.
> Log files to follow when available.......

Unfortunately, the log files are very unhelpful.
It just stops, and starts back up when I reboot.

Mar 21 18:55:16 krakatoa -- MARK --
Mar 22 15:16:29 krakatoa syslogd 1.4.1#10: restart.
Mar 22 15:16:29 krakatoa kernel: klogd 1.4.1#10, log source = /proc/kmsg
started.
Mar 22 15:16:29 krakatoa kernel: Inspecting /boot/System.map-2.4.17-32-smp
Mar 22 15:16:29 krakatoa kernel: Loaded 30310 symbols from
/boot/System.map-2.4.17-32-smp.
Mar 22 15:16:29 krakatoa kernel: Symbols match kernel version 2.4.17.
Mar 22 15:16:29 krakatoa kernel: No module symbols loaded.
Mar 22 15:16:29 krakatoa kernel: Linux version 2.4.17-32-smp (root@paer)
(gcc version 3.0.4) #1 SMP Sat Mar 16 17:55:20 MST 2002

-- 
"Most people would like to be delivered from
 temptation but would like it to keep in touch."
-- Robert Orben
