Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA23474
	for <parisc-linux@puffin.external.hp.com>; Fri, 14 Jul 2000 10:50:32 -0600
To: David Huggins-Daines <dhd@linuxcare.com>
cc: Paul Bame <bame@noam.fc.hp.com>,
        Alan Modra <amodra@puffin.external.hp.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Non-bootable kernel problems 
Reply-To: law@cygnus.com
In-reply-to: Your message of 14 Jul 2000 12:10:16 EDT.
             <87hf9szo9j.fsf@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 14 Jul 2000 10:39:22 -0600
Message-ID: <1991.963592762@upchuck>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>


  In message <87hf9szo9j.fsf@linuxcare.com>you write:
  > Jeffrey A Law <law@cygnus.com> writes:
  > 
  > > How/why is ld -r changing the addends?  That seems wrong at first glance.
  > 
  > The relocations in question are specified as <.data+0xf00>, and thus,
  > as far as I can tell, it has to change the addends since there is no
  > symbol value within .data that it can update.
Either we need to avoid merging the section symbols to avoid twiddling
the addend, or we need to avoid reducing relocs to section symbols to
begin with.

jeff
