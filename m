Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 010754847
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Jun 2002 10:41:47 -0600 (MDT)
Message-Id: <200206291641.g5TGfjDN018674@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] 735 and FW SCSI
To: andrew@neep.com.au (Andrew Shugg)
Date: Sat, 29 Jun 2002 12:41:45 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, atkinsc@yifan.net
In-Reply-To: <20020629223123.A24671@neep.com.au> from "Andrew Shugg" at Jun 29, 2002 10:31:26 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> Can you move your diskss to the supported controller?  That way at least
> you'll be able to get an install happening.

The Outfield FW interface is differential.  Disks on this interface are
not compatible with the suppored narrow interface.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
