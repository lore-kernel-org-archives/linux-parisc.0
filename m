From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Question about execve.
Date: Sun, 28 Mar 2010 12:03:15 -0400 (EDT)
Message-ID: <20100328160315.AD2B24E77@hiauly1.hia.nrc.ca>
References: <20100328154241.GA2782@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@systemhalted.org, deller@gmx.de, kyle@mcmartin.ca,
	linux-parisc@vger.kernel.org
To: dave.anglin@nrc-cnrc.gc.ca
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100328154241.GA2782@hiauly1.hia.nrc.ca> from "John David Anglin" at Mar 28, 2010 11:42:42 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> My guess would be that the parent is not blocked leading to corruption.

I did a quick test and the child always seems to run first.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
