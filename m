Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from gateway.sf.frob.com (adsl-64-163-212-31.dsl.snfc21.pacbell.net [64.163.212.31])
	by dsl2.external.hp.com (Postfix) with ESMTP id 621DD4829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Dec 2002 19:51:54 -0700 (MST)
Date: Mon, 2 Dec 2002 18:51:46 -0800
Message-Id: <200212030251.gB32pk213186@magilla.sf.frob.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: Roland McGrath <roland@redhat.com>
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Cc: libc-alpha@sources.redhat.com, debian-glibc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: Carlos O'Donell's message of  Monday, 2 December 2002 21:43:58 -0500 <20021203024358.GA5487@systemhalted>
Subject: [parisc-linux] Re: [PATCH] fix masking error in fesetround() on hppa
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

I've put that fix in.  I'm not quite sure what you are suggesting for a new
test, but test cases that fail on known bug regressions (i.e. one that
fails before your fix and works after it) are always welcome.


Thanks,
Roland
