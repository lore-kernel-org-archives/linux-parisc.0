Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "James Braid" <james.braid@peace.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Dodgy SCSI in L2000 
In-Reply-To: Message from "James Braid" <james.braid@peace.com>
   of "Wed, 08 May 2002 13:57:45 +1200." <002d01c1f633$bf3ebf50$5e01000a@bongo>
References: <002d01c1f633$bf3ebf50$5e01000a@bongo> 
Date: Wed, 08 May 2002 10:08:03 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020508160803.7DB61482A@dsl2.external.hp.com>
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

"James Braid" wrote:
> > Can you try a kernel with SCSI_NCR_IOMAPPED=y?
> 
> Yep. The kernels I am currently running already have that option set.
> I read something about SCSI not working without it, so I tried
> enabling it. Didn't really seem to have any affect on the problems I
> have been having.

The -pa7 I built has:
CONFIG_SCSI_NCR53C8XX_DEFAULT_TAGS=8
CONFIG_SCSI_NCR53C8XX_MAX_TAGS=32
CONFIG_SCSI_NCR53C8XX_SYNC=20
# CONFIG_SCSI_NCR53C8XX_PROFILE is not set
# CONFIG_SCSI_NCR53C8XX_IOMAPPED is not set
# CONFIG_SCSI_NCR53C8XX_PQS_PDS is not set
# CONFIG_SCSI_NCR53C8XX_SYMBIOS_COMPAT is not set

Of those, the _SYNC param is probably the one you want to twiddle.
That sets the SDTR ceiling for all scsi busses in the system.
While the 896 chip can do faster, termination, cable length, device
bugs, misalignment of jupiter and pluto, failure to sacrifice enough
710s, etc can cause the symptoms you described.

On the last two generations of parisc machines one can cripple individual
SCSI busses via PDC. Look at the SCSI cmd in the "configuration" menu at
boot up.  A few months back I added the PDC calls to sym53c8xx driver to
get SCSI initiator ID, width, and SDTR settings. This PDC support was
intended for Multi-initiator SCSI clusters. But is useful to cripple a
bus when the topology doesn't support the capabilities of the
interfaces or devices.


> I will try mucking with the termination and cables, but they should
> be okay right? I mean, this box hasn't been opened or touched since
> (hardware wise) since we got it from HP.

I normally expect the internal cables to be OK from HP.
But given the current issues, it's worth double checking.

The need for termination varies depending on drive types and bus speeds.
I'm talking practical here since SCSI spec *requires* the termination.

grant
