Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tyke.pjc.net (public1-leed3-6-cust7.leed.broadband.ntl.com [80.7.68.7])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3E2E04829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Sep 2002 09:17:37 -0600 (MDT)
Received: from patrick by tyke.pjc.net with local (Exim 3.35 #1 (Debian))
	id 17s33e-0001g2-00
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Sep 2002 16:17:34 +0100
Date: Thu, 19 Sep 2002 16:17:34 +0100
From: Patrick Caulfield <patrick@tykepenguin.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020919151734.GH845@tykepenguin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Subject: [parisc-linux] HP/UX binaries
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

How do I go about trying to run HP/UX binaries on parisc-linux ?

In particular I would like to get bitkeeper running as there's an HP/UX binary
for that but no HP/Linux port :(

When I try to run the installer (or any of the binaries copied from the HP/UX
installation) I get

crt0: ERROR couldn't open /usr/lib/dld.sl errno:000000015

I've copied dld.sl from HP/UX into /usr/lib and my kernel has support for SOM
binaries in it. Is there anything else I need to do, or is it just not going to
work ?
-- 

patrick
