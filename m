Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from spoolm2.tiscalinet.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id BED6D482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 May 2002 12:19:49 -0600 (MDT)
Message-ID: <3CED32CC.2030500@freebel.net>
Date: Thu, 23 May 2002 18:19:56 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: Armijn Hemel <armijn@nl.linux.org>
Cc: Richard Hirst <rhirst@linuxcare.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] installing on b2600 fails
References: <20020517130527.J32014@humbolt.geo.uu.nl> <armijn@nl.linux.org> <20020517152054.4F2CE482A@dsl2.external.hp.com> <20020517172600.I29738@humbolt.geo.uu.nl> <armijn@nl.linux.org> <20020517154923.47C7E4838@dsl2.external.hp.com> <20020521155220.A28518@humbolt.geo.uu.nl> <20020523063531.GH3471@sleepie.demon.co.uk> <20020523110227.B10015@humbolt.geo.uu.nl>
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


Armijn Hemel wrote:
> On Thu, May 23, 2002 at 07:35:31AM +0100, Richard Hirst wrote:
> 
> 
>>>>Can you be more specific (and cc the mailing list) where
>>>>you got the ISO from (ie file name)?
>>>
>>Since boot-floppies 3.0.22 (released 3rd April), at least, hppa has used
>>a 2.4.17-pa32 kernel.  Final woody b-f will use that same kernel, so
>>unless you have a very old ISO, I wouldn't expect a newer one to help.
>>
>>If it turns out a more recent kernel is needed for some machines, I
>>could do a special b-f build and ISO.
> 
> 
> Well, I tried the ISO that Mattias pointed me at. The machine boots, kernel
> loads, and the Debian installer starts, but, ehr, the keyboard didn't work,
> so I couldn't continue.
> 
> I suspect that there's some driver missing for the keyboard (it's a USB
> keyboard).
> 
> armijn
> 
AFAIK you should prefer to install from a serial console
(anyway, i am not sure that usb keyboard and mouse are already supported?).
As serial console you can use any HP serial console if you have one at 
your disposal or better (you can log the output) a linux box using 
minicom and link the two boxes with a null-modem serial cable.
Do not also forget to disconnect the usb kbd and mouse from your b2600 
so that PDC will switch to serial port automaticaly.

I do something like this with bootp/tftp to install my b2000 last week. 
I rebuild a lifimage (could be with a xcompiler fo i386) with the one of 
the debian boot-floppy for hppa, palo and the last 2.4.18-pa24 kernel 
which i build localy. (I was not absolutly sure that 2.4.17-pa32 already 
supported ide cdrom)

Never the less the install procedure worked well untill I wanted to 
install the basic system because the check failled to found pppoe package?

Later I also encounter a well know loop problem to install kernel modules.

You should also encounter another problem because the release of palo 
installed with CD-0.9.3 do not yet support new scsi disk of 9Gb and more.

Definitly I do believe that a new cd-base.iso would be the best to help 
you to install a basic system to your project. (for me it was 'easiest' 
: once I booted with the lifimage,  I partioned my disk and 'just' had 
to copy my b180 to my b2000 with nfs)

Good luck,
	Joel

PS: Richard thanks in advance.
