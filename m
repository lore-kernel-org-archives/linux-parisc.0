Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 54DDD4843
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 10 Jan 2004 21:51:58 -0700 (MST)
Date: Sat, 10 Jan 2004 21:51:56 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Damien <Damien@cetic.be>
Message-ID: <20040111045156.GA383@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Subject: [parisc-linux] Re: KDE and sarge (dcopserver?)
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

References: <20040109151436.51FB54E8F8@mailhost.cetic.be>
In-Reply-To: <20040109151436.51FB54E8F8@mailhost.cetic.be>

Damien,
My apologies.
I was hunting through parisc-linux mail archives for something else and
noticed Helge Deller did NOT post his patch to parisc-linux mailing list:

	Subject: [PATCH] fix KJS crash on some more strict platforms
	Date: Tuesday 16 December 2003 22:08
	To: kde-core-devel@kde.org

I've dropped Helge's patch and rebuilt kdelibs packages here:
	http://www.parisc-linux.org/~grundler/kdelibs-3.1.4/

The official fix is slightly different but this works.
I've installed kdelibs4, kdelibs-bin, and kdelibs-data from the above
and konqueror is again working on my c3k (32-bit 2.6.0-pa7, sarge).
Might only need to install kdelibs4 and the not others.

This patch also suggested the kernel LDD misaligned trap handler wasn't
working correctly. Lamont Jones fixed with this checkin (2.4.23-pa5 IIRC):
	http://lists.parisc-linux.org/pipermail/parisc-linux-cvs/2003-December/033645.html

hth,
grant
