Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA22002
	for <parisc-linux@puffin.external.hp.com>; Fri, 14 Jul 2000 10:23:35 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 14 Jul 2000 16:25:10 -0000
To: law@cygnus.com
Cc: Paul Bame <bame@noam.fc.hp.com>,
        Alan Modra <amodra@puffin.external.hp.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Non-bootable kernel problems
References: <2654.963516035@upchuck>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 14 Jul 2000 12:10:16 -0400
In-Reply-To: Jeffrey A Law's message of "Thu, 13 Jul 2000 13:20:35 -0600"
Message-ID: <87hf9szo9j.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Jeffrey A Law <law@cygnus.com> writes:

> How/why is ld -r changing the addends?  That seems wrong at first glance.

The relocations in question are specified as <.data+0xf00>, and thus,
as far as I can tell, it has to change the addends since there is no
symbol value within .data that it can update.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
