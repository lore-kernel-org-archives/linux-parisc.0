Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id A8F4B4834
	for <parisc-linux@lists.parisc-linux.org>; Thu, 13 Mar 2003 04:21:44 -0700 (MST)
Date: Thu, 13 Mar 2003 12:21:27 +0100
Subject: Re: [parisc-linux] bootp/tftpd :(
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v551)
Cc: parisc-linux@lists.parisc-linux.org
To: trnepal <trnepal@papuasia.org>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <200303130027.55325.trnepal@papuasia.org>
Message-Id: <EE611482-5545-11D7-A259-0030656F07A2@esiee.fr>
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

Le jeudi, 13 mar 2003, =E0 00:27 Europe/Paris, trnepal a =E9crit :

> On Wednesday 12 March 2003 19:57, Thibaut VARENE wrote:
>
>> There's something wrong with you.
>> Rule nb 1: NEVER answer in private to a mailing-list message.
>
> ok, im sorry. i wrote directly to you cause my reply was a bit=20
> fast&silly ..
> you noticed that :).
obviously you still haven't found the "Reply All" command in your mail=20=

client.
>
>> Rule nb 2: NEVER claim there's a bug for software that works =
perfectly
>> well for thousands of peoples (unless you run unstable, but then=20
>> ALWAYS
>> blame yourself).
>
> yeah. i know. i always blame myself :). anyway i only said 'something=20=

> like a
> bug', cause my tftpd (woody stable) is correcting serving file only
> from /tftpboot//image (double slash .. uh, strange).
bad configuration in inetd and/or bad request from the client?
>
>> Rule nb 3: ALWAYS suspect a problem with the hardware when something
>> goes wrong. (moreover if the hardware seems to have already failed.
>> What's that scsi error you're talking about ?)
>
> i noticed errors (scsi command not executed and bus reset) issuing
> a dmesg (after escaping to a shell during the install process) with
> an external cdrom attached to the scsi-2 port. but i didnt quote cause=20=

> i lost
> them after the reboot (ok, i didnt wrote down something and i blame=20
> myself :)
still I can't help without output.
>
>> and what's that superblock/filesystem stuff you're talking about, how
>> did you get to that step?
>> network images only contains a kernel, they're not supposed to launch
>> any installer...
>
> lifimages i downloaded from =
http://pateam.esiee.fr/cd-images/lifimages/
> contain a kernel + a debian installer and the 712 crashed during =
ext2/3
> init.
dead hard drive?
>
>> let me suggest you to check items 2) and 6) from the template message
>> as well.
>
> ok, anyway i tried lifimage-2.4.19-pa16-PDC-20020914 and it worked !!
> (im downloading the base system)
cool.
>
> sorry for the annoyance maybe i posted only my anxiety about ..=20
> seeyou. byee,'
relax: watch a game, have a beer... True.


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/=
