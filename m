Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id C6D324851
	for <parisc-linux@parisc-linux.org>; Sat,  1 Feb 2003 22:55:47 -0700 (MST)
Message-Id: <200302020555.h125tjV1025138@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Compiler switches
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Sun, 2 Feb 2003 00:55:45 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: tausq@debian.org, willy@debian.org, parisc-linux@parisc-linux.org
In-Reply-To: <200302020552.h125qajv025111@hiauly1.hia.nrc.ca> from "John David Anglin" at Feb 2, 2003 00:52:36 am
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

> > http://buildd.debian.org/fetch.php?&pkg=synopsis&ver=0.4.1cvs20030125-1&arch=hppa&stamp=1044017572&file=log&as=raw
> 
> Yah, that's a stub table overflow.  Try the linker patch.

Oh, I should mention there is a linker option to change the stub table
size.  It's "--stub-group-size=N".  For more info, "ld --help".

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
