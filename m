Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mout0.freenet.de (mout0.freenet.de [194.97.50.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 36BE7482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  7 Aug 2001 06:39:08 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Reinhard Gimbel <Reinhard.Gimbel@freenet.de>
Reply-To: Reinhard.Gimbel@freenet.de
To: Richard Hirst <rhirst@linuxcare.com>
Subject: Re: [parisc-linux] C180: no real progress :-(
Date: Tue, 7 Aug 2001 14:39:04 +0200
Cc: parisc-linux@lists.parisc-linux.org
References: <01080622381300.01641@octopus> <20010806231339.Z1011@linuxcare.com>
In-Reply-To: <20010806231339.Z1011@linuxcare.com>
MIME-Version: 1.0
Message-Id: <01080714390400.00937@octopus>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Aug 07, 2001 at 00:13 Richard Hirst wrote:

> I have heard of a C160 with what could be similar problems. 
> The C160 has internal diff scsi drives, and it seems that
> using that interface causes disk corruption.  The only way he
> managed an install was to disconnect all devices from the
> diff scsi interface, and install to disks on the external
> scsi.  Is that something you can try easily? Note, he had to
> physically disconnect the diff disks, it wasn't sufficient to
> simply not use them.

Any idea how one could connect the drives without those 
expensive Fast/Wide SCSI cables (The box I got is from a local 
2nd hand computer dealer for approx USD 50 ...)

What do you mean with "external" SCSI ? If I connect the drives 
to the connector on the backplane isn't it the same FWSCSI 
channel as the internal one (which might be buggy) ? Or is it a 
seperate channel ?

Should I use one of the PCI slots to install a seperate SCSI 
host adaptor ? Could be an idea but actually I don't have an 
extra FWSCSI PCI adaptor on hand (I would like to use the 
internal 4.5 GB FWSCSI drives ...)

I also don't have a seperate external FWSCSI box where I could 
put the C180 internal drives in. (Again, I'm doing this as a 
hobby and my wife will propably kill me if I buy boxes and 
cables for lets say USD 150 ... ;-)

Isn't there another way to go ?

On that box was HP-UX 10.20 installed and the hardware is still 
the same. So there must/could be a software solution, right ?

BTW: Is that a problem of C1xx only ? Or is that problem known 
with other HP PA-Risc workstations, too ?

> What scsi interfaces does that box have anyway?  Boot up msgs
> should mention chip numbers - 53c710, 53c720, etc.

According to the boot message its a 53c710 for the SESCSI 
channel and a 53c720 for the FWSCSI channel

> > [2] Try to get full support of any key (at least german
> > keyboard support lacks on essential things ...) eg. no
> > pipe/vertical bar; no support of capslock (keyboard
> > unusable after accidently hit capslock; nothing helped;
> > un-/replug, too)
>
> Hmm, yeah; I had a UK keyboard where pipe key didn't work.  I
> got it with <alt>+124 on the numeric pad, or with <alt-gr>
> and the key to the left of '1' (back-quote, etc).  Obviously
> needs fixing though.

Thanks for that hint with <alt>-xzy ! Seems to be the same as 
with good old DOS boxes, right ? Why I did not try that ?

> > [3] Sometimes I could see a message like
> > "ioctl: LOOP_CLR_FD: No such device or address"
> > short time before the C180 crashed. Any idea ?
>
> That's a feature of the installer ;)  Happens on all archs
> and is harmless.

The problem is that one isn't sure if that could be the core 
reason or not, you know ...

I'm not used to use Debian Linux. It's the first time to use 
Debian so I couldn't have much experience in that ...

> > [1] Do real disabling of "dhcp-client" if it is set to "no"
> > during installation. (Those kernel message caused by
> > dhcp-client are boring; try it with open editor; great ;-)
>
> That is a problem with the dhcp-client package, again common
> to all archs.  The solution is "rm /etc/rc?.d/*dhcp-client". 
> It has been discussed on the debian-boot list, and hopefully
> someone will fix it. It has been suggested that we switch
> back to using pump.  There is a new version of dhcp-client in
> experimental, but it is much bigger, which causes problems
> for people that boot from floppies, at least.

I know the SuSE Linux approach of init. I have to get familiar 
with the Debian/Redhat way to do it ...


Now some philosophy:

On the other hand one has to fight on many different frontiers 
if one is using uncommon things :-)

Of course it's easier to go the known way. But why not to go 
the unknown way ? There are many things to discover ...


Thanks a lot ! There's hope :-) There's light on the end of the 
dark tunnel :-)


Reinhard.
