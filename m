Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id E01AF482A
	for <parisc-linux@parisc-linux.org>; Wed, 12 Feb 2003 15:50:34 -0700 (MST)
Message-Id: <200302122250.h1CMoVCw029031@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] local symbols appearing in objdump/nm output
To: willy@debian.org (Matthew Wilcox)
Date: Wed, 12 Feb 2003 17:50:30 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <20030212171735.W5992@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Feb 12, 2003 05:17:35 pm
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

> nm and objdump both output local symbols from vmlinux.  this doesn't
> happen on x86 (how about other architectures?)  let me give an example:
> 
> 101a2700 T ext2_get_group_desc
> 101a27b8 T ext2_free_blocks
> 101a2824 t .L773
> 101a28ec t .L873
> 101a2970 t .L887
> 101a2b48 t .L844
> 101a2bd8 t .L888
> 101a2be0 t grab_block

This would appear to be a problem with the specific toolset (gas)
that you are using.  For example, there are no .L[0-9] labels in
the .o files of my gcc builds, but I see them in traps.o, for
example.  In this case, traps.o was built with the 64-bit toolset
(probably, debian).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
