Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 16117482A
	for <parisc-linux@parisc-linux.org>; Thu, 24 May 2001 16:00:46 -0600 (MDT)
Received: from security.hp.com (cranston.fc.hp.com [15.1.44.224])
	by atlrel2.hp.com (Postfix) with ESMTP id 942953B1
	for <parisc-linux@parisc-linux.org>; Thu, 24 May 2001 18:00:45 -0400 (EDT)
To: LaMont Jones <lamont@hp.com>
Cc: parisc-linux@parisc-linux.org, lamont@hp.com
In-reply-to: Your message of "Thu, 24 May 2001 15:32:59 MDT."
             <20010524213301.126241872C@security.hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Thu, 24 May 2001 15:59:30 -0600
From: LaMont Jones <lamont@hp.com>
Message-Id: <20010524215930.76E741872C@security.hp.com>
Subject: [parisc-linux] Re: still getting $$dyncall refs in shlibs
List-ID: <linux-parisc.vger.kernel.org>

> With the new toolchain, sipp still builds a libsipp.so.3.1 trips the
> bug checker.  Checking everything on the system doesn't find any bad
> libs.  Here is the build output for libsipp.so:

Add the following .debs to the list of things that still build borken:
    auto-apt_0.3.11.0.1_hppa.deb
    installwatch_0.5.5-3.0.1_hppa.deb
    libc-client2000_2000cdebian-2_hppa.deb
    libg20_0.42.20010417-1.0.1_hppa.deb
    libmagick++5_5.3.3-5_hppa.deb
    libmimelib1_2.1.0-1.0.1_hppa.deb
    libpam-radius-auth_1.3.11-3.0.1_hppa.deb
    libseal1_1.07-4.0.1_hppa.deb
    sciplot1_1.36-8.0.1_hppa.deb
    sipp_3.1-7.0.1_hppa.deb
    slatec_4.1-4.0.1_hppa.deb

lamont
