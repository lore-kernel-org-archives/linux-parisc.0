Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Steve.Grady@csiro.au
Cc: a_eisner@eisner.com, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SCSI Disks on a K580 Help Required 
In-Reply-To: Message from Steve.Grady@csiro.au
   of "Mon, 26 Aug 2002 11:03:18 +1000." <49AA3A3C863E5B4C911320AEF99E5DA3010CCCC4@wing-ep.tip.csiro.au>
References: <49AA3A3C863E5B4C911320AEF99E5DA3010CCCC4@wing-ep.tip.csiro.au> 
Date: Mon, 26 Aug 2002 09:38:40 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020826153840.905F0482B@dsl2.external.hp.com>
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

Steve.Grady@csiro.au wrote:
> > "First try." The internal disk drives in the K580 are fast wide 
> > differential. The differential is high voltage differential, not low 
> > voltage differential. Could be that the Maxtor 4.5GB UW is 
> > the wrong type.
> Well I hope I have not damaged the drive

HP tested that. The NCR 53cxxx chips "tristate" the bus when
the wrong signaling is used. You can smoke devices by adding/removing
termination will the bus is active (ie disconnect a cable).

grant
