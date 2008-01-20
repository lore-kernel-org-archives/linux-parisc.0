From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Terrible PA8800 SMP Performance
Date: Sun, 20 Jan 2008 14:55:18 -0500 (EST)
Message-ID: <200801201955.m0KJtIer026663@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I've been doing GCC builds on a four processor PA8800 currently
running 2.6.24-rc6.  With make -j 6 bootstrap, this machine is
several hours slower than gsyprf11 doing the same GCC build and
check.  gsyprf11 is a two processor PA8700 and I typically
use make -j 4 on it.  The PA8800 is also slower than my c3750.

I've mentioned this before but some tests that never timeout even
on slow machines randomly timeout on the PA8800.

Any thoughts on what's wrong?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
