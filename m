From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: ls -l is broken
Date: Sun, 6 Apr 2008 18:28:12 -0400 (EDT)
Message-ID: <20080406222813.F11CA4E43@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I just noticed that ls -l is broken:

dave@mx3210:~/gnu/gcc/gcc$ ls -l ltsugar.m4
ls: ltsugar.m4: Operation not supported
-rw-r--r-- 1 dave dave 4122 Mar 16 16:50 ltsugar.m4

dave@mx3210:~/gnu/gcc/gcc$ dpkg -l coreutils libc6
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Installed/Config-files/Unpacked/Failed-config/Half-installed
|/ Err?=(none)/Hold/Reinst-required/X=both-problems (Status,Err: uppercase=bad)
||/ Name           Version        Description
+++-==============-==============-============================================
ii  coreutils      6.10-3         The GNU core utilities
ii  libc6          2.7-6          GNU C Library: Shared libraries
dave@mx3210:~/gnu/gcc/gcc$ uname -a
Linux mx3210 2.6.22.19 #4 SMP Tue Apr 1 19:24:18 EDT 2008 parisc64 GNU/Linux

coreutils 6.10 works on hpux.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
