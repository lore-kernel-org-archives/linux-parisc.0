Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 45BC4482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  9 Apr 2002 17:32:31 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: "M. Grabert" <xam@cs.ucc.ie>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] some bugs
Date: Wed, 10 Apr 2002 01:30:14 +0200
References: <Pine.LNX.4.44.0204091813530.26756-200000@sal.ucc.ie>
In-Reply-To: <Pine.LNX.4.44.0204091813530.26756-200000@sal.ucc.ie>
MIME-Version: 1.0
Message-Id: <200204100130.14037.deller@gmx.de>
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

Hi Max,

On Tuesday 09 April 2002 19:15, M. Grabert wrote:
>
> on all 2.4.x kernels tested so far
> ==================================
> - the 32bit kernel shipped with the 0.9.3 iso (IIRC 2.4.9)
> - 2.4.18-pa4-32bit
> - 2.4.18-pa5-32bit
> - 2.4.18-pa14-32bit
> - 2.4.18-pa14-64bit
>
> I've seen following issues:
>
> - leds don't seem to work (i.e. no heartbeat or other leds on or blinking -
> or is my hp really so idle ?)
>   This is just with the latest 2.4.18-pa14 kernels (2.4.18-pa5-32bit
> worked, but IIRC not perfectly)

Could you post me some of your bootlogs ?

> - 100Mbit is not supported properly (full-duplex support is always
>   recognized, but 100Mbit just occationally).
>   Of course it's a full 10/100Mbit SWITCH (no hub), and I checked the
> cables Moreover I just have 100Mbit network devices plugged into the
> switch.

I never had problems with tulip and 100MBit here (on c3k).

> - the 'poweroff' command doesn't work, it just shutdowns the machine, but
> does no real poweroff. (AFAIK 'poweroff' is a synonym for 'shutdown -p
> now', isn't it ? this doesn't work either).
>   The powerkey works as expected (including powering off the workstation)
>   with 32bit kernels.

I've looked again at that problem during my latest patches (2.4.18-pa15).
As far as it seems to me we can't poweroff the system directly via software only.
The only possible thing we can do, is to catch all powerbutton presses from the
user and allow or disallow the controlled shutdown of the system. So the current
implementation is, that a) if you press the powerbutton we detect it and initiate
a clean shutdown. The PDC ROM will then power off the system automatically for 
us at the end of the shutdown procedure.
And: b) If you only tell Linux to "shutdown -n" (without having pressed the button)
we initiate the shutdown procedure, stop to catch any powerbutton presses and 
thus enable PDC to power off the system as soon as you press the button later on. 
But in this case you will still need to press the button to really power off the 
machine.  We just only allow the PDC to directly power it off.

So currently I don't see any solution here. You will _always_ have to press the power
button at least once: Directly while the kernel runs, or after you have started "shutdown -n".
Of course I may be wrong, in which case I would appreciate if someone from HP
would correct me here.


> for kernel 2.4.18-pa14-64bit (32bit PDC):
> ========================================
> - if fs type "auto" is set for a ext3 partition, the kernel detects the /,
> but the mount command (in the bootscript) fails to detect the fstype.
> Setting the fstype entry in /etc/fstab to "ext3" or "ext2" fixes the
> problem. Since 'mount -a' fails to detect the fs type, it won't remount /
> in read-write mode, and thus the system won't boot correctly.
>
>   But "auto" in /etc/fstab works with the corresponding 32bit kernel

This should be reported to the debian folks.

> - crashme is effective (example settings, after a few minutes kernel
> crashed, even MagicSysRq didn't work. It didn't seem to 'work' on
> 2.4.18-pa5-32bit, I didn't try with the 2.4.18-pa14-32bit kernel)
>
> - once I got a kernel oops at interrupt_stack() at boot up (attached to
> mail), but eveything seemed to work. I didn't get any more kernel oops.

We don't have chance to trace this bug without having your System.map.

> - shutdown&poweroff when hitting powerkey does not work (it just switches
> off the workstation immediately; it works properly on the corresponding
> 32bit kernel and 2.4.18-pa5-32bit)

Ryan committed some related changes here in 2.4.18-pa16. 
Could you retry with this kernel and check the results with CONFIG_PDC_NARROW 
enabled and disabled ?

> - if I compile in support for STIcon/STIfb, it doesn't switch the output
>   to the console (after the 'branching to kernel entry point' message).
>   At least I waited for quite some time, and I didn't seem to go on.
>   I didn't compile in support for STIcon/STIfb for the 32bit kernel,
>   therefore I can't tell whether there is the same problem or not.
>   STIcon/STIfb works with 2.4.18-pa5-32bit. Well, my FX/2 card isn't
> supported for fb, but at least the kernel doesn't hang with that kernel.

Are you using the latest palo ? Do you maybe have "console=ttyS00" as 
kernel boot parameter (check /proc/cmdline).

Helge
