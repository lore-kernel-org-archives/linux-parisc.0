Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cygnus.com (runyon.cygnus.com [205.180.230.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 67CA9482A
	for <parisc-linux@parisc-linux.org>; Sat, 14 Apr 2001 17:01:14 -0600 (MDT)
Sender: drepper@cygnus.com
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: amodra@one.net.au, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] xfree86 build problem
References: <200104142218.QAA30044@puffin.external.hp.com>
Reply-To: drepper@cygnus.com (Ulrich Drepper)
From: Ulrich Drepper <drepper@redhat.com>
Date: 14 Apr 2001 16:00:52 -0700
In-Reply-To: Grant Grundler's message of "Sat, 14 Apr 2001 16:18:47 -0600"
Message-ID: <m3itk7jdcr.fsf@otr.mynet.cygnus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler <grundler@puffin.external.hp.com> writes:

> Do other arches allow non-PIC .o's to be linked into a .so lib?

Many do.  You will get text relocations (indicated by the DT_TEXTREL
tag) which render your DSO unsharable.

-- 
---------------.                          ,-.   1325 Chesapeake Terrace
Ulrich Drepper  \    ,-------------------'   \  Sunnyvale, CA 94089 USA
Red Hat          `--' drepper at redhat.com   `------------------------
