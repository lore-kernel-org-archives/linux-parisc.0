Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA13922
	for <parisc-linux@puffin.external.hp.com>; Fri, 1 Sep 2000 13:43:16 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 1 Sep 2000 19:43:21 -0000
Received: from dhd by localhost with local (Exim 3.12 #1 (Debian))
	id 13UwhH-00060d-00
	for <parisc-linux@thepuffingroup.com>; Fri, 01 Sep 2000 15:41:55 -0400
To: parisc-linux@thepuffingroup.com
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 01 Sep 2000 15:41:55 -0400
Message-ID: <87r973lx18.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Branching "stable" 2.3.99pre8 kernel
List-ID: <linux-parisc.vger.kernel.org>

Hi,

As some people have probably heard me say in person, the current head
branch of the kernel CVS tree is a substantial step backwards in speed
and now stability from 2.3.99pre8, and is not really usable for me to
do any user-space work on.

My 2.3.99pre8 tree (see below) crashes *repeatably* and
*deterministically* (with the exception of NFS which is basically crap
anyway), and therefore I'm fixing them as I find them.  In contrast,
what we've got at the head of our CVS crashes *randomly* on my A180
and will not stay up long enough to run the configure script of any of
the programs I have successfully built natively on 2.3.99pre8.

I don't know whether this is because 2.4.0test5 is broken upstream, or
whether we screwed up the merge, but it is simply unusable for my
purposes.

Therefore, until it gets fixed, I am using a hacked-up combination of
the pre-merge 2.3.99pre8 and updated signal and trap handling code.  I
would like to tag this as a branch in CVS so that I can continue to
fix kernel bugs that affect me without having to fully update to 2.4.0.

Will people mind terribly if I do this?  It should be trivial to merge
changes from the branch as needed.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
