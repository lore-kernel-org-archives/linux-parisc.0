Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA08854
	for <parisc-linux@puffin.external.hp.com>; Sat, 27 Nov 1999 15:12:20 -0700
Received: from storm.ca (dial02p57.ottawa.storm.ca [209.87.225.121])
	by mail.storm.ca (8.8.8+Sun/8.8.8) with ESMTP id RAA19059
	for <parisc-linux@thepuffingroup.com>; Sat, 27 Nov 1999 17:14:12 -0500 (EST)
Message-ID: <38401100.5FFDF373@storm.ca>
Date: Sat, 27 Nov 1999 17:12:32 +0000
From: Sandy Harris <sandy@storm.ca>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
References: <3835D808.18274C86@thepuffingroup.com>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Parallel port hardware
List-ID: <linux-parisc.vger.kernel.org>

Can anyone point me to info on the electrical properties of the parallel ports
on 712 or 715 machines?

The Papers project (Purdue Adapter for Parallel Execution and Rapid Synchronisation)

http://garage.ecn.purdue.edu/~papers/Index.html

have an interesting approach to building parallel machines.

Oversimplifying their fairly complex analysis (see page above for details), they argue
that the hard issue is latency for synchronisation, not bandwidth, so you can do a lot
of fairly interesting things with very simple synchronisation logic attached to a
parallel port and software that exploits it from user space, without the overhead of
kernel calls, packetisation, device drivers, .... 

Their most complex device has a few dozen TTL logic chips. Their simplest one handles
up to about 8 machines using just a cable and their software on Linux PCs:

http://garage.ecn.purdue.edu/~papers/WAPERS/

I'm thinking that 8 715s might make an interesting parallel engine, but the cable device
only works if the parallel port's control lines are implemented as open collector TTL.
Where can I discover whether they are?
