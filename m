Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 464B74829
	for <parisc-linux@parisc-linux.org>; Thu, 26 Jun 2003 11:41:29 -0600 (MDT)
Date: Thu, 26 Jun 2003 10:45:27 -0700
From: Randolph Chung <tausq@debian.org>
To: Matthew Wilcox <willy@debian.org>
Cc: Joel Soete <jsoe0708@tiscali.be>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] warning: minor abi change
Message-ID: <20030626174527.GM1481@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20030626135451.GL451@parcelfarce.linux.theplanet.co.uk> <3ED70CF10000A63F@ocpmta2.freegates.net> <20030626170628.GO451@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030626170628.GO451@parcelfarce.linux.theplanet.co.uk>
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

> they're irrelevant if you use them via /proc/sys to access the feature.
> they're really important if you use them via sysctl(3).

fwiw we've already renumbered them at least twice in the past, and no
one has screamed yet :P

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
