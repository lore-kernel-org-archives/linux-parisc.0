Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: moritz@sinnhq.de
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: Message from <moritz@sinnhq.de>
   of "Mon, 09 Sep 2002 00:34:28 +0200." <32935.192.168.2.15.1031524468.squirrel@debian.sinnhq.de>
References: <32935.192.168.2.15.1031524468.squirrel@debian.sinnhq.de> 
Date: Sun, 08 Sep 2002 22:23:31 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020909042331.75529482A@dsl2.external.hp.com>
Subject: [parisc-linux] Re: ide controller
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

moritz@sinnhq.de wrote:
> hi,

Hi,
This is a kernel question. I'm replying to a different list.

> i'd like to connect some big ide disks to my hp c240, which is running
> with debian gnu/linux.i tried an ultra ata ide controller from digitus.
> but when i load the module, the system crashes after detecting the
> controller.

Can you post details of the crash?
Console output?
kernel version?
maybe collect "ser pim" output from "boot_admin>" as well.

> i think that
> this is because of the lower voltage in the hp machines compared with an
> pc. but an standard pci network card works without problems.
> so does someone now an ide controller which works?

This has nothing to do with the voltage.
If the card fits, the voltage is OK.

grant
