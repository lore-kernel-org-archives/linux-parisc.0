Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA14054
	for <parisc-linux@puffin.external.hp.com>; Tue, 28 Nov 2000 13:04:44 -0700
Received: from lightning.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 28 Nov 2000 20:07:06 -0000
Subject: Re: [parisc-linux] Include trouble
To: bame@noam.fc.hp.com (Paul Bame)
Date: Tue, 28 Nov 2000 20:02:26 +0000 (GMT)
Cc: dave@hiauly1.hia.nrc.ca (John David Anglin),
        alan@linuxcare.com.au (Alan Modra), marteaut@esiee.fr,
        parisc-linux@thepuffingroup.com
In-Reply-To: <E140qPF-0005T4-00@noam.fc.hp.com> from "Paul Bame" at Nov 28, 2000 12:27:09 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E140qxQ-0004wV-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> One dilema is that off_t is supposed to
> be good for file offsets, which these days means it should be 64 bits.

off_t should be a natural type. So it should be 32bits. glibc 2.2 deals with
the 64bit I/O stuff nicely

> However I'm leaning towards leaning with the older 32-bit off_t because
> we might not want to be the first ones to fix all the problems with
> making it 64 bits on a 32-bit machine.

Go 32bit. Linus will probably refuse to touch a 32bit port using longlong
internally for off-t
