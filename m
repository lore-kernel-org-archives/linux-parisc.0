Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id B06F94829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Sep 2002 11:55:22 -0600 (MDT)
Date: Wed, 4 Sep 2002 19:55:20 +0200
Subject: Re: [parisc-linux] Re: PALO-text
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v482)
Cc: Jorge GOMEZ CABELLO <jorge.gomez@sanmina-sci.com>,
	parisc-linux@lists.parisc-linux.org
To: Richard Hirst <rhirst@linuxcare.com>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <20020904062110.GJ21440@sleepie.demon.co.uk>
Message-Id: <7A991B84-C02F-11D6-8BC6-0030656F07A2@esiee.fr>
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

Le mercredi 4 septembre 2002, =E0 08:21 , Richard Hirst a =E9crit :

> On Tue, Sep 03, 2002 at 12:51:43PM +0200, Thibaut VARENE wrote:
>> On Tue, 3 Sep 2002 10:43:18 +0200
>> "Jorge GOMEZ CABELLO" <jorge.gomez@sanmina-sci.com> wrote:
>>
>>> Dear Puffin,
>>>
>>>     We are trying to install Debian 3.0 on our HP B2000/785 and it =
is=20
>>> impossible to recognize the usb keyboard. is there a special =
commando=20
>>> to introduced in the command line of the palo 1.0 ?
>>
>> - This reply has been CC'd to the parisc-linux mailing list -
>>
>> Hi Jorge,
>>
>> If I remember correctly, the USB support is not enabled by default in=20=

>> the install kernel for Debian 3.0, and B2000 does use a USB keyboard.
>> We had such a problem here, and there is a solution: boot and install=20=

>> the box using the following lifimage:
>> http://pateam.esiee.fr/cd-
>> images/lifimages/lifimage-2.4.18-pa46-USBSTI64-20020704.gz
>> This one has support for USB in both 32/64bit kernels, and what's=20
>> more, STI console is supported in 64bit kernel. This will allow you =
to=20
>> install the box directly with a 64bit kernel.
>>
>> We may build a more recent lifimage with such USB/STI support soon.
>>
>> Maybe we can also consider adding at least USB support to the default=20=

>> kernel configuration ? Richard, any comment ? :)
>
> I think we should add usb and 64 bit sti to default and debian =
configs.
> I guess we'll find out soon enough if it casues problems on other
> systems.
Done: support for USB input has been added as default for both 32 and 64=20=

bit kernel,
and support for both STI_CONSOLE and STI_FB has beed added as default=20
for 64 bit kernel,
since -pa10.

pa10 netinst/lifimage are available on=20
http://pateam.esiee.fr/download.html
(and soon on dsl2) :)

Feedback would be appreciated.
>
> Maybe it's time we considered an initrd boot process and kernel =
modules
> for some of this stuff.  May not be worth the effort in 2.4 though.
>
> Richard
>
>
Thibaut VARENE
PA/Linux ESIEE Team
http://pateam.esiee.fr/
