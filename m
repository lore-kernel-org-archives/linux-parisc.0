Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2E6424834
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Mar 2003 11:57:55 -0700 (MST)
Date: Wed, 12 Mar 2003 19:57:53 +0100
Subject: Re: [parisc-linux] bootp/tftpd :(
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v551)
Cc: parisc-linux@lists.parisc-linux.org
To: trnepal <trnepal@papuasia.org>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <200303121720.03452.trnepal@papuasia.org>
Message-Id: <878CDABC-54BC-11D7-A259-0030656F07A2@esiee.fr>
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

There's something wrong with you.

Rule nb 1: NEVER answer in private to a mailing-list message.

Rule nb 2: NEVER claim there's a bug for software that works perfectly=20=

well for thousands of peoples (unless you run unstable, but then ALWAYS=20=

blame yourself).

Rule nb 3: ALWAYS suspect a problem with the hardware when something=20
goes wrong. (moreover if the hardware seems to have already failed.=20
What's that scsi error you're talking about ?)

Rule nb 4: ALWAYS post output and give details when reporting a bug.=20
How could I guess what's wrong with your box if I can't have a look at=20=

dmesg for instance? When does your machine hangs? Are the boot=20
parameters correct? Haven't you forgotten the "root=3D" argument? What=20=

are the kernel arguments you used? How the hell am I supposed to guess=20=

that kind of info?

and what's that superblock/filesystem stuff you're talking about, how=20
did you get to that step?
network images only contains a kernel, they're not supposed to launch=20
any installer...

let me suggest you to check items 2) and 6) from the template message=20
as well.


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/

Le mercredi, 12 mar 2003, =E0 17:20 Europe/Paris, trnepal a =E9crit :

> On Wednesday 12 March 2003 09:52, you wrote:
>
>> In your case 1) should be enough.
>>
>> -----
>> This is a template message.
>>
>> 1) Read the PA-RISC/Linux Boot HOWTO
>> http://pateam.esiee.fr/doc.html
>
> okk. but i read it _before posting :) ..
>
> ok. i managed it .. it was tftpd problem.
> something like a bug. the kernel was successfully
> transferred only from an incorrect location
> like /tftboot//image.
>
> now the machines hangs writing superblock and
> filesystem accounting :((
>
> i choosed a netwoork boot cause of this hang
> with an external cdrom (and some dmesg scsi error on
> the bus :) .. but now if verified a clean dmesg,
> but the machines hangs anyway :((
>
> any clues now? thankyou verymuch.
>
> see youu byee.'
>
>
>
