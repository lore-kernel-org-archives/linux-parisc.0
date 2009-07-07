From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: parisc: unwind tables and backtraces broken?
Date: Mon, 6 Jul 2009 20:50:17 -0400 (EDT)
Message-ID: <20090707005018.C697F4FE0@hiauly1.hia.nrc.ca>
References: <4A527397.7060306@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, dave.anglin@nrc-cnrc.gc.ca,
	carlos@systemhalted.org, randolph@tausq.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A527397.7060306@gmx.de> from "Helge Deller" at Jul 6, 2009 11:58:47 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I started looking into why CONFIG_BACKTRACE_SELF_TEST=y shows uncomplete/wrong/broken backtraces.
> 
> To me it seems, that the unwind tables are broken when using newer gcc/binutils versions.

Just wondering, but would it be possible to switch to using dwarf2 unwind
information.  I presume that's what most other targets use.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
