Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tyke.pjc.net (unknown [80.0.5.141])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3E4614830
	for <parisc-linux@lists.parisc-linux.org>; Tue,  4 Jun 2002 05:56:29 -0600 (MDT)
Received: from patrick by tyke.pjc.net with local (Exim 3.35 #1 (Debian))
	id 17FCui-0000U6-00
	for <parisc-linux@lists.parisc-linux.org>; Tue, 04 Jun 2002 12:55:48 +0100
Date: Tue, 4 Jun 2002 12:55:47 +0100
From: Patrick Caulfield <patrick@tykepenguin.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kdb_v21 branch updated to -pa26, and kallsyms cross-compile
Message-ID: <20020604115547.GB1808@tykepenguin.com>
References: <20020529082107.A2794@systemhalted> <20020529141231.GG9919@tykepenguin.com> <20020529110118.A3691@systemhalted> <20020529162438.GJ9919@tykepenguin.com> <20020529132631.B3691@systemhalted> <20020529180739.GL9919@tykepenguin.com> <20020530143626.GF810@tykepenguin.com> <20020530133515.B15631@systemhalted> <20020531072849.GD1145@tykepenguin.com> <20020531085419.B18658@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
In-Reply-To: <20020531085419.B18658@systemhalted>
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

On Fri, May 31, 2002 at 08:54:19AM -0400, Carlos O'Donell Jr. wrote:
> > 
> > Yes, exactly the same results. There's some thing different about the
> > binary vmlinux thatmay, or may not, be relevant. The kdb one seems to
> > have fewer segments than a non-kdb one:
> > 
> 
> Yes. Something is broke.
> 
> I just recently cleaned up my src trees and rebuilt a
> kdb enabled kernel and I get the same result on my 712/60.

I'm glad it's not just me :-)
 
> /me puts thinking cap on...
> 
> The _interesting_ thing would be to diff the System.map's
> for kdb-on vs. kdb-off to see is anything is explicitly being
> removed.

My guess was the the scsi __init functions were not getting called for some
reason, I have the System.map files for both builds but they both look OK (not
that I ful understand the kernel __init system though) 


patrick
