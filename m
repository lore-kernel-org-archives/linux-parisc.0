Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Andy Walker <squawker@start.no>
Cc: Richard Hirst <rhirst@linuxcare.com>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Status report - B132L and 725/100 
In-Reply-To: Message from Andy Walker <squawker@start.no>
   of "Wed, 19 Dec 2001 15:15:13 +0100." <1008771313.3c20a0f14484a@nyepost.start.no>
References: <1008589643.3c1ddb4b75583@nyepost.start.no> <1008594958.3c1df00ed9750@nyepost.start.no> <20011219113621.X1897@linuxcare.com>  <1008771313.3c20a0f14484a@nyepost.start.no> 
Date: Wed, 19 Dec 2001 09:56:35 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20011219165635.3E405482A@dsl2.external.hp.com>
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

Andy Walker wrote:
> To triple check the termination, I installed the terminator packs on
> the card and moved the cable from the internal connector to the
> external one. No difference there, even with your kernel parameter
> suggestion.

Couple more things:
o make sure your disks are *not* terminated - just both ends of the bus.
o double check all connectors to make sure there are no bent pins.
o replace any cables you can - especially external ones.
o verify the disks are the correct type. For c720, I expect
  *differential* SCSI.  Single Ended disks were used with LASI based
  machines (53c710) and built-in fast/wide on a few of the BXXX/CXXX
  workstations.

grant
