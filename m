Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id A448C4851
	for <parisc-linux@parisc-linux.org>; Mon,  8 Oct 2001 08:50:16 -0600 (MDT)
Sender: marteaut@esiee.fr
Message-ID: <3BC1BBB5.F1ACA@esiee.fr>
Date: Mon, 08 Oct 2001 16:44:05 +0200
From: Thomas Marteau <marteaut@esiee.fr>
MIME-Version: 1.0
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: Matthew Wilcox <willy@debian.org>,
	"parisc-linux@parisc-linux.org" <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Second Draft of the help for the kernel options
References: <200110080348.VAA24289@puffin.external.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

	I have put the Matthew Wilcox's CPU and 64bit section. For the PDC
narrow, a section was already written. So, I do not the change unless
you tell that:
"
32-bit PDC
CONFIG_PDC_NARROW
  Turning this option on enables support for 32-bit firmware when
running
  a 64-bit kernel.  You should select this option if you have a
workstation
  from the C160-J2240 era.
"
is better than:
"
32-bit PDC
CONFIG_PDC_NARROW
  Saying Y here will allow developers with a C180, C200, C240, C360,
  J200, J210, and/or a J2240 to test 64-bit kernels by providing 
  a wrapper for the 32-bit PDC calls.  Since the machines which 
  which require this option do not support over 4G of RAM, this
  option is targeted for developers of these machines wishing to
  test changes on both 32-bit and 64-bit configurations.

  If unsure, say N.
"

Anyway, thanks for your comment and if you have any idea, please mail
me, Thomas.
ESIEE Team
