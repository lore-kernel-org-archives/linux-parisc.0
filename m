Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA28163
	for <parisc-linux@puffin.external.hp.com>; Sun, 20 Jun 1999 13:46:52 -0600
From: Stan Sieler <sieler@allegro.com>
Message-Id: <199906201945.MAA27215@bart.allegro.com>
Subject: Re: [parisc-linux] HPUX binary compatibility
To: Matthew.Wilcox@genedata.com (Matthew Wilcox)
Date: Sun, 20 Jun 1999 12:45:54 -0700 (PDT)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <19990620194015.J30362@mencheca.ch.genedata.com> from "Matthew Wilcox" at Jun 20, 99 07:40:15 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Re:

> How far do we want to or are we able to go with making constants identical
> between HPUX and Linux?
> 
> Some syscalls are going to have to be different between the two OSes --
> ioctl is the obvious example -- but it would be nice to have to do as
> little work as possible.

that's why I suggested shifting the Linux system call magic numbers
upwards, to avoid the HP range.  If the Linux ioctl is different than the
HP-UX one, then it should have a different syscall number.
 
> Linux has things which HPUX doesn't, HPUX might later allocate the same
> number for a different extension.

Not if HP agrees to reserve a range for Linux use.
 
> (Of course, if HP want to add Linux binary compatibility to HPUX, now
> would be a great time to mention it :-)

that sounds fair!
 
-- 
Stan Sieler                                          sieler@allegro.com
                                         http://www.allegro.com/sieler/
