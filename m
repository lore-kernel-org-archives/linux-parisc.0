Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 12F78482E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Mar 2003 09:18:36 -0700 (MST)
Date: Mon, 10 Mar 2003 17:18:31 +0100
Message-ID: <3E68A24B000005A2@ocpmta6.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] trouble loading from netinst ISO on B2000
To: "Derek Engelhaupt" <derekengelhaupt@rocketmail.com>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hello Derek,

I also install a b2k with the help of a netinstall image (but a long time
ago :) ).

If I well understand your system is basically installed on your partitionned
disk (excepted that palo failled to completly install)?

Could you give us more details on those disk and its partitions?

By the way, in the install menu there is an option to 'execute a shell'
(IIRC).

Always IIRC, cfdisk should be install on your netinstall image and would
allow you to printout those details in the shell you just launch as above?

Before you exist this shell, can you still give us the content of palo.conf
installed on your disk?

Well, I do not yet test usb stuff on this b2k (as for the interanl gfx there
is not yet support I only use serial console) but IMHO there is no relation
with the failure of the palo install.

Joel


>-- Original Message --
>From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
>Subject: Re: [parisc-linux] trouble loading from netinst ISO on B2000
>To: parisc-linux@lists.parisc-linux.org
>Date: Mon, 10 Mar 2003 07:15:59 -0800 (PST)
>
>
>
>Well all efforts have failed.  I now tried to use an internal drive in
the
>B2000 totally bypassing the card and the array with the same results.
It
>still won't load PALO.  The whole install goes well, but no PALO.  Is there
>a newer version of PALO that isn't on the 2.4.20-32 release that I could
>try?
>derek
> Derek Engelhaupt <derekengelhaupt@rocketmail.com> wrote:
>Basically my B2000 with the A4977A PCI EG graphics card starts up and allows
>me to load all the way until making the system bootable.  Then I get an
error
>saying PALO won't load and then dumps me all the way back to the "choose
>a language" screen.  It's so weird because the card and the disks hanging
>off of the card are out of my C360 and functioned great with it.  I think
>I will blow away the the LUN in the array that I'm using, format it and
try
>again starting with the disk partitioning.  It does seem to want to use
the
>EG graphics card though.  As a side note, I think it's cool that the front
>LCD screen tells me I'm running Linux and the current kernel revision.
 Any
>ideas?
>derek
> "Copeland, Daniel" <Daniel.Copeland@alcoa.com> wrote: Thanks. The latest
>netinst iso worked...
>
>-----Original Message-----
>From: Thibaut VARENE [mailto:varenet@esiee.fr]
>Sent: Thursday, February 27, 2003 6:51 PM
>To: Copeland, Daniel
>Cc: parisc-linux@lists.parisc-linux.org
>Subject: Re: question about pa-risc linux on hp b2600 workstation
>
>
>On Thu, 27 Feb 2003 10:40:42 -0500
>"Copeland, Daniel" wrote:
>
>> Hello,
>>
>> Did you have to get special usb drivers to be able to install? I
>downloaded
>> the debian v. 3.0 iso and it boots fine, I just can't acknowledge w/
my
>> keyboard...
>
>perhaps you should read the section related to b2600 on this page:
>http://pateam.esiee.fr/list.html
>
>the mailing-list archive:
>http://www.fr.parisc-linux.org/mailing-lists/
>
>eventually the FAQ (there's an entry about USB keyboards)
>http://www.fr.paris c-linux.org/faq/
>
>and the Boot HOWTO
>http://pateam.esiee.fr/doc.html
>
>everything is explained there.
>
>you need one of the latest netinst isos to install your box:
>http://pateam.esiee.fr/download.html
>
>HTH,
>
>
>Thibaut VARENE
>The PA/Linux ESIEE Team
>http://pateam.esiee.fr/
>
>(mail CC'd to the m-l to feed the archive)
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
>
>---------------------------------
>Do you Yahoo!?
>Yahoo! Tax Center - forms, calculators, tips, and more
>
>
>---------------------------------
>Do you Yahoo!?
>Yahoo! Tax Center - forms, calculators, tips, and more



---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be
