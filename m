Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3AECF483C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Feb 2002 09:45:18 -0700 (MST)
Message-Id: <200202121645.g1CGjEO4024447@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Getting a D370 off the ground
To: SROYLANCE@PARTNERS.ORG (Roylance, Stephen D.)
Date: Tue, 12 Feb 2002 11:45:13 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: grundler@dsl2.external.hp.com,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <FE6B88CC9D2BD311AD120008C7B3AF87081ED28D@phsexch3.mgh.harvard.edu> from "Roylance, Stephen D." at Feb 12, 2002 11:39:40 am
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

> OK, looks like I have two PA8000's.  I apt-get upgraded to unstable and
> d/l'ed the latest kernel tar.gz.  
> I'm getting an error trying to compile a 64 bit SMP kernel:
> make[1]: hppa64-linux-gcc: Command not found
> on, I guess, the first call to the compiler when I do 'make dep';
> my make is:
> ii  make                3.79.1-12           The GNU version of the "make"
> utility.
> my gcc is:
> ii  gcc                 3.0.4-2             The GNU C compiler.
> 
> Do I need to mess with a makefile so it knows what the right compiler is?
> Do I need to get an different version of gcc for 64-bit hppa?

I'd say forget about a 64-bit kernel and hppa64-linux-gcc.  There is no
point unless you have more than 4GB memory and need to run very large
applications.  The 32-bit system and tools are in much better shape.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
