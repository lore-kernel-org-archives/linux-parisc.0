Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep13-int.chello.at (viefep13-int.chello.at [213.46.255.15])
	by dsl2.external.hp.com (Postfix) with ESMTP id 456CF4829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 15 Sep 2002 18:18:58 -0600 (MDT)
Date: Mon, 16 Sep 2002 02:18:54 +0200
Subject: Re: [parisc-linux] [PATCH] Voodoo framebuffer on PARISC
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v543)
Cc: <parisc-linux@lists.parisc-linux.org>
To: "Tobias Giesen" <tobias_subscriber@tgtools.com>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <001201c25d05$150e6600$0100a8c0@PLUTO>
Message-Id: <E267A5BE-C909-11D6-A91F-0030656F07A2@esiee.fr>
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

Le lundi, 16 sep 2002, =E0 00:13 Europe/Paris, Tobias Giesen a =E9crit :

> Helge wrote:
>
>> This patch is already integrated into the 2.4.19-pa18
>> kernel ...
>
> Where can I get pa18? The latest on ftp.parisc-linux.org seems to be
> pa17.
I'm currently building pa18 lifimage/iso, they will be available soon.
Though I think there's no point for you in trying to find a precompiled=20=

kernel,
since IIRC precomp are built with default debian-configs, which do not=20=

enable support
for sstfb.

Therefore I think you'd better get the latest kernel source from=20
cvs.parisc-linux.org
and build it with your own options :)

Greetings,


Thibaut VARENE
PA/Linux ESIEE Team
http://pateam.esiee.fr/=
