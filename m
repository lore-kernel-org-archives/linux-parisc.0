Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id D4B7C482C
	for <parisc-linux@lists.parisc-linux.org>; Sun,  2 Dec 2001 15:47:52 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Grant Grundler <grundler@puffin.external.hp.com>
Date: Sun, 2 Dec 2001 23:46:27 +0100
Cc: parisc-linux@lists.parisc-linux.org
References: <200112010611.XAA11815@puffin.external.hp.com>
In-Reply-To: <200112010611.XAA11815@puffin.external.hp.com>
MIME-Version: 1.0
Message-Id: <20011202224752.D4B7C482C@dsl2.external.hp.com>
Subject: [parisc-linux] Re: two minor c3k bugs
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

Hi Grant,

On Saturday 01 December 2001 07:11, Grant Grundler wrote:
> > Currently I use "kill_proc(1, SIGINT, 0);" to kill the init-process -
> > which is normally a reboot-command and gives the above messages.
>
> Ok. that makes sense.
>
> > That's AFAICS not the right solution, but nfortunately I don't know
> > how to do it correct right now.
>
> ./kernel/sys.c:         printk(KERN_EMERG "Power down.\n");
>
> That chunk of code seems to do the right thing:
>         case LINUX_REBOOT_CMD_POWER_OFF:
>                 notifier_call_chain(&reboot_notifier_list, SYS_POWER_OFF,
> NULL); printk(KERN_EMERG "Power down.\n");
>                 machine_power_off();
>                 do_exit(0);
>                 break;
>
> I know that msg since I regularly "powerdown" my c3k.
> Perhaps replicate that code?

Yes, that's the right code-path, but sadly calling this function
would  immediately power off the computer without doing a nice
system shutdown.
I'll need to investigate how to first find the PID of the init process and
then how to tell it to shut down the system cleanly.

Helge

> cheers,
> grant
