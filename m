Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 571D14869
	for <parisc-linux@parisc-linux.org>; Wed,  3 Oct 2001 03:02:54 -0600 (MDT)
Sender: marteaut@esiee.fr
Message-ID: <3BBAD2E4.3E802263@esiee.fr>
Date: Wed, 03 Oct 2001 10:57:08 +0200
From: Thomas Marteau <marteaut@esiee.fr>
MIME-Version: 1.0
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: Bjorn Helgaas <bjorn_helgaas@hp.com>,
	"parisc-linux@parisc-linux.org" <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Second Draft of the help for the kernel options
References: <200110021732.LAA07808@puffin.external.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

	The Bjorn's idea is quite practical but the problem is we need to do a
complete list of command. With this list, users will know what commands
to do to get the cpu type...

	For the B132L, I need to do in cr. And for 712, "in" do not give you
the model of the cpu :(

Perhaps, we could a more general text saying:   1- You have to enter the
information menu by "in" (it seems to be general to all boxes)
						2- Here you need to find the command to get the revisions of your
chip/device. This must look like PAXXX0. For example this command is cr
for B132 and io for newer machines.

btw, we could add the complete list of the commands in the HOWTO.

This is a proposition. Tell me what you think of it. Thomas.
ESIEE Team

> >   Main Menu: Enter command or menu > in fru
> 
> For newer machines, "in io" at "Main Menu" prompt will list all IO devices.
