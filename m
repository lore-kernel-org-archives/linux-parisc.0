From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPPA and Squeeze
Date: Thu, 18 Jun 2009 11:03:16 -0400 (EDT)
Message-ID: <20090618150317.769604FE4@hiauly1.hia.nrc.ca>
References: <4A39DFAA.30803@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: debian-hppa@lists.debian.org, debian-release@lists.debian.org,
	linux-parisc@vger.kernel.org
To: luk@debian.org (Luk Claes)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A39DFAA.30803@debian.org> from "Luk Claes" at Jun 18, 2009 08:33:14 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> It's very easy to tell there is nothing wrong when you don't have to
> deal with unreliable build daemons, endless discussions but no visible
> progress (except for java support) and complaints from DSA, package
> maintainers and others.

The problem with the build daemons may be a buggy version of nscd.
It causes random problems with uid/gid lookups.  This is just a guess
based on this report:
http://www.nabble.com/Boost-build-failure-on-hppa-td23496708.html

I had problems with sshd and dpkg on my c3750 until I disabled nscd.
It's now running 2.6.30.  It has done a full build and check of GCC
several times, and appears to be stable with this kernel.  This is
with a UP kernel.

With SMP kernels, there's still a problem with random segementation
faults.  These cause application core dumps and are normally logged
in /var/log/debug.  The frequency of these problems vary with kernel
version.

I believe that it should be possible to setup a reliable hppa build
server running a UP kernel.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
