Return-Path: <ajwalker@broadpark.no>
Received: from mail.broadpark.no (mail.broadpark.no [217.13.4.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 923CC4879
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  9 Mar 2004 03:58:04 -0700 (MST)
Received: from tolstoy.puszczka.com (47.80-202-73.nextgentel.com
	[80.202.73.47])
	by mail.broadpark.no (Postfix) with ESMTP id 338F58409
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  9 Mar 2004 11:58:03 +0100 (MET)
Message-ID: <49349.193.161.152.244.1078830353.squirrel@www.puszczka.com>
Date: Tue, 9 Mar 2004 12:05:53 +0100 (CET)
Subject: Re: [parisc-linux] No PS2 keyboard/mouse on B132L, 2.6.[34]
From: "Andy Walker" <ajwalker@broadpark.no>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> On Montag, 8. März 2004 12:28, Andy Walker wrote:
>> To the point. I grabbed 2.6.3-pa0 from Gentoo hppa-dev-kernel,
>> configured
>> and compiled it. The keyboard and mouse are both dead. I downloaded
2.6.4-rc1-pa2 from cvs.parisc-linux.org but the result is exactly the
same.
>> Some info below. Clues anybody?
> ....
>> # Input Device Drivers
>> #
>> CONFIG_INPUT_KEYBOARD=y
>> # CONFIG_KEYBOARD_ATKBD is not set
>
> Please enable this one (CONFIG_KEYBOARD_ATKBD), and....
>
>> # CONFIG_KEYBOARD_SUNKBD is not set
>> # CONFIG_KEYBOARD_XTKBD is not set
>> # CONFIG_KEYBOARD_NEWTON is not set
>> CONFIG_KEYBOARD_HIL=y
>> CONFIG_INPUT_MOUSE=y
>> # CONFIG_MOUSE_PS2 is not set
>
> this one too.
>
> In the latest 2.6 kernel series, we switched from a parisc-only
> PS/2 mouse/keyboard driver to the standard linux kernel PS/2
> mouse keyboard drivers.
>
> Helge

Hi Helge,

I'm just about to give this a try. The reason these weren't enabled is
that menuconfig was a bit non-intuitive (to me at least). Maybe I was just
being paranoid, but when I selected ATKBD or MOUSE_PS2 then the GSC PS/2
item got closed up and I didn't know whether it was on or off. That scared
me and I assumed that selecting GSC PS/2 support would enable everything
else I needed. Compiling now, but I won't be able to test until I get home
from work and actually get my hands on the keyboard/mouse.

Thanks,
-Andy
