Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 75612482E
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Dec 2001 09:20:01 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id sxfmjaaa for parisc-linux@lists.parisc-linux.org; Wed, 5 Dec 2001 09:14:48 -0700
Date: Wed, 5 Dec 2001 08:19:39 -0800
From: Randolph Chung <tausq@debian.org>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Colin Watson <cjwatson@debian.org>, debian-hppa@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: groff build on hppa
Message-ID: <20011205081939.O944@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20011204134445.GA9231@riva.ucam.org> <20011205155919.E7051@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011205155919.E7051@linuxcare.com>
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

> Builds for me with -O1 rather than -O2 in debian/rules, if that is
> any help.

This is a known bug with the compiler... .building with
-fno-strength-reduce works around this bug.

randolph
-- 
Debian Developer <tausq@debian.org>
http://www.TauSq.org/
