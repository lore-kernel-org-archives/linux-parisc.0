Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA17796
	for <parisc-linux@puffin.external.hp.com>; Mon, 18 Dec 2000 09:00:26 -0700
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 18 Dec 2000 16:03:21 -0000
Received: from ottawa.linuxcare.com (HELO linuxcare.com) (216.208.98.2)
  by smtp.linuxcare.com with SMTP; 18 Dec 2000 16:03:15 -0000
Sender: adevries@mailserv2.iuinc.com
Message-ID: <3A3E35DC.1DA98F7@linuxcare.com>
Date: Mon, 18 Dec 2000 11:05:48 -0500
From: Alex deVries <adevries@linuxcare.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] New web site in CVS...
List-ID: <linux-parisc.vger.kernel.org>


I've checked in the redone web site into CVS; it's in a module called
'web'.

The current implementation balances both the need for developers to
check out and locally host the pages without custom server
configuration, and the need for Linuxcare's professional web team to
have features that they need.  Balancing these two hasn't always been
easy.

Here's how it works.  In the site there are two directories; src which
contains raw .x files, and tools, which contains a somewhat hacked up
perl script to do processing.  Running 'make' in the root directory will
create a directory called 'generated' which will contain the final HTML.
To make your changes, just edit the source in the src/ directory.

At this point, I don't feel any need to change the overall architecture
and design of this site.  Everyone wants something different, and I want
you to actually use this for awhile before you consider anything else.

The content, however, I'd appreciate feedback and CVS commits on. 
Please be constructive.

We'll continue the use of the existing website until we determine that
the new content is ready to go up, then we'll switch over the hosting. 
Because of the holidays coming up, that switch will probably be at the
very beginning of January.

- Alex "happy the fight with CVS is over" deVries

-- 
Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
613.562.2759 tel
alex@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Support for the revolution.
