From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [git patches] parisc bug fixes for 2.6.25
Date: Mon, 17 Mar 2008 14:54:10 -0400 (EDT)
Message-ID: <20080317185411.996EA4DBD@hiauly1.hia.nrc.ca>
References: <20080317175315.E814B4E0E@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@mcmartin.ca, carlos@systemhalted.org,
	linux-parisc@vger.kernel.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080317175315.E814B4E0E@hiauly1.hia.nrc.ca> from "John David Anglin" at Mar 17, 2008 01:53:14 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> upeek: ptrace(PTRACE_PEEKUSER,11233,4294967292,0): Input/output error
> root@hiauly6:/etc#

This reminds me of the off by one, comiclr, bug last summer.  There
seems to be two other places in syscall.S where we might have the same
bug.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
