Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00045aedab24-CM.cpe.net.cable.rogers.com [24.112.227.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id CE993482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 25 Mar 2003 16:40:08 -0700 (MST)
Received: from carlos by systemhalted with local (Exim 3.35 #1 (Debian))
	id 18xy22-0007mg-00
	for <parisc-linux@lists.parisc-linux.org>; Tue, 25 Mar 2003 18:40:38 -0500
Date: Tue, 25 Mar 2003 18:40:38 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030325234038.GA29675@systemhalted>
References: <20030325171725.GO8436@systemhalted> <3E802FB00000055E@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E802FB00000055E@ocpmta1.freegates.net>
Subject: [parisc-linux] glibc 2.3.2 patches updated, still no working sysdep-cancel
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

>I'll update in a few hours with a new sysdep-cancel patch.

Patches updated:
http://www.baldric.uwo.ca/~carlos/glibc-2.3.2-patches.tar.gz

Still no luck on getting sysdep-cancel to work. I'll need another pair
of eyes to look at the assembly in sysdep-cancel.h

c.
