Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id EE1444840
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Feb 2002 04:49:10 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <helge.deller@sap.com>
To: Hinrich Aue <hinrich_aue@yahoo.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Power LED
Date: Mon, 18 Feb 2002 12:49:08 +0100
References: <20020218101505.54487.qmail@web21205.mail.yahoo.com>
In-Reply-To: <20020218101505.54487.qmail@web21205.mail.yahoo.com>
MIME-Version: 1.0
Message-Id: <E16cmI9-0000SL-00@linuxlab.wdf.sap-ag.de>
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

On Monday 18 February 2002 11:15, Hinrich Aue wrote:
> ------------------------------------------
>
> >715/64, 715/80 and 715/100 belong to the so-called
> >715/new machines and all of those support the
>
> soft-power
>
> >switch, else you wouldn't have received the
> >"Shutdown requested..." message.
> >In your case I assume, that your filesystems wasn't
>
> clean
>
> >before you did shutdown your system....
> >
> >BTW, the shutdown is initiated by the kernel by
>
> sending
>
> >a SIGINT to the PID (cad_pid) of the init process.
>
> This
>
> >is done in the file power.c:
> >http://cvs.parisc-linux.org/linux/arch/parisc/kernel/power.c?rev=1.5&conte
> >nt-type=text/vnd.viewcvs-markup After receiving this signal the init
> > process switches
> >the runlevel,
> >shuts down your system cleanly and runs
>
> /sbin/poweroff
>
> >or /sbin/halt. This is already the case and is also
> >done
> >that way for ATX systems.
> >
> >Regards,
> >Helge
>
> But if I push the power button, the init process
> doesn't seem do change the runlevel, and power off
> immediatly.
> I can see the message "Shutdown requested..." and then
> - power off -.
> I think this souldn't be so.

Yes, that's wrong. But you seem to be the only one
who has such problems with 715/new. As I said in another
mail my Scorpio (715/50) machine shuts down immediately too - 
but this machine doesn't support the soft-power switch either.
BTW, which kernel are you using ?

> Also I think it is a bit dangerous if everyone can
> switch of the system, clean or unclean, just by
> pushing the button.

That's right, but that's also the behaviour on Non-ATX PC's.

> Maybe a 5 second push-time would be good (like ATX)
> but with a gracefull shutdown.

That's not that easy.
On some systems the switch will send a key-down signal from
the first press on, independantly if you released the button again or
not. Other machines just send the signal while the button
is down and stops it again if it was released.

That said, this is how I wrote the code. 
In process_shutdown() you'll find:
       /* wait until the button was pressed for 1 second */
        if (shutdown_timer == HZ) {
                static char msg[] = "Shutting down...";
	    printk(KERN_INFO "%s\n", msg);

This means, that the kernel will just shutdown, if you pressed
the button for at least 1 second. You might change that to 5*HZ if
you want the 5 second push-time. 
But, as I said, the kernel can't recognize on some systems if
you have released the button again and so it will always 
time-out and initiate the shutdown request. Your 715/80 seems
to fall into this category of systems.

Regards,
Helge
