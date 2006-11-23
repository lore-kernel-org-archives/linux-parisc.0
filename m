From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Debian Etch RC1 on B180L / X display problem
Date: Thu, 23 Nov 2006 00:12:15 -0700
Message-ID: <20061123071215.GB2994@colo.lackof.org>
References: <200611222359.kAMNxbBp022646@stephenson.dhis.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Jean-Pierre HOFER <jph@stephenson.dhis.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200611222359.kAMNxbBp022646@stephenson.dhis.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Nov 23, 2006 at 12:59:35AM +0100, Jean-Pierre HOFER wrote:
> I have installed Etch RC1 on a B180L workstation.
> 
> The X display shows only a grey surface with some horizontal white dotted
> lines. The mouse pointer is a series of horizontal white lines. There is
> no colour at all.
> Possibly, the video signal frequencies are not correct, but I don't have
> seen during the installation an other mask related to the video display
> than for the setting of the number of horizontal and vertical pixels of
> the display (1280 x 1024).
> 
> What can be wrong ?

Refresh rate is the other possibility.
Normal Refreash rate is somewhere between 60 and 85 Hz.
Try a slower speed if the current one doesn't work.

> How to restart the installation program, without doing again a complete
> installation ? (the X display is unusable, and I don't know how to exit
> it and go directly into single user mode on console).

You don't have to restart installation.
You just want to run "dpkg-reconfigure xserver-xorg"
once you get to a commandline OR edit /etc/X11/xorg.conf
and then restart X11 (e.g. ctl-alt-backspace) server.

> How to boot the system without starting X ? (single user mode).

o Interrupt the power up seqence to get a firmware prompt.
o "bo"
o Chose "Y" when ask "Interact with IPL?". This will start palo.
  Palo will first present a list of parameters.

o _append_ " init=/bin/bash" to any one of the parameters presented by palo.
  (Note the extra white space). Palo should list "init=/bin/bash" as
  a seperate parameter after hitting <Enter>.
o enter "b" in palo prompt to boot the system
o Once you get a bash prompt, run "mount -o remount,rw /"
  (get RW on the root filesystem).
o Disable /etc/init.d/gdm (or xdm) script by adding "exit 0" at the top.
o "exec /sbin/init 2" to get to normal login prompt.

You can then experiment on the /etc/X11/xorg.conf.
Use "xstart" or "xinit" commands to start X11 manually.

enjoy!
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
