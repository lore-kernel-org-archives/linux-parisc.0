Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA29426
	for <parisc-linux@puffin.external.hp.com>; Thu, 6 May 1999 15:16:46 -0600
Date: Thu, 6 May 1999 15:14:59 -0700 (PDT)
From: Jason Eckhardt <jason@equator.com>
Message-Id: <199905062214.PAA16853@gatekeeper.equator.com>
To: prumpf@jcsbs.lanobis.de
Subject: Re: [parisc-linux] ld problem workaround
Cc: parisc-linux@thepuffingroup.com
List-ID: <linux-parisc.vger.kernel.org>


> Is there any reason not to let this stay in the kernel tree ? I think being able
> to make the necessary changes in the CVS tree instead of sending them to you would
> be convenient. (Or is the "official version" the CVS one ?)
>

  Currently I am behind a firewall and cannot use CVS through it. This
  will be remedied shortly. In any case, a slightly older version of the
  bootloader is in the CVS tree. The mentioned file is the newest version,
  though, and should probably be used instead.
  What code are you proposing to add to the bootloader? ext2 support is
  underway.
  Jason.
