Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id WAA28779
	for <parisc-linux@puffin.external.hp.com>; Thu, 11 Nov 1999 22:04:05 -0700
Received: from sympatico.ca ([206.47.27.98]) by tomts2-srv.bellnexxia.net
          (InterMail vM.4.01.02.07 201-229-116-107) with ESMTP
          id <19991112050524.NFVT21715.tomts2-srv.bellnexxia.net@sympatico.ca>
          for <parisc-linux@thepuffingroup.com>;
          Fri, 12 Nov 1999 00:05:24 -0500
Message-ID: <382B598A.E46EFB6A@sympatico.ca>
Date: Fri, 12 Nov 1999 00:04:26 +0000
From: Sandy Harris <sandy.harris@sympatico.ca>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Diskless 712/60s
List-ID: <linux-parisc.vger.kernel.org>

I've got access to a moderately large pile of HP 712s, mostly 60s with a few faster ones,
dirt cheap. I'm contemplating trying to use an array of a few dozen of them for tasks like factoring, which need lots of MIPS
and RAM but not much communication.

I'd want to use a separate machine as a host and run the 712s diskless and headless. The
host would need dual e'net, one for 712 array and one for the world, so I might use a
Linux PC. I'd also need a machine for development, presumably a PA-RISC Linux box.

Questions:

Any recommendations for a machine that could be both host (should support dual e'net) and
development box (faster than 712, old enough to be available used)?

For the array, what are the trade-offs between using your native Linux vs. the older
micro-kernel stuff, with or without Linux atop it? These will mostly be pure compute
engines, 100% of CPU into a single process for hours or days at a time. All they really
need to do is boot from the net, load one process, and exchange occasional packets with
the host. Multitasking, the ability to access a file system via NFS, to run PVM, to
report status via SNMP, ... would definitely be nice, but aren't actually essential.

Virtual memory would be a detriment. How hard is it to eliminate?

What is the state of PA-RISC Linux for this application? The only device driver I'd need
is ethernet.


P.S. A friend has a large pile of used HP machines, mostly at reasonable prices. 712s are
the low end of the range. Anyone in the Ottawa area who needs some, send mail.
