Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (pop.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id BE6654868
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 15 Dec 2003 14:39:04 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
	carlos@baldric.uwo.ca, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] strange GNU ld / libgcc_s.so problems
Date: Mon, 15 Dec 2003 22:38:58 +0100
References: <200312152105.hBFL5FZL017936@hiauly1.hia.nrc.ca>
In-Reply-To: <200312152105.hBFL5FZL017936@hiauly1.hia.nrc.ca>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200312152238.58462.deller@gmx.de>
Cc: 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Monday 15 December 2003 22:05, John David Anglin wrote:
> > > > attempt to open /usr/lib/libgcc_s.so succeeded
> > > > -lgcc_s (//usr/lib/libstdc++.so: undefined reference to `_Unwind_SjLj_Resume@GCC_3.0'
> > > > /usr/lib/libstdc++.so: undefined reference to `_Unwind_SjLj_Register@GCC_3.0'
> > > > /usr/lib/libstdc++.so: undefined reference to `_Unwind_SjLj_RaiseException@GCC_3.0'
> > > > /usr/lib/libstdc++.so: undefined reference to `_Unwind_SjLj_Unregister@GCC_3.0'
> > > > /usr/lib/libstdc++.so: undefined reference to `_Unwind_SjLj_Resume_or_Rethrow@GCC_3.3'
> > > > usr/lib/libgcc_s.so)
> > > > 
> 
> I don't have libgcc_s.so in /usr/lib.  This is suspect.  libgcc_s.so should
> contain the above symbols if built with sjlj exceptions.  

doh - that's it !

My /usr/lib/libgcc_so.1 was from an old private gcc build (I forgot about it since
it was from 2002) and it broke my builds.
I deleted this file and now all works perfect.

Thanks a lot.
Helge
