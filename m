From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] killing a set of user processes causes system
Date: Sat, 16 Dec 2006 22:37:01 -0500 (EST)
Message-ID: <200612170337.kBH3b286021766__20944.5448512726$1416624235$gmane$org@hiauly1.hia.nrc.ca>
References: <200612162255.02615.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: deller@gmx.de (Helge Deller)
Return-Path: <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <200612162255.02615.deller@gmx.de> from "Helge Deller" at Dec 16, 2006 10:55:02 pm
List-ID: <linux-parisc.vger.kernel.org>

> this is an updated patch, where only the absolute necessary pieces were changed.
> It applies to current git tree...

2.6.20-rc1-gd13bc210-dirty boots with the patch but su/pam authentication
is somehow broken for root.  I used the defaults for all config updates.
The only bad things that I see in the log files is some unaligned accesses
by hald.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
