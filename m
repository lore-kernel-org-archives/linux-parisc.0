Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E08344829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 30 Sep 2002 15:22:57 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17w80F-0004DX-00; Mon, 30 Sep 2002 22:22:55 +0100
Date: Mon, 30 Sep 2002 22:22:55 +0100
From: Matthew Wilcox <willy@debian.org>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: Stian Soiland <stain@itea.ntnu.no>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 9000/802/K250 won't boot with images - serial/stack problem?
Message-ID: <20020930222255.T18377@parcelfarce.linux.theplanet.co.uk>
References: <20020930200805.GA9133@itea.ntnu.no> <1033417191.31126.4.camel@beavis> <20020930204559.GB9133@itea.ntnu.no> <1033419990.30622.11.camel@beavis>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1033419990.30622.11.camel@beavis>; from rbradetich@uswest.net on Mon, Sep 30, 2002 at 03:06:29PM -0600
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

On Mon, Sep 30, 2002 at 03:06:29PM -0600, Ryan Bradetich wrote:
> P.S. What would it take to get the default debian configs to compile in
> the the Serial Mux, and to provide the /dev/ttyB0 from the parisc-linux
> port by default in debian?  A patch to the debian def_configs and the
> MAKEDEV package?

we really shouldn't be distributing a kernel that uses char-major-42.

 42             Demo/sample use

                This number is intended for use in sample code, as
                well as a general "example" device number.  It
                should never be used for a device driver that is being
                distributed; either obtain an official number or use
                the local/experimental range.  The sudden addition or
                removal of a driver with this number should not cause
                ill effects to the system (bugs excepted.)

                IN PARTICULAR, ANY DISTRIBUTION WHICH CONTAINS A
                DEVICE DRIVER USING MAJOR NUMBER 42 IS NONCOMPLIANT.

maybe we could recycle char 11?

ideally, i'd like to have this driver claim ttyS ports from the
serial core ... but that's not necessarily going to happen for 2.5,
and definitely not for 2.4.

anyone fancy contacting lanana and asking for an official allocation?

-- 
Revolutions do not require corporate support.
