Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7353D483E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Sep 2003 04:50:10 -0600 (MDT)
Date: Fri, 26 Sep 2003 03:34:58 -0700
From: "David S. Miller" <davem@redhat.com>
To: <santosh.abraham@hp.com>
Cc: santosha@india.hp.com, willy@debian.org, randolph@tausq.org,
	parisc-linux@lists.parisc-linux.org, sct@redhat.com
Subject: Re: [parisc-linux] Fwd:  Problems with raw interface.
Message-Id: <20030926033458.68dbb768.davem@redhat.com>
In-Reply-To: <001201c3841a$d5be9900$e5624c0f@india.hp.com>
References: <20030925142623.GO13172@parcelfarce.linux.theplanet.co.uk>
	<001201c3841a$d5be9900$e5624c0f@india.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

1) Please use unified diffs when you post patches.

2) If you insist on using Microsoft Outlook when posting patches
   at least configure it properly when doing so.  By default it is
   going to turn tabs into spaces and that makes the patch corrupt
   and unusable by anyone.

2) Your patch is unacceptable because it is taking advantage
   of internal implementation details of flush_dcache_page()
   on parisc64 that might not (and in fact, is not) be true
   on other platforms.
