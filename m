Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 520B3482D
	for <parisc-linux@lists.parisc-linux.org>; Fri,  3 May 2002 07:42:59 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 173dKr-0007wm-00; Fri, 03 May 2002 14:42:57 +0100
Date: Fri, 3 May 2002 14:42:57 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Is it worth keeping a dual CPU K250
Message-ID: <20020503144257.H2591@parcelfarce.linux.theplanet.co.uk>
References: <3CD19041.8080704@neuronet.pitt.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3CD19041.8080704@neuronet.pitt.edu>; from raffo@neuronet.pitt.edu on Thu, May 02, 2002 at 03:15:13PM -0400
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

On Thu, May 02, 2002 at 03:15:13PM -0400, Rafael E. Herrera wrote:
> Hi,
> 
> We have an HP K250 dual 160 MHz CPU machine in one of the rooms here. It 
> was never fully used, since the OS media and support costs were very high.
> 
> They are considering pitching it. Can one install palinux on this box?

For the moment, you need Christoph Plattner's serial console driver and
some modification to the install image.  See the mailing list archives
for more details (hmm, anyone want to put together a K-class installing
howto?)

> It is extremely noisy and the size of a small refrigerator. Do you think 
> it is worth keeping?

Depends how much you're willing to hack around.  K class support won't be
as smooth as the other machines for some time.  Some of the devices may
never end up being supported (though centronics, single ended scsi, lan
and keyboard should all work already).  Looking at the K250 in the HWDB,
the Skunk Centronics & SCSI card, the GeckoBOA card, the Eole CAP/MUX and
the GSY Core FW-SCSI will probably end up being supported, but probably
not the Interphase 100BaseTX NIO card.  My crystal ball is second-rate,
however, and when I say `eventually', I mean `in a year or two'.

-- 
Revolutions do not require corporate support.
