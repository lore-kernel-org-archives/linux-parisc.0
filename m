Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web21205.mail.yahoo.com (web21205.mail.yahoo.com [216.136.131.248])
	by dsl2.external.hp.com (Postfix) with SMTP id 978024831
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Feb 2002 03:15:06 -0700 (MST)
Message-ID: <20020218101505.54487.qmail@web21205.mail.yahoo.com>
Date: Mon, 18 Feb 2002 11:15:05 +0100 (CET)
From: =?iso-8859-1?q?Hinrich=20Aue?= <hinrich_aue@yahoo.de>
Subject: [parisc-linux] Power LED
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
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

------------------------------------------
>715/64, 715/80 and 715/100 belong to the so-called
>715/new machines and all of those support the
soft-power
>switch, else you wouldn't have received the 
>"Shutdown requested..." message. 
>In your case I assume, that your filesystems wasn't
clean
>before you did shutdown your system....

>BTW, the shutdown is initiated by the kernel by
sending
>a SIGINT to the PID (cad_pid) of the init process.
This
>is done in the file power.c:
>http://cvs.parisc-linux.org/linux/arch/parisc/kernel/power.c?rev=1.5&content-type=text/vnd.viewcvs-markup
>After receiving this signal the init process switches
>the runlevel,
>shuts down your system cleanly and runs
/sbin/poweroff
>or /sbin/halt. This is already the case and is also
>done
>that way for ATX systems.

>Regards,
>Helge

But if I push the power button, the init process
doesn't seem do change the runlevel, and power off
immediatly.
I can see the message "Shutdown requested..." and then
- power off -.
I think this souldn't be so.
Also I think it is a bit dangerous if everyone can
switch of the system, clean or unclean, just by
pushing the button.
Maybe a 5 second push-time would be good (like ATX)
but with a gracefull shutdown.
After all the halt script does not power off my
715/80.
I have to switch it off manually.

__________________________________________________________________

Gesendet von Yahoo! Mail - http://mail.yahoo.de
Ihre E-Mail noch individueller? - http://domains.yahoo.de
