Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3296B4833
	for <parisc-linux@lists.parisc-linux.org>; Tue,  4 Jun 2002 06:44:41 -0600 (MDT)
Date: Tue, 4 Jun 2002 08:44:40 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: Patrick Caulfield <patrick@tykepenguin.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kdb_v21 branch updated to -pa26, and kallsyms cross-compile
Message-ID: <20020604084440.A24973@systemhalted>
References: <20020529141231.GG9919@tykepenguin.com> <20020529110118.A3691@systemhalted> <20020529162438.GJ9919@tykepenguin.com> <20020529132631.B3691@systemhalted> <20020529180739.GL9919@tykepenguin.com> <20020530143626.GF810@tykepenguin.com> <20020530133515.B15631@systemhalted> <20020531072849.GD1145@tykepenguin.com> <20020531085419.B18658@systemhalted> <20020604115547.GB1808@tykepenguin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020604115547.GB1808@tykepenguin.com>; from patrick@tykepenguin.com on Tue, Jun 04, 2002 at 12:55:47PM +0100
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
> > The _interesting_ thing would be to diff the System.map's
> > for kdb-on vs. kdb-off to see is anything is explicitly being
> > removed.
> 
> My guess was the the scsi __init functions were not getting called for some
> reason, I have the System.map files for both builds but they both look OK (not
> that I ful understand the kernel __init system though) 
>

Yeah, I've run through the kdb and non-kdb builds and everything
is okay. 

I think there are two maybe three places where kdb initializes 
certain structures during startup. I'm going to have to check 
those paths to see how far it gets before dying.

Any comments from the crowd would be helpfull :)

/me goes off to add some printk's and extra checks
c. 
