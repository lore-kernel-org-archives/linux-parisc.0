Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from edu.joroinen.fi (edu.joroinen.fi [195.156.135.125])
	by dsl2.external.hp.com (Postfix) with SMTP id C095E482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 22 Oct 2001 14:39:27 -0600 (MDT)
Date: Mon, 22 Oct 2001 23:39:25 +0300 (EEST)
From: =?ISO-8859-1?Q?Pasi_K=E4rkk=E4inen?= <pasik@iki.fi>
To: Nicholas Leippe <nick@byu.edu>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] how to use dpkg/dselect/apt-get ???
In-Reply-To: <01102021292604.00166@nick>
Message-ID: <Pine.LNX.4.33.0110222332481.2564-100000@edu.joroinen.fi>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 20 Oct 2001, Nicholas Leippe wrote:

> Thankyou for the link.  Unfortunately, I've already read that one
> and found it of little help.
>
> I am not against whatever debian uses considering all the wonderful
> features it's supposed to have, just rather annoyed that it is such a
> difficult/disgusting interface.
>

Some basic commands:

This will update the list of available packages:

=09apt-get update

This will upgrade all of your installed packages to newest versions:

=09apt-get dist-upgrade

Searching for a package 'foo':

=09apt-cache search foo

Download and install package 'foo':

=09apt-get install foo

Listing the files in package 'foo':

=09dpkg -L foo

Displaying status of package 'foo':

=09dpkg -s foo

Display information of not-installed package 'foo':

=09apt-cache show foo

Removing package 'foo':

=09apt-get remove foo
or
=09dpkg --purge foo

Checking to what package file 'foo' belongs to:

=09dpkg -S /path/to/foo


And so on..

the 'sources' for apt are configured in /etc/apt/sources.list
You can add your favourite mirror in there.

And if you need to find which package includes file 'foo' you can check it
from http://packages.debian.org (use the search that let's you search insid=
e
packages).


Hope that helps.


- Pasi K=E4rkk=E4inen


                                   ^
                                .     .
                                 Linux
                              /    -    \
                             Choice.of.the
                           .Next.Generation.
