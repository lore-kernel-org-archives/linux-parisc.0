Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA02321
	for <parisc-linux@puffin.external.hp.com>; Sat, 23 Sep 2000 01:54:19 -0600
Sender: mang@mailserv2.iuinc.com
Message-ID: <39CC6213.5B7DDC41@subcarrier.org>
Date: Sat, 23 Sep 2000 03:56:03 -0400
From: Michael Ang <mang@subcarrier.org>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] cvs directory renaming - *action required*
References: <39CBF956.4833E405@subcarrier.org> <20000923150340.M21274@neep.com.au>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Andrew Shugg wrote:
> 
> $ for i in $(find linux-2.3 binutils-2.10 -name Repository); do echo $(cat $i|sed 's/-[0-9.]*//') > $i; done

This is also incorrect since you'll replace any dashes that appear.  You
want this:
cd binutils-2.10
for z in `find . -name Repository`
do
  sed -e 's/-2.10//' $z > zzz && mv zzz $z
done

> > P.S. If out of archeological interest you're looking for the old {linux,
> > binutils, binutils-old, egcs-old} directory, it's been moved under
> > directory "obsolete". e.g. "cvs co obsolete/binutils-old".
> 
> Why do this?  Why not just tag those two modules on Wednesday when you
> make the change to the repository structure?

Because "linux-2.3" is being renamed to "linux", so the old "linux" had
to go.  The stuff being moved is very old, and is being moved out of the
way to reduce the amount of cruft in the top level of the repository. 
This should be the last time we have to do this.  After the rename, no
new directories should be created unless absolutely necessary: branches
should be used instead.

	- Mike.
