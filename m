Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA19681
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Dec 1999 10:14:13 -0700
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id MAA29337
	for parisc-linux@thepuffingroup.com; Thu, 30 Dec 1999 12:16:55 -0500
Date: Thu, 30 Dec 1999 12:16:55 -0500
From: Matthew Wilcox <willy@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <19991230121655.T12629@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Trouble building CVS binutils
List-ID: <linux-parisc.vger.kernel.org>


I just attempted to build the binutils in CVS and ran across this problem.
When building bfd/hpux-core.c, it stops with a parse error before uint64_t
which is used in one of the hpux header files.  <sys/_inttypes.h>
does not define this type unless the __STDC_EXT__ symbol is defined.
I added this symbol to the egcs spec file and binutils now builds, but
I'm not sure this is the most appropriate fix.  It probably is, since
HPUX's headers seem to use this as a sign that the compiler supports
`long long', but I'm not sure if that's the only thing it means.
  
Now back to finding out why nm no longer likes to work on vmlinux...

-- 
"If I abstain from fun and such,
 I'll probably amount to much;
 But I shall stay the way I am,
 Because I do not give a damn."
