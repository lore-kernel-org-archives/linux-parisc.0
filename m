Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7DCE4485E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Mar 2003 09:05:26 -0700 (MST)
Date: Mon, 10 Mar 2003 17:05:23 +0100
Subject: Re: [parisc-linux] trouble loading from netinst ISO on B2000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v551)
Cc: parisc-linux@lists.parisc-linux.org
To: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <20030310151559.37375.qmail@web12501.mail.yahoo.com>
Message-Id: <19847336-5312-11D7-A259-0030656F07A2@esiee.fr>
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

I just don't understand what's wrong with your box. We installed=20
several B2k here with the netinst we provide; never had a problem.

I strongly recommend you try to get back to a very basic configuration=20=

(no fancy cards...) and boot on the internal CD...

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/

Le lundi, 10 mar 2003, =E0 16:15 Europe/Paris, Derek Engelhaupt a =E9crit =
:

> Well all efforts have failed.=A0 I now tried to use an internal drive =
in=20
> the B2000 totally bypassing the card and the array with the same=20
> results.=A0 It still won't load PALO.=A0 The whole install goes well, =
but=20
> no PALO.=A0 Is there a newer version of PALO that isn't on the =
2.4.20-32=20
> release that I could try?
>
> derek
>
> =A0Derek Engelhaupt <derekengelhaupt@rocketmail.com> wrote:
>
> Basically my B2000 with the A4977A PCI EG graphics card starts up and=20=

> allows me to load all the way until making the system bootable.=A0 =
Then=20
> I get an error saying PALO won't load and then dumps me all the way=20
> back to the "choose a language" screen.=A0 It's so weird because the=20=

> card and the disks hanging off of the card are out of my C360 and=20
> functioned great with it.=A0 I think I will blow away the the LUN in =
the=20
> array that I'm using, format it and try again starting with the disk=20=

> partitioning.=A0 It does seem to want to use the EG graphics card=20
> though.=A0 As a side note, I think it's cool that the front LCD screen=20=

> tells me I'm running Linux and the current kernel revision.=A0 Any > =
ideas?
>
> derek
>
> =A0"Copeland, Daniel" <Daniel.Copeland@alcoa.com> wrote:
>
> Thanks. The latest netinst iso worked...
>
> -----Original Message-----
> From: Thibaut VARENE [mailto:varenet@esiee.fr]
> Sent: Thursday, February 27, 2003 6:51 PM
> To: Copeland, Daniel
> Cc: parisc-linux@lists.parisc-linux.org
> Subject: Re: question about pa-risc linux on hp b2600 workstation
>
>
> On Thu, 27 Feb 2003 10:40:42 -0500
> "Copeland, Daniel" wrote:
>
> > Hello,
> >
> > Did you have to get special usb drivers to be able to install? I
> downloaded
> > the debian v. 3.0 iso and it boots fine, I just can't acknowledge w/=20=

> my
> > keyboard...
>
> perhaps you should read the section related to b2600 on this page:
> http://pateam.esiee.fr/list.html
>
> the mailing-list archive:
> http://www.fr.parisc-linux.org/mailing-lists/
>
> eventually the FAQ (there's an entry about USB keyboards)
> http://www.fr.paris c-linux.org/faq/
>
> and the Boot HOWTO
> http://pateam.esiee.fr/doc.html
>
> everything is explained there.
>
> you need one of the latest netinst isos to install your box:
> http://pateam.esiee.fr/download.html
>
> HTH,
>
>
> Thibaut VARENE
> The PA/Linux ESIEE Team
> http://pateam.esiee.fr/
>
> (mail CC'd to the m-l to feed the archive)
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
>
>
<image.tiff>
>
> Do you Yahoo!?
> Yahoo! Tax Center - forms, calculators, tips, and more
>
>
>
<image.tiff>
>
> Do you Yahoo!?
> Yahoo! Tax Center - forms, calculators, tips, and more
