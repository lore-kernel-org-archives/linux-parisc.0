Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.zigoo.net (d208.dhcp212-198-140.noos.fr [212.198.140.208])
	by dsl2.external.hp.com (Postfix) with ESMTP id 65E1D4829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Oct 2002 07:30:13 -0600 (MDT)
Date: Fri, 11 Oct 2002 15:30:08 +0200
From: Thibaut VARENE <varenet@esiee.fr>
To: parisc-linux@lists.parisc-linux.org
Cc: jeffo@pop.hsbc.com.br
Subject: Re: [parisc-linux] HP Boot
Message-Id: <20021011153008.69b217a7.varenet@esiee.fr>
In-Reply-To: <005901c27126$8d5132c0$db0b0aa7@pcaktel083>
References: <005901c27126$8d5132c0$db0b0aa7@pcaktel083>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

On Fri, 11 Oct 2002 10:03:11 -0300
"Jeffo" <jeffo@pop.hsbc.com.br> wrote:

>  Hi all.
> 
>  How to properly configure my HP 712/60 for loading the right boot files?
>  (/target/boot/vmlinux)?
>  (Oh, by the way, the boot installer tried to look for the files in
>  /target/vmlinux, and on the CD we can see /target/boot/vmlinux)
> 
>  I guess I have to play with the ISL...but I couldn´t find the right
> commands
>  for changing the default (/stand/hpux which don´t even exists anymore) to
> my
>  boot thing.
> 

Everything is explained on the PA-RISC/Linux Boot HOWTO, released as of 
2002-10-04 (sorry the release date hasn't been correctly set in the changelog) in its 1.0 version.
Please check:
http://pateam.esiee.fr/doc.html

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
