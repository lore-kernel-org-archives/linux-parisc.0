Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id DE7C5482A
	for <parisc-linux@parisc-linux.org>; Mon,  4 Jun 2001 12:17:04 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 010C9B007; Mon,  4 Jun 2001 19:13:41 +0100 (BST)
Date: Mon, 4 Jun 2001 19:13:41 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: diab <diab@diab.rulez.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] dpkg-utils, ./configure --host, mysql3.23
Message-ID: <20010604191341.A25745@linuxcare.com>
References: <Pine.LNX.4.21.0106041203450.21361-100000@droid3.webreklam.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <Pine.LNX.4.21.0106041203450.21361-100000@droid3.webreklam.hu>; from diab@diab.rulez.org on Mon, Jun 04, 2001 at 12:19:02PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jun 04, 2001 at 12:19:02PM +0200, diab wrote:
> 
> just tried to apt-get source wget to make a debianized version of it, but
> dpkg-utils (which contains dpkg-source) depends on perl5 which is not
> installed. this way it is kind of hard to simply make debs using the
> usual apt-get source approach.

I have a machine on which I just did a clean install from the 0.9 release
CD, and then upgraded all installed packages from the more-packages dir.
Installed various other debs from the CD and web also.

slab:/usr/src/wget# apt-get -b source wget
Reading Package Lists... Done
Building Dependency Tree... Done
Need to get 722kB of source archives.
Get:1 http://http.us.debian.org unstable/main wget 1.6-2 (dsc) [713B]
Get:2 http://http.us.debian.org unstable/main wget 1.6-2 (tar) [671kB]
Get:3 http://http.us.debian.org unstable/main wget 1.6-2 (diff) [50.4kB]                                                                   
dpkg-source: extracting wget in wget-1.6                                                                                                   
dpkg-buildpackage: source package is wget
dpkg-buildpackage: source version is 1.6-2
dpkg-buildpackage: source maintainer is Nicolás Lichtmaier <nick@debian.org>
dpkg-buildpackage: build architecture is hppa

etc.  had to edit debian/rules to add --host=hppa-linux
to the configure line, but after that it builds ok.

The perl5 problem should be solved by the new version of apt
that is on the CD.  perl provides perl5, but the old apt you
(probably) have doesn't understand that.

Richard
