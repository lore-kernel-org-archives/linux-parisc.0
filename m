Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id CCDC2482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Aug 2003 17:55:44 -0600 (MDT)
Message-Id: <200308112355.h7BNthRu021653@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] xfree86 4.2.1-9 build problem
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Mon, 11 Aug 2003 19:55:43 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: grundler@parisc-linux.org, parisc-linux@lists.parisc-linux.org
In-Reply-To: <200308112038.h7BKc61c020812@hiauly1.hia.nrc.ca> from "John David Anglin" at Aug 11, 2003 04:38:06 pm
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

> Here is the linker path on gsyprf11:
> 
> SEARCH_DIR("/usr/hppa-linux/lib"); SEARCH_DIR("/usr/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib");

This search path seems somewhat strange.  It appears debian used the
`--with-lib-path=dir1:dir2...  set default LIB_PATH' configure option
in building binutils.  I believe that the default binutils order would
be "/usr/local/lib", "/lib" and then "/usr/lib".

On the otherhand, ld.so has the default order "/usr/lib", then "/lib".
Don't know why the search order for the system directories in glibc
is opposite to binutils.

On gsyprf11, /etc/ld.so.conf contains:
/usr/X11R6/lib
/usr/lib/postfix

So, the dynamic loader will use the following path as the default search:
/usr/X11R6/lib:/usr/lib/postfix:/usr/lib:/lib

The dynamic loader doesn't search /usr/local/lib and it has a different
search order than ld.  Because /usr/local/lib is normally searched before
the system library directories, you have to be careful what you put there.

It would be nice if the linker and dynamic linker were consistent :)

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
