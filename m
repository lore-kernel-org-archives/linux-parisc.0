From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPPA and Squeeze
Date: Tue, 16 Jun 2009 22:37:32 -0400 (EDT)
Message-ID: <20090617023733.51ABF4FC4@hiauly1.hia.nrc.ca>
References: <4A2EB3E6.9080302@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: nospam@vuorela.dk, maulkin@halon.org.uk,
	linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A2EB3E6.9080302@gmx.de> from "Helge Deller" at Jun 9, 2009 09:11:34 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Again, kernel bugs are sometimes hard to find.
> I still think that http://patchwork.kernel.org/patch/28458/ may fix a few.
> The only outstanding bug I still know of is that we sometimes face uid/gid issues.
> This still needs analysis.

Helge suggested yesterday that the uid/gid issue might be a bug in nscd.
I installed 2.6.30 last night and disabled nscd.  I have now run for more
than a day without this issue appearing.  The machine did a full GCC build
and check taking about 24 hours.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
