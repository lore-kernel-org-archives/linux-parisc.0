Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 273E8482B
	for <parisc-linux@parisc-linux.org>; Mon,  5 Nov 2001 22:42:38 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id tpjpiaaa for parisc-linux@parisc-linux.org; Mon, 5 Nov 2001 22:37:31 -0700
Date: Mon, 5 Nov 2001 21:42:27 -0800
From: Randolph Chung <tausq@debian.org>
To: "Christopher C. Chimelis" <chris@debian.org>
Cc: parisc-linux@parisc-linux.org, bcollins@debian.org
Subject: Re: [parisc-linux] Re: hppa binutils/glibc updates
Message-ID: <20011105214227.M505@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20011105024952.C4441@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.21.0111050136140.2956-100000@spawn.hockeyfiend.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0111050136140.2956-100000@spawn.hockeyfiend.com>
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

I've posted debs for testing at http://gluck.debian.org/~tausq/hppa/

The following are available:

binutils (with latest patches from Alan Modra)
gcc (with ldcw alignment patch)
glibc (with latest patches from Alan Modra)
python and apache rebuilt with new toolchain bits

these are all unofficial.... Chris/Ben will be uploading official
binutils/glibc. gcc will be uploaded as soon as the new binutils are in
incoming....

there're still some problems with exception handling for g++, but in
general these should work.... pls post to the list if you find
otherwise.

randolph
-- 
Debian Developer <tausq@debian.org>
http://www.TauSq.org/
