Return-Path: <dave@hiauly1.hia.nrc.ca>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 872A04960
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  9 Mar 2004 08:25:27 -0700 (MST)
Message-Id: <200403091525.i29FPOid015380@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Results of (IDE) kernel tests with modified io.c
To: xam@cs.ucc.ie (M. Grabert)
Date: Tue, 9 Mar 2004 10:25:24 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <Pine.LNX.4.58.0403090656070.13701@sal.ucc.ie> from "M. Grabert"
	at Mar 9, 2004 07:11:16 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: randolph@tausq.org, grundler@parisc-linux.org,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> But what I'm wondering about is why the Silicon Image driver
> (always) detects the Seagate ST311022A hard drive as "TS130220A2".

Bytes are swapped.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
