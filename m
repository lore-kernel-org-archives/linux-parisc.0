Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA24880
	for <parisc-linux@puffin.external.hp.com>; Mon, 25 Sep 2000 19:57:20 -0600
Sender: mang@mailserv2.iuinc.com
Message-ID: <39D002FB.242B2DD4@subcarrier.org>
Date: Mon, 25 Sep 2000 21:59:23 -0400
From: Michael Ang <mang@subcarrier.org>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] cvs renaming complete
List-ID: <linux-parisc.vger.kernel.org>

The directory renaming in the repository is complete.  The new (and
hopefully final) directory names are "linux" and "binutils", as you
might expect.

The trick to get your old tree in sync with the new directory names,
courtesy of Alan Modra:

cd linux-2.3
for z in `find . -name Repository`
do
  sed -e 's/-2.3//' $z > zzz && mv zzz $z
done

And for binutils-2.10:

cd binutils-2.10
for z in `find . -name Repository`
do
  sed -e 's/-2.10//' $z > zzz && mv zzz $z
done


You will no longer be able to update or run other commands on an old
tree that hasn't been munged with the sed trick.  Instead you'll run
into a fake lock that will hopefully lead you to this message.

e.g.
[mang@lovehaze linux-2.3]$ cvs up
cvs server: Updating .
cvs server: [19:44:53] waiting for dir_renamed_read_your_mail's lock in
/home/cvs/parisc/linux-2.3

I for one regard renaming directories in the repository to be a great
evil.  So please try not to create any unnecessary top-level
directories.  I'd be happy to help anyone create a branch instead of
having to go through renaming again :)

	- Mike.
