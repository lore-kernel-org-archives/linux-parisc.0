Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA02145
	for <parisc-linux@puffin.external.hp.com>; Wed, 13 Dec 2000 17:29:37 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 14 Dec 2000 00:32:03 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA06772;
	Thu, 14 Dec 2000 11:31:46 +1100
Date: Thu, 14 Dec 2000 11:31:46 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matt Taggart <taggart@carmen.fc.hp.com>
cc: parisc-linux@thepuffingroup.com, jes@linuxcare.com
Subject: Re: [parisc-linux] phase 2 gcc build fails 
In-Reply-To: <20001214002046.6D9BE37CA1@carmen.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0012141124330.2565-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 13 Dec 2000, Matt Taggart wrote:

> Alan Modra writes...
> 
> > I probably broke the CVS repo, when I ran "cvs admin -b" following your
> > updated recipe.  I do have a checked-out tree, to probably can put things
> > back as they were.
> 
> Since admin -b reverts the default branch, wouldn't importing cygnus source 
> fix things?

It looks like an import was done at some stage without merging stuff back
to the main trunk.  eg.

File: config.if         Status: Needs Patch

   Working revision:    1.1.1.2
   Repository revision: 1.1     /home/cvs/parisc/gcc/config.if,v
   Sticky Tag:          (none)
   Sticky Date:         (none)
   Sticky Options:      (none)

   Existing Tags:
        before20000925merge             (revision: 1.1.1.2)
        before20000822merge             (revision: 1.1.1.2)
        gcc-2_96-gnu-20000707           (revision: 1.1.1.2)
        GNU_DIST                        (branch: 1.1.1)
        gcc-2_9-hppa-20000707           (branch: 1.1.1.1.4)
        pre_fest                        (revision: 1.1.1.1)
        ELF_BRANCH                      (branch: 1.1.1.1.2)
        ELF_BASE                        (revision: 1.1.1.1)
        initial_checkin                 (revision: 1.1.1.1)
        gcc-2_9-hppa-991112             (branch: 1.1.1)

What I've got to do, I guess, is to commit my tree back to the main truck.
eg. in the case of config.if, we want a version 1.2 which will be identcal
to version 1.1.1.2

-- 
Linuxcare.  Support for the Revolution.
