Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id CB8A94829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Jan 2003 06:54:27 -0700 (MST)
Message-Id: <200301141354.h0EDsNjn028670@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] new gcc-snapshot problem [was: new gcc-default for hppa]
To: jsoe0708@tiscali.be
Date: Tue, 14 Jan 2003 08:54:22 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: tausq@debian.org, parisc-linux@lists.parisc-linux.org,
	debian-hppa@lists.debian.org
In-Reply-To: <3DED9A66000057DD@ocpmta3.freegates.net> from "jsoe0708@tiscali.be" at Jan 14, 2003 11:03:41 am
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

> I have a look and in drivers/ide/ide-cd.h line 440 I found well:
>     __u8 short slot_tabelen;
> 
> Any idea?

Look at the code after preprocessing with "-E" option.  This will
show you the actual code where the fault occurs.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
