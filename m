Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B9D1C483D
	for <parisc-linux@lists.parisc-linux.org>; Tue,  5 Mar 2002 13:07:12 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16iLDL-0004L2-00; Tue, 05 Mar 2002 20:07:11 +0000
Date: Tue, 5 Mar 2002 20:07:11 +0000
From: Matthew Wilcox <willy@debian.org>
To: James S <smithjames@comcast.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Printer Port & kernel stuff
Message-ID: <20020305200711.E30960@parcelfarce.linux.theplanet.co.uk>
References: <005101c1c480$ae437900$02c1a8c0@james.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <005101c1c480$ae437900$02c1a8c0@james.co.uk>; from smithjames@comcast.net on Tue, Mar 05, 2002 at 03:02:29PM -0500
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

On Tue, Mar 05, 2002 at 03:02:29PM -0500, James S wrote:
> Has nobody else had the same problem as me with the printer port ?
> 
> My 712/60 locks every time i send anything to the local printer.

Isn't this cured with Thomas Bogendoerfer's recent changes to make
parport_gsc & parport_pc work when compiled into the same kernel?

> while i'm at it - does anybody have a list of the options i should choose
> when i'm doing a make config for the kernel so i can get the right network
> stuff installed etc.

defconfig is pretty all-encompassing.  there's also the debian-configs
in the CVS tree.

> i need to recompile to include smbfs (which i think would be very handy if
> compiled into the kernel as standard)

last i heard it still wouldn't compile.  but maybe it got fixed and i
don't remember.

-- 
Revolutions do not require corporate support.
