From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH 3/5] parisc: use new macros for .data.init_task.
Date: Sat, 2 May 2009 12:52:01 -0400 (EDT)
Message-ID: <20090502165202.7E4424FC6@hiauly1.hia.nrc.ca>
References: <49FC71E6.4000100@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@mcmartin.ca, tabbott@MIT.EDU, sam@ravnborg.org,
	linux-kernel@vger.kernel.org, andersk@mit.edu, wdaher@mit.edu,
	vda.linux@googlemail.com, jbarnold@mit.edu,
	linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <49FC71E6.4000100@gmx.de> from "Helge Deller" at May 2, 2009 06:16:38 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I really meant that a > 8k alignment was not possible.
> I tried exactly the same stuff once and failed.
> I think the restriction came from hpux compatibility or some old gas...

The maximum alignment on hpux is 4k bytes.  This was implemented in
2004 in the PA backend for hpux.  Prior to that, the default for
MAX_OFILE_ALIGNMENT (BIGGEST_ALIGNMENT) was in effect for all PA
targets.  It looks like Carlos added the define to elfos.h in November
2006.  So unless this was back ported, 4.2.0 would be the first gcc
release to support large alignments on linux.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
