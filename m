Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id B80EF4829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Jun 2003 12:50:18 -0600 (MDT)
Date: Wed, 4 Jun 2003 19:50:16 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] compiler & kernel (2)
In-Reply-To: <Pine.LNX.4.44.0306041917370.12360-300000@sal.ucc.ie>
Message-ID: <Pine.LNX.4.44.0306041938040.12360-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Sorry for replying my own mail:


The BogoMIPS problem was in fact due to a bug in a gcc-3.3 (up to debian
prerelease 20030415). However it was already fixed in Debian prerelease
20030509.


the last mail contained two attachments:

- dmesg (the dmesg of my current -pa35 kernel, using SYM1 and 53c700 from
         2.4.19-pa2, no BogoMIPS problem) and

- dmesg2 (FIRST: the dmesg of a vanilla -pa35 kernel, using SYM2 and
          original 53c700, BogoMIPS problem.
          SECOND:
          You can see it doesn't even boot ('target is suffering from tag
          starvation' and the kernel hang) so I rebooted to 2.4.19-pa2.
          It's dmesg is also in this file.

Thanks, Max
