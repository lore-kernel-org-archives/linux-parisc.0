Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 827FE4839
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Feb 2002 09:40:27 -0700 (MST)
Message-Id: <200202121640.g1CGeJ4B024431@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] $$divU undefined reference
To: Arnaud.ATOCH@oecd.org
Date: Tue, 12 Feb 2002 11:40:19 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <C12531D038D1D011B1DB0000F8036C280BBA4743@eosm5.oecd.org> from "Arnaud.ATOCH@oecd.org" at Feb 12, 2002 05:23:24 pm
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

> Should I understand that this divU function is used but I can not find which
> library to link ? or are all these libs broken ?

It's always necessary to link against a static copy of libgcc to resolve
millicode references.  Linking using gcc, g++, or libtool will do this
automatically.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
