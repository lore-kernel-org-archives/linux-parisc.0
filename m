Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3A9A74841
	for <parisc-linux@lists.parisc-linux.org>; Mon, 25 Feb 2002 10:51:02 -0700 (MST)
Received: from hiauly1.hia.nrc.ca (localhost [127.0.0.1])
	by hiauly1.hia.nrc.ca (8.12.0.Beta16/8.12.0.Beta16) with ESMTP id g1PHouFN029341
	for <parisc-linux@lists.parisc-linux.org>; Mon, 25 Feb 2002 12:50:56 -0500 (EST)
Message-Id: <200202251750.g1PHotvD029339@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] tsocks Error
To: dennis_faucher@hp.com (FAUCHER, DENNIS)
Date: Mon, 25 Feb 2002 12:50:54 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <2F1E6AB90ECAD311943700A0C9E3B15408002AA8@xatl03.atl.hp.com> from "FAUCHER,DENNIS" at Feb 25, 2002 08:51:57 am
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

> Has anyone used tsocks successfully?  I just installed the latest with
> apt-get (tsocks version 1.7-4) and receive the following error on use:
> 
> relocation error: /usr/lib/libtsocks.so: undefined symbol: $$dyncall

$$dyncall is in libgcc.a.  The link command for the library should
include -lgcc at the end of the library list.

As a side note, there was extensive discussion about the inclusion of the
PA millicode routines in libgcc after problems arose on one port linking
both shared and static versions of libgcc when creating shared libraries.
The fallout from changing how libgcc is linked is still being worked out.

A decision was reached that only the shared libgcc should be used when
creating shared libraries (it's actually more complicated than that
because the new binutils allows undefined symbols) and the PA milli
routines should be moved to another location because they must be
linked statically.  The options include putting them into a separate
libmilli.a (the linker has support for automatically linking in
the library) or in the static part of libc.

If somebody wants to put these functions in libc, let me know.  Otherwise
I will create a libmilli.a in gcc.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
