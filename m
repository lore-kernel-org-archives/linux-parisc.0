Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.cs.tu-berlin.de (mail.cs.tu-berlin.de [130.149.17.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id B24E14836
	for <parisc-linux@lists.parisc-linux.org>; Sun,  6 Jan 2002 22:28:57 -0700 (MST)
From: Matthias Klose <doko@cs.tu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <15417.12781.297448.785840@gargle.gargle.HOWL>
Date: Mon, 7 Jan 2002 06:28:13 +0100
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] installation problems on an A500 
In-Reply-To: <20020107034615.9BFD64839@dsl2.external.hp.com>
References: <15417.3793.688638.629130@gargle.gargle.HOWL>
	<20020107034615.9BFD64839@dsl2.external.hp.com>
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

Grant Grundler writes:
> > Boot IO Dependent Code (IODC) revision 2
> > 
> > IPL error: bad LIF magic.
> 
> The image bootp got was not a LIF image.
> 
> The easiest way to build a bootable LIF image is to
> have both linux/ and palo/ source trees from parisc-linux CVS.
> (or ftp site). Then "make palo" from linux source tree.
> Resulting LIF image is in palo/lifimage.
> 
> I don't think we have any lifimages on the ftp site
> with recent kernels.

extracted from ftp://ftp.parisc-linux.org/cd-images/palinux-0.9.3.iso

and

http://http.us.debian.org/debian/dists/woody/main/disks-hppa/3.0.18-2001-12-21/
