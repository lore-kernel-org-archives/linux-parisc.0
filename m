Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA01448
	for <parisc-linux@puffin.external.hp.com>; Sat, 23 Sep 2000 01:03:39 -0600
Received: (from andrew@localhost)
	by guinness.neep.com.au (8.9.3/8.9.3/Debian/GNU) id PAA28258
	for parisc-linux@thepuffingroup.com; Sat, 23 Sep 2000 15:03:48 +0800
Date: Sat, 23 Sep 2000 15:03:44 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] cvs directory renaming - *action required*
Message-ID: <20000923150340.M21274@neep.com.au>
References: <39CBF956.4833E405@subcarrier.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <39CBF956.4833E405@subcarrier.org>; from mang@subcarrier.org on Fri, Sep 22, 2000 at 08:29:10PM -0400
List-ID: <linux-parisc.vger.kernel.org>

Michael Ang said:
> In order to reduce some of the confusion about which directory was
> active in the repository (did I want "binutils", "binutils-old", or
> "binutils-2.10"?) some of the directories in the repository will be
> renamed.  This will be moderately painful, but it's better to do the
> painful thing now while we can still stamp out the old cruft.
> 
> "linux-2.3" will be renamed to "linux"
> "binutils-2.10" will be renamed to "binutils"
> 
> If you currently have a tree checked out, you will need to change all of
> your CVS/Repository files to point to the new directory names.  With
> bash you can do it like this:

This file "binutils-2.10/gas/testsuite/gas/cris/CVS/Repository" doesn't
contain a full repository path - all the others are /home/cvs/... but
this one contains just the relative path.  Not sure what this means, if
anything...  Some of the Repository files in the linux-2.3 module have
the same sort of thing.  *shrug*  Anyone know?  =)

> $ cd linux-2.3
> $ for i in `find . -name Repository`; do echo "linux" > $i; done
> $ cd binutils-2.10
> $ for i in `find . -name Repository`; do echo "binutils" > $i; done

$ for i in $(find linux-2.3 binutils-2.10 -name Repository); do echo $(cat $i|sed 's/-[0-9.]*//') > $i; done

> P.S. If out of archeological interest you're looking for the old {linux,
> binutils, binutils-old, egcs-old} directory, it's been moved under
> directory "obsolete". e.g. "cvs co obsolete/binutils-old".

Why do this?  Why not just tag those two modules on Wednesday when you
make the change to the repository structure?

Andrew.

--
Andrew Shugg <andrew@neep.com.au>                http://www.neep.com.au/

  "Just remember Basil, there's always someone worse off than yourself."
  "Oh, really?  I'd like to meet him ... I could do with a good laugh."
                 [ Sybil and Basil Fawlty, "Fawlty Towers" ]
