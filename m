Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Peter Mottram <peter@petescaff.com>
Cc: parisc list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] C110, kernel Panics, still more tears ;-( 
In-Reply-To: Message from Peter Mottram <peter@petescaff.com>
   of "Sat, 20 Jul 2002 12:21:54 +0200." <Pine.LNX.4.44.0207201218410.21970-100000@r6.petescaff.com>
References: <Pine.LNX.4.44.0207201218410.21970-100000@r6.petescaff.com> 
Date: Sat, 20 Jul 2002 09:40:43 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020720154043.8F74B484E@dsl2.external.hp.com>
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

Peter Mottram wrote:
> The internal disks are fast-wide differential & the external SCSI ports
> are FW-diff & single-ended. I don't know the 2490A.

C2490 is a 2GB FWD diff. About 6 years Old IIRC.
Odds are you need to update the firmware since it rolled every
3-4 monthes even after HP stopped producing that model. See
the parisc FAQ re platform firmwre and the same HP ftp sites
referenced in the FAQ have disk firmware too.

grant
