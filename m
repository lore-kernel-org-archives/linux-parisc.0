Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA19537
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Nov 1999 18:16:03 -0700
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 25 Nov 1999 01:17:50 -0000
Subject: Re: [parisc-linux] Progress - Update
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Thu, 25 Nov 1999 01:17:16 +0000 (GMT)
Cc: dave@hiauly1.hia.nrc.ca, Philipp.H.Rumpf@mathe.stud.uni-erlangen.de,
        sieler@allegro.com, parisc-linux@thepuffingroup.com
In-Reply-To: <199911250031.TAA24156@hiauly1.hia.nrc.ca> from "John David Anglin" at Nov 24, 99 07:31:08 pm
Content-Type: text
Message-Id: <E11qnXB-0007Cl-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> Anybody know where or how the pointer "current" is defined?  It is not 
> in the map.  I think it is supposed to point current processes task_struct.

current is a macro getting the task struct by manipulating %esp
