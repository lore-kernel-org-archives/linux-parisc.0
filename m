Return-Path: <rbradetich@uswest.net>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id C9F13484B
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  9 Feb 2004 15:16:19 -0700 (MST)
Subject: Re: [parisc-linux] Question about 'new' box
From: Ryan Bradetich <rbradetich@uswest.net>
To: "Bowman, Eric" <EBowman@Atl.Carreker.com>
In-Reply-To: <A59A3048AD0AD511B53200508B686F36018E5655@atlmail1.carreker.com>
References: <A59A3048AD0AD511B53200508B686F36018E5655@atlmail1.carreker.com>
Content-Type: text/plain
Message-Id: <1076364935.709.154.camel@laptop.bradetich.net>
Mime-Version: 1.0
Date: Mon, 09 Feb 2004 15:15:37 -0700
Cc: "'parisc-linux@lists.parisc-linux.org'"
	<parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hello Eric,

Let me take a quick stab at some of your questions.

1. Is the 755 an improvement over the 712/60?

It depends on your perspective...

The 755 can handle more memory and has a higher clock speed (99 MHz 
if i remember right).  The 755 is not as well supported at the 712, 
and the FW SCSI disks are known not to work (problem with the driver
not being able to deal with non-coherant IO).  The 755 also uses
the rbootd protocol to netboot instead of bootp/tftp.  The 755 does
support serial console native without a special hack (like the 712
needs). 


2. Is it work robbing the Monitor/keyboard/mouse from the existing
712/60 to use on the 755.

I doubt this world work.. the 712/60 has ps2 ports for keyboard and
mouse, and a standard 15-pin PC monitor cable.  The 755 has a HIL
keyboard mouse and keyboard and RGB ports for the monitor cable.

3. Can you use serial console instead of keyboard,mouse,keyboard.

Yes.  The 755 is considered a workstation class system, so it does not
have remote service management capabilities built into the firmware
(i.e. no ^B).  But assuming the system is up and running, the console
should work fine.  Firmware will default the console to the serial
console if the it does not detect a keyboard at boot time.

[NOTE: I do have a 755/99 ad I have had it up and running linux in the
past on a single ended disk.  I have not verified this recently though.]

Hope this helps,

- Ryan


On Mon, 2004-02-09 at 12:36, Bowman, Eric wrote:
> I recently got a 755/99 and am wanting to get it set up.  I am having a
> difficult time determining what to do however.  Ignorance of the specs, and
> features of this 'new' box are making it difficult for me to decide what
> course to take.  I have a 712/60 that I have worked with here and have it
> working well.  Is the 755 an improvement? is it worth robbing the
> Monitor/keyboard/mouse from my existing machine to use on the 755? Do I have
> alternatives (can this machine be controlled/instaled with a serial
> terminal)?   
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
