Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from msdatco1.DATCO.NET (proxy.winstar.net.ar [200.61.0.12])
	by dsl2.external.hp.com (Postfix) with ESMTP id 654EB482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 Aug 2001 11:47:33 -0600 (MDT)
Subject: RE: [parisc-linux] HELP ME PLEASE - d220 Install problem 
Date: Thu, 23 Aug 2001 14:48:39 -0300
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Message-ID: <92AD79D83589314D821A57429B49E54A479CE8@w2kexchange>
From: "Christian Knoch" <ChristianK@datco.com.ar>
To: "Matt Taggart" <taggart@carmen.fc.hp.com>,
	"Christian Knoch" <ChristianK@datco.com.ar>
Cc: <parisc-linux@lists.parisc-linux.org>
List-ID: <linux-parisc.vger.kernel.org>

the console return this mensage when boot from p1

cannot find ENTRY_TEST
failed to initialize
ENTRY_INIT
status =3D -4





-----Mensaje original-----
De: Matt Taggart [mailto:taggart@carmen.fc.hp.com]
Enviado el: Thursday, August 23, 2001 1:36 PM
Para: Christian Knoch
CC: parisc-linux@lists.parisc-linux.org
Asunto: Re: [parisc-linux] HELP ME PLEASE - d220 Install problem=20



"Christian Knoch" writes...

> how to write a debian parisc iso using easy cd creator
> how many iso i need?? step by step

1.) Download the iso.gz image.
2.) Run md5sum and compare the result with the one on the ftp site
3.) gunzip the image
4.) Use your CD burning software to burn the raw image directly
5.) Try booting the CD, if it doesn't boot post only the relevant
console
    messages to the mailing list.

HTH,

--=20
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
