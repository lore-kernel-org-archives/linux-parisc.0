Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA20699
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Sep 2000 18:27:24 -0600
Sender: mang@mailserv2.iuinc.com
Message-ID: <39CBF956.4833E405@subcarrier.org>
Date: Fri, 22 Sep 2000 20:29:10 -0400
From: Michael Ang <mang@subcarrier.org>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] cvs directory renaming - *action required*
List-ID: <linux-parisc.vger.kernel.org>

In order to reduce some of the confusion about which directory was
active in the repository (did I want "binutils", "binutils-old", or
"binutils-2.10"?) some of the directories in the repository will be
renamed.  This will be moderately painful, but it's better to do the
painful thing now while we can still stamp out the old cruft.

"linux-2.3" will be renamed to "linux"
"binutils-2.10" will be renamed to "binutils"

If you currently have a tree checked out, you will need to change all of
your CVS/Repository files to point to the new directory names.  With
bash you can do it like this:
$ cd linux-2.3
$ for i in `find . -name Repository`; do echo "linux" > $i; done
$ cd binutils-2.10
$ for i in `find . -name Repository`; do echo "binutils" > $i; done

You can do this now, since there is a symlink set up to support both
names.  The alias for the old name will be removed Wednesday.  If you do
not hack your tree by then you won't be able to play (update, checkout,
etc) until you have the right repository entries.

Can someone please update the recipe and cvs info on
www.thepuffingroup.com/parisc?  Until the docs are updated, you can
mentally substitute "linux" for "linux-2.3" and "binutils" for
"binutils-2.10".

These should be the last directory games we play in the repository. 
After this, new vendor versions should be checked into the existing
directories (on a branch).  This will reduce the confusion from using
directory names for version control.

	- Mike.

P.S. If out of archeological interest you're looking for the old {linux,
binutils, binutils-old, egcs-old} directory, it's been moved under
directory "obsolete". e.g. "cvs co obsolete/binutils-old".
