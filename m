Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 28 Feb 2003 23:17:12 -0700
To: mike ganley <mgg01@yahoo.com>
Cc: debian-hppa@lists.debian.org, parisc-linux@lists.parisc-linux.org
Message-ID: <20030301061712.GB5518@dsl2.external.hp.com>
References: <20030228225506.37072.qmail@web12203.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030228225506.37072.qmail@web12203.mail.yahoo.com>
From: grundler@dsl2.external.hp.com (Grant Grundler)
Subject: [parisc-linux] Re: Cross compiling for 64 bit on HPPA
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

On Fri, Feb 28, 2003 at 02:55:06PM -0800, mike ganley wrote:
> hppa64 cross compiler.  Everything goes fine, then
> hppa64-linux-ld complains libc6 is version 2.2.5 and
> it requires 2.3 or greater.

libc6 2.3.x is only available from "unstable" debian pool.

Having just learned how to set up a "hybrid" release, I don't want
to reccomend this to anyone.  IMHO, this is for someone willing to
take risks with stability of a system, is not a developer, and wants
something that's only in "unstable".  Drawback with "hybrid" is package
maintainers will not like you if you report bugs - mixed releases are a
PITA to reproduce. Personally, I'm not going to report bugs
with the one box (my laptop) I have setup this way.

The following seems like the "least evil" way to go about it:

1) /etc/apt/apt.conf should have the line:
	APT::Default-Release "testing";

2) duplicate "testing" entries in /etc/apt/sources.list for
   "unstable" as well. run "apt-get update".

3) copy the following 7 lines into /etc/apt/preferences:
Package: *
Pin: release a=testing
Pin-Priority: 650

Package: *
Pin: release a=unstable
Pin-Priority: 90

  This allows one to install from unstable but not update such debs
  *until* they get promoted to "testing" release. Once this deb version
  is promoted to testing, it tracks versions like normal.

  Read "man apt_preferences" for more details.

4) "apt-get install libc6/unstable" to update to libc6 2.3.1 lib.
   You will have to install several other packages from /unstable
   at the same time. But apt-get will complain about which packages.

hth,
grant
