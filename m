Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id A7B7A482E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 17 Nov 2002 13:48:26 -0700 (MST)
Message-Id: <200211172048.gAHKmLu0018188@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [2.5] next issues ...
To: bzeeb-lists@lists.zabbadoz.net (Bjoern A. Zeeb)
Date: Sun, 17 Nov 2002 15:48:21 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.BSF.4.44.0211171732160.39295-100000@e0-0.zab2.int.zabbadoz.net> from "Bjoern A. Zeeb" at Nov 17, 2002 05:34:23 pm
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

> On Fri, 15 Nov 2002, John David Anglin wrote:
> 
> > was picking, I would go with the current mainline 3.3 or the debian 3.0.
> 
> Have you been able to compile a pre3.3 from CVS on parisc ?

Yes, many many times.  However, I almost never start from debian 3.0.4.

> regex.c:8214: internal compiler error: Segmentation fault
> Please submit a full bug report,

If this occurred in stage1, the seg fault was in the bootstrap compiler.
Problems with debian 3.0.4 need to be reported on the debian list.
Otherwise, follow the directions for a GCC bug report.

When I saw your report, I started a new bootstrap and it has passed the
point of the above ICE.  Thus, the problem could be in the following
areas:

1) Your bootstrap compiler is broken for one reason or another.  Regex.c
   is a pretty stable bit of code.

2) Your system is unstable.  Various parisc-linux systems have had memory
   management problems causing random segmentation faults.  This has been
   particularly true for SMP configurations.  Sometimes just restarting
   the build will work in this case.

3) There have been problems with bash causing seg faults.  Glibc could
   be involved.

You have to be specific about with compiler version was used for the
bootstrap and the configuration options used for the build.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
