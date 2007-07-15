From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [PATCH] [PARISC] Clean up syslog output of
Date: Sun, 15 Jul 2007 11:21:49 -0400 (EDT)
Message-ID: <200707151521.l6FFLnsn007217__13996.7475356118$1416624414$gmane$org@hiauly1.hia.nrc.ca>
References: <20070715145613.GA9938@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: deller@gmx.de,
 parisc-linux@lists.parisc-linux.org
To: randolph@tausq.org
Return-Path: <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <20070715145613.GA9938@tausq.org> from "Randolph Chung" at Jul 15, 2007 02:56:14 pm
List-ID: <linux-parisc.vger.kernel.org>

> Also, you might want to remove "segfault" from the output string, since
> the crash can be from SIGSEGV, SIGILL, SIGBUS, etc...

Why not print the actual name of the interruption from the arch
instead of "code 15", etc?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
