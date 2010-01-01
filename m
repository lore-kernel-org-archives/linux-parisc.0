From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: futex wait failure
Date: Fri, 1 Jan 2010 00:36:12 +0000 (UTC)
Message-ID: <20100101003559.E2F2F4EF1@hiauly1.hia.nrc.ca>
References: <20091231223832.85D024EF1@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@systemhalted.org, deller@gmx.de, dave.anglin@nrc-cnrc.gc.ca,
	linux-parisc@vger.kernel.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091231223832.85D024EF1@hiauly1.hia.nrc.ca> from "John David Anglin" at Dec 31, 2009 05:38:31 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Regarding the handling of space registers during interruptions, they
> are not saved.  syscall_exit_rfi restores them to proper values:

This is potentially an implementation bug, particularly with respect to
interruptions.   User space probably should have sr0-sr3 available to
do icache flushes, etc.  Currently, gcc uses sr0 for icache flushes.

It may be sr0 is never clobbered, but this isn't clear.  I'm fairly sure
HP-UX saves sr0-sr4 if necessary.

Possibly, the icache flush sequence should be changed for linux to not
use sr0.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
