Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 45A81482D
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Dec 2001 10:03:29 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id eigmjaaa for parisc-linux@lists.parisc-linux.org; Wed, 5 Dec 2001 09:58:18 -0700
Date: Wed, 5 Dec 2001 09:03:22 -0800
From: Randolph Chung <tausq@debian.org>
To: Colin Watson <cjwatson@debian.org>
Cc: Richard Hirst <rhirst@linuxcare.com>,
	debian-hppa@lists.debian.org, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: groff build on hppa
Message-ID: <20011205090322.Q944@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20011204134445.GA9231@riva.ucam.org> <20011205155919.E7051@linuxcare.com> <20011205081939.O944@tausq.org> <20011205163920.GA24484@riva.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011205163920.GA24484@riva.ucam.org>
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

> So would there be objections to me doing a special build on hppa with
> the CFLAGS/CXXFLAGS hacked, given that there are three days left, or do
> I have to upload again?

Please make the appropriate source changes and make another upload.
Source-hacks that don't end up in the archive are considered very bad
practice.

There's a possible patch to fix this problem. I'm verifying this with
upstream at the moment.

randolph
-- 
Debian Developer <tausq@debian.org>
http://www.TauSq.org/
