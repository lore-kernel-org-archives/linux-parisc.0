Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id B23CF4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Jan 2003 08:04:17 -0700 (MST)
Message-Id: <200301141504.h0EF4FiQ002740@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] new gcc-snapshot problem [was: new gcc-default for hppa]
To: jsoe0708@tiscali.be
Date: Tue, 14 Jan 2003 10:04:14 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: tausq@debian.org, parisc-linux@lists.parisc-linux.org,
	debian-hppa@lists.debian.org
In-Reply-To: <3DED9A6600005946@ocpmta3.freegates.net> from "jsoe0708@tiscali.be" at Jan 14, 2003 03:44:46 pm
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

>         byte nslots;
>         __u8 short slot_tablelen;
          ^^^^ ^^^^^

As Willi said, the error is above and you will have to figure out or
ask the maintainer what the intended type for slot_tablelen was in
this struct.  Look to see if there is a maximum size defined somewhere.

>         __u8 nslots;
>         __u16 slot_tablelen;
> };
> 
> hmm could this be a typo at one moment "unsigned short" would be changed
> "__u8 short" ???

Could be a typo.  However, this is a different struct from the one above,
so the types could be different to accomodate different table sizes.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
