Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 552F54829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  4 Nov 2002 02:56:57 -0700 (MST)
Date: Mon, 4 Nov 2002 10:56:49 +0100
Subject: Re: [parisc-linux] Placement of hil drivers
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v546)
Cc: parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <willy@debian.org>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <20021103231849.D20749@parcelfarce.linux.theplanet.co.uk>
Message-Id: <BC87909C-EFDB-11D6-8FC8-0030656F07A2@esiee.fr>
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

Le lundi, 4 nov 2002, =E0 00:18 Europe/Paris, Matthew Wilcox a =E9crit :

> On Sun, Nov 03, 2002 at 10:31:32PM +0100, Thibaut VARENE wrote:
>> That's not true, I've worked hard enough on 2.5 config system, and
>> especially on HIL, to deny such statement ;^)
>
> OK, it's nowhere to be found in 2.5.45 ;-)  I guess this change got=20
> lost
> during the Kconfig transition.
Well yes indeed. I guess I should read _all_ my mails before answering=20=

one, when coming back from vacation :)

I saw we switched to KConfig, therefore we lost all the changes made to=20=

Config.[in|help] files, which is too bad since there were numerous.

I'll try to merge these changes to the new KConfig scheme ASAP.
>
>> AFAICR, I already have said when we merged 2.4 config files into 2.5=20=

>> that
>> HIL driver files and config may need review.
>>
>> It looks like time has come for such review.
>
> Certainly, that was what i was starting to do when i noticed nothing=20=

> was
> including the Kconfig stuff in drivers/hil ... and that no Makefile =
was
> linking drivers/hil.  So it's not _just_ the Kconfig changes that =
broke
> this.
ok
>
>> I would like to hear from Helge Deller too.
>
> Yep, and Brian Julin... at least to hear that they don't care where
> these drivers are put.
indeed =3D)
>
>
Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
