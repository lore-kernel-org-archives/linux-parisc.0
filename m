Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 46C7E4829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 29 Aug 2002 08:16:40 -0600 (MDT)
Message-Id: <200208291416.g7TEGaK7023861@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Back to evms-1.0.1 && unaligne access && gdb
To: jsoe0708@tiscali.be
Date: Thu, 29 Aug 2002 10:16:36 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3D53B3B700008591@ocpmta1.be.tiscali.com> from "jsoe0708@tiscali.be" at Aug 29, 2002 11:51:36 am
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

> So am I right to suspect "u_int32_t   *uip = (u_int32_t *) p;" being the
> actual cause of 'unaligned access' problem?

Yes, if p is not aligned, a trap will occur.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
