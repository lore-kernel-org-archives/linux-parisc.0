From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: linux-2.6 deller (ioremap-changes) and more
Date: Sun, 26 Mar 2006 14:40:51 -0500 (EST)
Message-ID: <200603261940.k2QJepFE007977@hiauly1.hia.nrc.ca>
References: <200603261858.56874.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: deller@gmx.de (Helge Deller)
Return-Path: <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <200603261858.56874.deller@gmx.de> from "Helge Deller" at Mar 26, 2006 06:58:56 pm
List-ID: <linux-parisc.vger.kernel.org>

> I'm running libc6-2.3.6-4 and see some strange crashes. Might it be related, or does  2.3.6-4 doesn't includes your fix ?

Don't know.  Note the r19 bug and the dynamic loader relocation bug
are completely different bugs.  It's easy to see the r19 bug by looking
at the .init section of shared libraries as shown in my previous
message.  A backtrace would also help to see where the SEGV is
occuring.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
