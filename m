Return-Path: <dave@hiauly1.hia.nrc.ca>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id BF7A94868
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 15 Dec 2003 14:05:29 -0700 (MST)
Message-Id: <200312152105.hBFL5FZL017936@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] strange GNU ld / libgcc_s.so problems
To: deller@gmx.de (Helge Deller)
Date: Mon, 15 Dec 2003 16:05:15 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <200312152146.44613.deller@gmx.de> from "Helge Deller" at Dec 15,
	2003 09:46:44 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@baldric.uwo.ca, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> > > attempt to open /usr/lib/libgcc_s.so succeeded
> > > -lgcc_s (//usr/lib/libstdc++.so: undefined reference to `_Unwind_SjLj_Resume@GCC_3.0'
> > > /usr/lib/libstdc++.so: undefined reference to `_Unwind_SjLj_Register@GCC_3.0'
> > > /usr/lib/libstdc++.so: undefined reference to `_Unwind_SjLj_RaiseException@GCC_3.0'
> > > /usr/lib/libstdc++.so: undefined reference to `_Unwind_SjLj_Unregister@GCC_3.0'
> > > /usr/lib/libstdc++.so: undefined reference to `_Unwind_SjLj_Resume_or_Rethrow@GCC_3.3'
> > > usr/lib/libgcc_s.so)
> > > 

I don't have libgcc_s.so in /usr/lib.  This is suspect.  libgcc_s.so should
contain the above symbols if built with sjlj exceptions.  However, it's
difficult to tell since the symbols are stripped.  I would move
/usr/lib/libstdc++.so out of the way and retry your link.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
