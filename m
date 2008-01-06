From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Nanoseconds times on EXT3 always seem to be zero
Date: Sun, 6 Jan 2008 15:13:38 -0500 (EST)
Message-ID: <200801062013.m06KDdht008111@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On an EXT3 file system, I see the following:

dave@mx3210:~$ touch xyzzy
dave@mx3210:~$ ls --full-time xyzzy
-rw-r--r-- 1 dave dave 0 2008-01-06 15:07:01.000000000 -0500 xyzzy

However, on tmpfs, proc, etc., I see the sub-seconds time.  This is
2.6.22.14 and 2.6.22.15.

The behavior of 32 and 64-bit kernels seems to be the same.

With an old 2.6 x86 kernel (suse), I see sub-second times on a EXT3
file system.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
