Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 51633482A
	for <parisc-linux@parisc-linux.org>; Tue,  2 Oct 2001 11:35:06 -0600 (MDT)
Message-Id: <200110021732.LAA07808@puffin.external.hp.com>
To: Bjorn Helgaas <bjorn_helgaas@hp.com>
Cc: Thomas Marteau <marteaut@esiee.fr>,
	"parisc-linux@parisc-linux.org" <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Second Draft of the help for the kernel options 
In-Reply-To: Message from Bjorn Helgaas <bjorn_helgaas@hp.com>
   of "Tue, 02 Oct 2001 09:23:20 MDT." <20011002152055.DE860403B@ldl.fc.hp.com>
Date: Tue, 02 Oct 2001 11:32:04 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Bjorn Helgaas wrote:
>   Main Menu: Enter command or menu > in fru
...
> Maybe a pointer to similar functionality in other firmware would be useful 
> and reduce the dependence on the lists of machines.

That's a good idea.  Different generations of machines have different
commands to list the type and revisions of chips/devices installed.
But it's only two or three commands need to be listed.

For newer machines, "in io" at "Main Menu" prompt will list all IO devices.
See "info" menu for more commands. I forgot what the equivalent cmd
was for older machines (eg 712 or 715).

grant
