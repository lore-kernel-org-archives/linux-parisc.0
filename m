From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [RFC][PATCH] use cycle_t instead of u64 in struct
Date: Tue, 2 Jan 2007 19:02:31 -0500 (EST)
Message-ID: <200701030002.l0302Vx5017621__22916.0389550545$1416624247$gmane$org@hiauly1.hia.nrc.ca>
References: <200701022233.25697.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: linux-kernel@vger.kernel.org,
 parisc-linux@lists.parisc-linux.org
To: deller@gmx.de (Helge Deller)
Return-Path: <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <200701022233.25697.deller@gmx.de> from "Helge Deller" at Jan 2, 2007 10:33:25 pm
List-ID: <linux-parisc.vger.kernel.org>

> The 32bit and 64bit PARISC Linux kernels suffers from the problem, that the gettimeofday() call sometimes returns non-monotonic times.

This certainly needs to be fixed.  I see stuff like this from ping:

64 bytes from 132.246.100.193: icmp_seq=19 ttl=255 time=0.4 ms
64 bytes from 132.246.100.193: icmp_seq=20 ttl=255 time=429496729.5 ms

tar also occasionally prints warning about times.  This is with a
32bit kernel.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
