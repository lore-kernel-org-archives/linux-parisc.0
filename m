Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 8F5FE483A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 19 Feb 2002 04:13:50 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Hinrich Aue <hinrich_aue@yahoo.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Power LED
Date: Tue, 19 Feb 2002 12:11:01 +0100
References: <20020219085057.17411.qmail@web21206.mail.yahoo.com>
In-Reply-To: <20020219085057.17411.qmail@web21206.mail.yahoo.com>
MIME-Version: 1.0
Message-Id: <200202191210.08123.deller@gmx.de>
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

On Tuesday 19 February 2002 09:50, Hinrich Aue wrote:
> I use 2.4.17-pa26
>
> I tried to increase push-time to 5*HZ.
> But as you said, the machine doesn't seem to recognize
> when I release the button. 

Yep.

> So the shutdown is
> initiated correctly, but after 5 sec the machine shuts
> down, ignoring whether the runlevel 6 is reached or
> not.

process_shutdown() calls after 5 seconds poweroff(), which in
turn calls deferred_poweroff() again. deferred_poweroff() then
sends the SIGINT signal to the init process which then
initiates the normal shutdown. There is no other kernel-code
which powers off your computer directly.
This works perfectly for me on the 715/64 and many others here.
Maybe your PDC (BIOS/Firmware) handles that differentlly ? Maybe
you could verify that you have the most recent PDC version ?

> BTW why does the halt command not shut down the
> machine?

I've not found any direct PDC (BIOS/Firmware) call which does this.
pdc_soft_power_shutdown() doesn't seem to do want it's name
suggests. It instead seems to set a flag in the PDC so that when 
you reboot your system it will shut off during the main PDC tests. 
So there seems to be a way to turn off the system immediately,
but it seem to be _very_ system dependant too.

> I heared it would work. :-<
> Is it possible to change the bit 0 if CPU diagnose
> register 25 by hand?

I tried it, but it didn't worked.
If we would find a way to reset bit 0 in reg 25 we would
have a solution.

Helge
