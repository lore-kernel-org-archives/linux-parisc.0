Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 38E70482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  6 Sep 2002 20:04:28 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17nUxW-0002Hz-00; Sat, 07 Sep 2002 03:04:26 +0100
Date: Sat, 7 Sep 2002 03:04:25 +0100
From: Matthew Wilcox <willy@debian.org>
To: "B. Douglas Hilton" <bdhilton@charter.net>
Cc: Tobias Giesen <tobias_subscriber@tgtools.com>,
	'palinux' <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: C200 Voodoo2 Progress Report
Message-ID: <20020907030425.H26580@parcelfarce.linux.theplanet.co.uk>
References: <000001c25607$c1fcdf90$0100a8c0@PLUTO> <3D795118.1060709@charter.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D795118.1060709@charter.net>; from bdhilton@charter.net on Fri, Sep 06, 2002 at 09:06:32PM -0400
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

On Fri, Sep 06, 2002 at 09:06:32PM -0400, B. Douglas Hilton wrote:
> The C200 and probably C160, 180, 240, and 360
> have two three different busses inside: the
> Hewlett-Packard GSC bus, 5V/32bit PCI (dino),
> and 3V/64bit PCI (cujo).

... and some have an EISA slot provided by Wax.  I'm not sure exactly
which configurations exist, but the hwdb thinks that Cujo was only
used in the C200+, C240+, C360 and J2240.  The hwdb is slightly limited
in that there's only one profile per name, when it's possible to have
different configurations of the same box.  All B/C class boxes of that
era are guaranteed to have a Dino though, so there's no real problem
with requiring the use of a 5V slot.

-- 
Revolutions do not require corporate support.
