Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta05ps.bigpond.com (mta05ps.bigpond.com [144.135.25.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id A8C5E482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  5 Jan 2002 20:47:56 -0700 (MST)
Message-ID: <02d801c19665$87a5d520$090ba8c0@winnie>
From: "Peter Lavender" <plaven@bigpond.net.au>
To: "Peter Mottram" <peter@petescaff.com>
Cc: <parisc-linux@lists.parisc-linux.org>
References: <Pine.LNX.4.42.0201031237480.8858-100000@r6.petescaff.com>
Subject: Re: [parisc-linux] Problem with Samba on a D370
Date: Sun, 6 Jan 2002 14:52:13 +1100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Peter,

> This package doesn't yet appear to be built for hppa, but if you add an
> appropriate deb-src line for sid in your sources.list file then you can
> download and build the new samba packages using:
>
> apt-get source samba --build
>
> & then install the packages using 'dpkg -i'
>
> Hope I'm not teaching grandma to suck eggs here.

You may be for Herb, but for those of us new to Debian, this is a great way
to learn something without having to ask first.  :)

What do you mean by an appropriate line in the sources.list?  Is it a link
to the location of the samba package?

Thanks,

Pete
