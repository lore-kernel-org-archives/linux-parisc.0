Return-Path: <dave@hiauly1.hia.nrc.ca>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 06CCE483D
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 23 Apr 2004 07:40:48 -0600 (MDT)
Message-Id: <200404231340.i3NDejFp003662@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Panic on boot in 64 bit 2.6.6-rc1-pa0
To: James.Bottomley@steeleye.com (James Bottomley)
Date: Fri, 23 Apr 2004 09:40:45 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <1082724367.1913.2.camel@mulgrave> from "James Bottomley" at Apr
	23, 2004 08:46:07 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> Apparently, they are.  If you objdump the .o files, you see they're of
> type R_PARISC_PCREL17F

If you look at the .level directive in the assembler output for one of
these files, do you see "2.0w".  The branches should also appear as "b,l"
instead of the PA 1.x "bl".  This should tell us whether this is a gcc
or assembler problem.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
