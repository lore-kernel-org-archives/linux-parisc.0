Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 06EBA4829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Sep 2002 14:44:35 -0600 (MDT)
Message-Id: <200209032044.g83KiS0d008279@hiauly1.hia.nrc.ca>
To: jsoe0708@tiscali.be
Date: Tue, 3 Sep 2002 16:44:28 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: grundler@dsl2.external.hp.com, joel.soete@freebel.net,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <3D3815BD0000B0E9@ocpmta5.be.tiscali.com> from "jsoe0708@tiscali.be" at Sep 3, 2002 06:02:58 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Re: Unaligne access [was: Back to evms-1.0.1 && unaligne access && gdb ]
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

> >then I'll wager there is padding between the char and int fields
> >of that struct.
> 
> That is also what I believe to understand.

Unlikely.  The unaligned trap handler in the kernel is probably
fixing the unaligned access.  You need to look in the kernel log
to see if this is happening.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
