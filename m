Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id 207F84830
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Feb 2002 02:21:46 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <helge.deller@sap.com>
To: Hinrich Aue <hinrich_aue@yahoo.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Power LED
Date: Mon, 18 Feb 2002 10:21:17 +0100
References: <20020218073706.35199.qmail@web21205.mail.yahoo.com>
In-Reply-To: <20020218073706.35199.qmail@web21205.mail.yahoo.com>
MIME-Version: 1.0
Message-Id: <E16cjzT-0000FF-00@linuxlab.wdf.sap-ag.de>
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

On Monday 18 February 2002 08:37, Hinrich Aue wrote:
> When I push the power-button on my 715/80, it prints a
> message on the screen, that a shuwdown is requested,
> and then shuts down immediatly. On the next start up a
> fsck is required.
> It seems to be software controlled, or it would not
> print that message(I think).
> Maybe a shutdown signal is emmited from the kernel at
> one point, but the runlevel isn't changed before.
> So it should be possible to isolate that signal and
> use it seperately in the atx style.
> (I'm not a kernel hacker, but maybe this is a starting
> point?)
> Just speculating.

715/64, 715/80 and 715/100 belong to the so-called
715/new machines and all of those support the soft-power
switch, else you wouldn't have received the 
"Shutdown requested..." message. 
In your case I assume, that your filesystems wasn't clean
before you did shutdown your system....

BTW, the shutdown is initiated by the kernel by sending
a SIGINT to the PID (cad_pid) of the init process. This
is done in the file power.c:
http://cvs.parisc-linux.org/linux/arch/parisc/kernel/power.c?rev=1.5&content-type=text/vnd.viewcvs-markup
After receiving this signal the init process switches the runlevel,
shuts down your system cleanly and runs /sbin/poweroff
or /sbin/halt. This is already the case and is also done
that way for ATX systems.

Regards,
Helge
-- 
Helge Deller
SAP AG - LinuxLab and Unix Platforms
email: helge.deller@sap.com
