Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA06053
	for <parisc-linux@puffin.external.hp.com>; Mon, 21 Jun 1999 11:53:57 -0600
To: Stan Sieler <sieler@allegro.com>
cc: Matthew.Wilcox@genedata.com (Matthew Wilcox),
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HPUX binary compatibility 
Reply-To: law@cygnus.com
In-reply-to: Your message of Mon, 21 Jun 1999 10:23:17 PDT.
             <199906211723.KAA39308@bart.allegro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 21 Jun 1999 11:48:23 -0600
Message-ID: <14480.929987303@upchuck.cygnus.com>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>


  In message <199906211723.KAA39308@bart.allegro.com>you write:
  > The problem with translators is that they don't work in all cases.
  > 
  > The most important case is where you want to link some .o files
  > together: some are compiled for Linux, some for HP-UX. 
  > 
  > *That's* why having different system call numbers is important.
You really don't want to do that.  I strongly recommend against it.  In
5 years of working on a system which had hpux compatibility we had zero
need to do this kind of stuff and it just makes things a lot more complicated
than they need to be.

If we wanted to build an hpux app, we had a set of tools to build hpux apps.

jeff
