Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id XAA19318
	for <parisc-linux@puffin.external.hp.com>; Mon, 6 Sep 1999 23:32:33 -0600
To: Ryan Bradetich <rbradetich@uswest.net>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Linker question.... 
Reply-To: law@cygnus.com
In-reply-to: Your message of Mon, 06 Sep 1999 17:41:01 MDT.
             <37D4510D.B206030E@uswest.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 06 Sep 1999 23:32:30 -0600
Message-ID: <22099.936682350@upchuck.cygnus.com>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>



  In message <37D4510D.B206030E@uswest.net>you write:
  > I've  spent a good portion of the day searching the archives on how to
  > address this problem, and the theme I've discovered is the kernel needs
  > to be compiled/linked under HP-UX?
That is correct.  There is no cross-linker support for the SOM format.  The
elf tools are in progress, but not ready for use.

jeff
