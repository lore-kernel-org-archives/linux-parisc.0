Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Matthias Klose <doko@cs.tu-berlin.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] installation problems on an A500 
In-Reply-To: Message from Matthias Klose <doko@cs.tu-berlin.de>
   of "Mon, 07 Jan 2002 03:58:25 +0100." <15417.3793.688638.629130@gargle.gargle.HOWL>
References: <15417.3793.688638.629130@gargle.gargle.HOWL> 
Date: Sun, 06 Jan 2002 20:46:15 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020107034615.9BFD64839@dsl2.external.hp.com>
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

Matthias Klose wrote:
> Main Menu: Enter command or menu > bo pri
> Interact with IPL (Y, N, or Cancel)?> y
> 
> Booting... 
> Network Station Address 00306e-132574
> System IP Address 192.168.42.183
> Server IP Address 192.168.42.5

bootp is working.

> Boot IO Dependent Code (IODC) revision 2
> 
> IPL error: bad LIF magic.

The image bootp got was not a LIF image.

The easiest way to build a bootable LIF image is to
have both linux/ and palo/ source trees from parisc-linux CVS.
(or ftp site). Then "make palo" from linux source tree.
Resulting LIF image is in palo/lifimage.

I don't think we have any lifimages on the ftp site
with recent kernels.

grant
