From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: bad code with gcc-4.3 and lzma-utils ?
Date: Sun, 4 Jan 2009 13:21:06 -0500 (EST)
Message-ID: <20090104182106.EF3704EF8@hiauly1.hia.nrc.ca>
References: <20090104164157.A14AC4EF8@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: gmsoft@tuxicoman.be, vapier@gentoo.org,
	linux-parisc@vger.kernel.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090104164157.A14AC4EF8@hiauly1.hia.nrc.ca> from "John David Anglin" at Jan 4, 2009 11:41:57 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > Also, compiling with -march=2.0 -O0 -fdelayed-branch doesn't produce a
> > segv but produces the following error message :
> > hope tests # ../src/lzma/lzma -c < in > out 
> > ../src/lzma/lzma: SetCoderProperties() error

With this case, I see the following miscompilation:

0x0002e860 <_ZN9NCompress5NLZMA8CEncoder18SetCoderPropertiesEPKjPK14tagPROPVARIANTj+496>:	ldil L%29000,r1
0x0002e864 <_ZN9NCompress5NLZMA8CEncoder18SetCoderPropertiesEPKjPK14tagPROPVARIANTj+500>:	be,l 554(sr4,r1),sr0,r31
0x0002e868 <_ZN9NCompress5NLZMA8CEncoder18SetCoderPropertiesEPKjPK14tagPROPVARIANTj+504>:	copy r31,rp
0x0002e86c <_ZN9NCompress5NLZMA8CEncoder18SetCoderPropertiesEPKjPK14tagPROPVARIANTj+508>:	copy ret0,r26

The delay slot for the branch is filled twice.  So for now, don't use
-march=2.0 in 32-bit compilations.  4.1 is probably broken too.  The
second copy instruction was supposed to have been moved before the call.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
