Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 80085483B
	for <parisc-linux@lists.parisc-linux.org>; Tue,  7 Jan 2003 10:51:30 -0700 (MST)
Message-Id: <200301071751.h07HpM90022966@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Problem with weak symbols
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Tue, 7 Jan 2003 12:51:22 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: b.gunreben@web.de, parisc-linux@lists.parisc-linux.org
In-Reply-To: <200301071747.h07HlrmN022946@hiauly1.hia.nrc.ca> from "John David Anglin" at Jan 7, 2003 12:47:53 pm
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

> > > ./weak
> > linux_bla: 0x205f0
> > linux_foo: (nil)

Try "-fPIC".

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
