Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from velli.mail.jippii.net (velli.mail.jippii.net [195.197.172.114])
	by dsl2.external.hp.com (Postfix) with ESMTP id 889104829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 13 Aug 2002 06:43:40 -0600 (MDT)
Received: from amos (unknown [195.16.220.86])
	by velli.mail.jippii.net (Postfix) with SMTP id 86CC61BFA3
	for <parisc-linux@lists.parisc-linux.org>; Tue, 13 Aug 2002 15:43:32 +0300 (EEST)
Message-ID: <003301c242c7$530be9d0$56dc10c3@amos>
From: "Kaj-Michael Lang" <milang@tal.org>
To: <parisc-linux@lists.parisc-linux.org>
Date: Tue, 13 Aug 2002 15:45:21 +0300
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] First test release of TA-Linux for parisc
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

I've been working on my own little distro for sometime now, and
I'm happy to announce the first test version of TA-Linux for parisc systems.

A bootable lifimage can be found here:
http://hotel.tal.org/pub/current/parisc/image/lifimage-20020812
and also from sourceforge:
http://sourceforge.net/project/showfiles.php?group_id=20130&release_id=10497
4

You should be able to perform a http install using the above image.
A couple of things that you need to know:
- Use http://hotel.tal.org/pub/current/parisc/ as install source url
- XFree86 is broken at this time.
- The installer is *very* simple, but works if you don't make any mistakes
:)
- Keymap install does not work, just skip over it.
- Palo needs to be installed manualy, but that shouldn't be a problem.

More information about TA-Linux can be found on its homepage:
http://www.tal.org/linux/talinux/

Enjoy :)

--
Kaj-Michael Lang , milang@tal.org
