Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail16.speakeasy.net [216.254.0.216])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0101B4829
	for <parisc-linux@parisc-linux.org>; Sat, 27 Jul 2002 22:57:17 -0600 (MDT)
Received: from unknown (HELO pippin.tausq.org) ([64.81.244.94]) (envelope-sender <randolph@tausq.org>)
          by mail16.speakeasy.net (qmail-ldap-1.03) with SMTP
          for <parisc-linux@parisc-linux.org>; 28 Jul 2002 04:57:11 -0000
Date: Sat, 27 Jul 2002 22:00:53 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] state of 2.5 merge
Message-ID: <20020728050053.GA1419@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20020722034037.F12523@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020722034037.F12523@parcelfarce.linux.theplanet.co.uk>
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

> we're still a little short of attempting to link.  entry.S and head.S
> need to be massaged to work in the new O(1) scheduler world.  note that
> we're leaving preempt disabled until later.  once it does attempt to link,
> i suspect we'll find there're a lot of functions which need to be written
> (particularly mm-related ones) and probably some include cleanups to do.

In case people are wondering where this is at.... today we got a
somewhat working shell.....

kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Stand-alone shell (version 3.4)
> uname -a
Linux (none) 2.5.26-pa0 #106 Sat Jul 27 18:49:37 PDT 2002 parisc unknown unknown GNU/Linux

This is on a a500 (64-bit kernel). Richard has also had success with
b180 (iirc).

For the most part things are still quite broken (init, ls, etc don't 
work yet).  There are probably some changes related to the task_struct 
to thread_info transition that still needs to be worked out for 
syscalls to work correctly.... 

Richard Hirst worked out most of the bugs to get userspace working.
Thanks Richard! :-)

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
