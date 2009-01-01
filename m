From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: uid/gid issues on 2.6.26-rc2
Date: Thu, 1 Jan 2009 11:55:31 -0500 (EST)
Message-ID: <20090101165532.2F8E04F19@hiauly1.hia.nrc.ca>
References: <495C9B85.3000009@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, T-Bone@parisc-linux.org,
	linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <495C9B85.3000009@gmx.de> from "Helge Deller" at Jan 1, 2009 11:31:33 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > The failure appears random.  I think the problem occurs shortly after
> > forking.  It doesn't seem to be present in the 64-bit SMP 2.6.28 test
> > kernel that I'm testing.
> 
> I think your assumption that it is related to fork might be correct.

I tried tracing what happens with sshd when a connection occurs but
I didn't learn much.  The uid/gid authentication uses compat mode on
the system where I see this problem.  It seems as if the authentication
setup is passed across the fork as I don't see any access to /etc/passwd
or /etc/shadow (password authentication is being used in this case).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
