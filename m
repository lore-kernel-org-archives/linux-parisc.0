Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rover.mkp.net (rover.mkp.net [209.217.122.9])
	by dsl2.external.hp.com (Postfix) with ESMTP id 931304857
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Jul 2002 07:11:36 -0600 (MDT)
To: Steve Pacenka <spacenka@lightlink.com>
Cc: dlorin@univ-rennes1.fr, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] How to mount HFS 6.0 ?
From: "Martin K. Petersen" <mkp@mkp.net>
References: <200207080705.JAA06652@mailimailo.univ-rennes1.fr>
	<1026132397.906.50.camel@romano>
Date: 08 Jul 2002 09:10:47 -0400
In-Reply-To: <1026132397.906.50.camel@romano>
Message-ID: <yq1k7o6mkko.fsf@austin.mkp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

>>>>> "Steve" == Steve Pacenka <spacenka@lightlink.com> writes:

Steve> It would be unportable if type "hfs" as Martin Peterson
Steve> suggests works.  The "hfs" filesystem type in the standard
Steve> Linux kernel represents an Apple Macintosh filesystem.

Yes, you're right.  Waaay too early in the morning here (And slightly
embarassing given that I was the one who implemented the hfs support
in ufs d:)...

-- 
Martin K. Petersen      Cereal Bowl Engineer, Linuxcare, Inc.
http://mkp.net/         SGI XFS, Linux/PA-RISC, Linux/IA-64
