Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 20D8A482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 31 May 2002 06:54:07 -0600 (MDT)
Received: (from carlos@localhost)
	by sh.od.inet (8.11.6/8.11.0) id g4VCsJE18801
	for parisc-linux@lists.parisc-linux.org; Fri, 31 May 2002 08:54:19 -0400
Date: Fri, 31 May 2002 08:54:19 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kdb_v21 branch updated to -pa26, and kallsyms cross-compile
Message-ID: <20020531085419.B18658@systemhalted>
References: <20020529075131.GC9919@tykepenguin.com> <20020529082107.A2794@systemhalted> <20020529141231.GG9919@tykepenguin.com> <20020529110118.A3691@systemhalted> <20020529162438.GJ9919@tykepenguin.com> <20020529132631.B3691@systemhalted> <20020529180739.GL9919@tykepenguin.com> <20020530143626.GF810@tykepenguin.com> <20020530133515.B15631@systemhalted> <20020531072849.GD1145@tykepenguin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020531072849.GD1145@tykepenguin.com>; from patrick@tykepenguin.com on Fri, May 31, 2002 at 08:28:49AM +0100
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

> 
> Yes, exactly the same results. There's some thing different about the
> binary vmlinux thatmay, or may not, be relevant. The kdb one seems to
> have fewer segments than a non-kdb one:
> 

Yes. Something is broke.

I just recently cleaned up my src trees and rebuilt a
kdb enabled kernel and I get the same result on my 712/60.

/me puts thinking cap on...

The _interesting_ thing would be to diff the System.map's
for kdb-on vs. kdb-off to see is anything is explicitly being
removed.

I'll start a build going.

c.
