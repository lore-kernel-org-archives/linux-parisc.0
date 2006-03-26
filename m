From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: linux-2.6 deller (ioremap-changes) and more
Date: Sun, 26 Mar 2006 14:06:07 -0500 (EST)
Message-ID: <200603261906.k2QJ673c007796@hiauly1.hia.nrc.ca>
References: <4426D8D2.8040209@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: deller@gmx.de,
 parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <4426D8D2.8040209@tiscali.be> from "Joel Soete" at Mar 26, 2006 06:09:22 pm
List-ID: <linux-parisc.vger.kernel.org>

> > I'm running libc6-2.3.6-4 and see some strange crashes. Might it be related, or does  2.3.6-4 doesn't includes your fix ?

2.3.6-4 should have the glibc fix...

> Do you know in which gcc-4.0 dpkg release the jda patch 
> (<http://lists.parisc-linux.org/pipermail/parisc-linux/2006-March/028548.html>) was in?
> I can so check in buildd with which compiler this new glibc-2.3.6-4 was build ;-)

As far as GCC goes, the fix is now in all 4.x branches but not in 3.4.
I'm not sure about the debian status.  I believe that Matthias integrated
the change but there was a regression due to a missing glibc patch
needed to prevent a SIGSEGV in the unwind code.  Matthias said this
problem was fixed on March 20.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
