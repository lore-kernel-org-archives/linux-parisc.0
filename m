Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from xo.hp.is (xo.hp.is [194.105.242.199])
	by dsl2.external.hp.com (Postfix) with ESMTP id 10E09482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 09:53:24 -0700 (MST)
Date: Mon, 19 Nov 2001 16:53:20 +0000
From: Richard Allen <ra@hp.is>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] What does this one mean ?
Message-ID: <20011119165320.B14821@hp.is>
References: <20011119163421.A14821@hp.is> <20011119164026.B1835@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011119164026.B1835@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Mon, Nov 19, 2001 at 04:40:26PM +0000
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

On Mon, Nov 19, 2001 at 04:40:26PM +0000, Matthew Wilcox wrote:

> On Mon, Nov 19, 2001 at 04:34:22PM +0000, Richard Allen wrote:
> > do_page_fault() pid=27461 command='rpm' type=6 address=0x6bc63f53
> 
> looks like it branched to hyperspace.  "k\AE?S" as a string, so it's
> not obviously ascii.  looks like it came from 0x0007c04f, so that might
> be a good place to start tracing.

Wow :)   that was fast :)
Mmmh.  it doesnt dump core so I can attempt to run it under gdb.
or ?    No gdb for parisc ?

> maybe rpm is broken (who would notice?  i can't imagine many people are
> using rpm on hppa :-) -- tried recompiling it?

I did recompile it ;)   Im working with it in a chrooted environment
and Im toying with creating a RedHat distro for parisc.  Im doing it
mainly to experience the hardships of creating a distro for a new
platform :)    Dependancies are a b**ch :-)
I've got my chrooted env to the point where I can rebuild SRPMS with
rpm but it wont install them.

chrooted# rpm --version
RPM version 4.0.3
rooted# ls -l /usr/src/redhat/RPMS/parisc/
total 116
-rw-r--r--    1 root     root        38287 Nov 19 16:27 zlib-1.1.3-24.parisc.rpm
-rw-r--r--    1 root     root        71816 Nov 19 16:27 zlib-devel-1.1.3-24.parisc.rpm

rpm still cant install outside the chrooted env. so I guess something is
wrong in rpm..


-- 
Rikki.         --  HP Technical Support, RHCE, RHCX, HP-UX Certified Admin.
               --  Solaris 7 Certified Systems and Network Administrator.
Bell Labs Unix --  Reach out and grep someone.
Those who do not understand Unix are condemned to reinvent it, poorly.
