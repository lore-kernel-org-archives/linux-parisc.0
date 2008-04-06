From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: ls -l is broken
Date: Sun, 6 Apr 2008 19:09:59 -0400 (EDT)
Message-ID: <20080406231000.D53CB4FC8@hiauly1.hia.nrc.ca>
References: <20080406224204.GE16451@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: matthew@wil.cx (Matthew Wilcox)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080406224204.GE16451@parisc-linux.org> from "Matthew Wilcox" at Apr 6, 2008 04:42:04 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> If you strace it, what syscall returns -EOPNOTSUPP?

strace is broken and quits before the relevant syscall.  Think I
mentioned this before is a different context.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
