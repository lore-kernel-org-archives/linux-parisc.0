Return-Path: <dave@hiauly1.hia.nrc.ca>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 300C74840
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 14 Dec 2003 16:12:33 -0700 (MST)
Message-Id: <200312142312.hBENCSHO002332@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] strange GNU ld / libgcc_s.so problems
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Sun, 14 Dec 2003 18:12:28 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <20031214221629.GZ13882@systemhalted> from "Carlos O'Donell" at
	Dec 14, 2003 05:16:29 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> > -lgcc_s (//usr/lib/libstdc++.so: undefined reference to `_Unwind_SjLj_Resume@GCC_3.0'
> > /usr/lib/libstdc++.so: undefined reference to `_Unwind_SjLj_Register@GCC_3.0'
> > /usr/lib/libstdc++.so: undefined reference to `_Unwind_SjLj_RaiseException@GCC_3.0'
> > /usr/lib/libstdc++.so: undefined reference to `_Unwind_SjLj_Unregister@GCC_3.0'
> > /usr/lib/libstdc++.so: undefined reference to `_Unwind_SjLj_Resume_or_Rethrow@GCC_3.3'
> > usr/lib/libgcc_s.so)

Debian builds GCC using sjlj exceptions.  This can happen if you use
GCC built using dwarf2 exception support (the default).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
