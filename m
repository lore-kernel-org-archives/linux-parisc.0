Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id EB1E6482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Aug 2003 14:55:36 -0600 (MDT)
Message-Id: <200308112055.h7BKtZxr020907@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] xfree86 4.2.1-9 build problem
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Mon, 11 Aug 2003 16:55:34 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: grundler@parisc-linux.org, parisc-linux@lists.parisc-linux.org
In-Reply-To: <200308112038.h7BKc61c020812@hiauly1.hia.nrc.ca> from "John David Anglin" at Aug 11, 2003 04:38:06 pm
MIME-Version: 1.0
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

> Ok, here is what is happening.
> 
> First, I gave you the wrong advice on the option to get verbose info from ld.
> I gave you the hpux option.  The GNU option is `--verbose' or `-Wl,--verbose'
> when using the gcc driver.
> 
> Here is the linker path on gsyprf11:
> 
> SEARCH_DIR("/usr/hppa-linux/lib"); SEARCH_DIR("/usr/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib");

One further note: The default search path used by ldd doesn't agree
with the default path used by ld.  So, I think binutils and glibc
need to get together on this.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
