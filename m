Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5736A4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Sep 2002 07:36:30 -0600 (MDT)
Message-ID: <3D91BB4F.5090205@esiee.fr>
Date: Wed, 25 Sep 2002 15:34:07 +0200
From: Thibaut VARENE <varenet@esiee.fr>
MIME-Version: 1.0
To: Stephen J de Vries <paulhill20@juno.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] hardware newbie question...
References: <20020925.090915.-178139.3.paulhill20@juno.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Stephen J de Vries wrote:
> I have a HP 712 that I'd purchased recently.
> 
> My question is:
> 
> Can I use a PC monitor, keyboard, and mouse to boot the thing up?  If so,
> does the monitor have to be a multisync or something special?
OK for the PC monitor. Use 'Tab' at boot time to switch 712's resolution
NO for the PC keyboard (pc kbd is 75mA iirc, 712 is 500mA)
I don't know for the mouse.
> 
> In addition, HP-UX is on the hard drive but is locked down.  I was
> thinking of buying an external CD drive and attempting to load debian
> 0.93.  Can anyone recommend a place to buy the CD drive that they have
> dealt with?  I also have a network so I could attempt a network install
> but I am not sure what minimum requirements I'd need to fulfill for that.
You can unlock HP/UX pretty easily if the box isn't in secure mode.
Just stop the boot sequence and at the BOOT_ADMIN prompt type 'bo pri ipl'

Then answer 'y' to the 'interract with...' question, and then type (i 
don't know if we can say this here ;o)

hpux -iS

If the box is in secure mode there is a workaround:
Open it, unplug the HD, boot it, wait for timeout, and then deactivate 
the secure mode ;)
then reboot again.


You can definitly use network to install.
Check the palinux boot howto.
I recommend you use the latest version (still under review, that's why 
it's not yet available on tldp):
http://testpa.esiee.fr/.test/parisc-linux-boot.html

You will find all useful info there.


Thibaut VARENE
PA/Linux ESIEE Team
http://pateam.esiee.fr/
