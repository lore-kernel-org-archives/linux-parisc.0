Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3B563482A
	for <parisc-linux@parisc-linux.org>; Tue, 22 Jan 2002 10:05:54 -0700 (MST)
Date: Tue, 22 Jan 2002 12:05:48 -0500
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Trouble installing 0.9.3 on 735/99
Message-ID: <20020122120548.M19637@systemhalted>
References: <A8566E157F5FD411BCFB00D0B7816D51C72CD9@ntexchange.cat.csiro.au> <20020122141253.GB25314@sleepie.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020122141253.GB25314@sleepie.demon.co.uk>; from rhirst@linuxcare.com on Tue, Jan 22, 2002 at 02:12:53PM +0000
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

> > Hi all:
> > 
> > * drop to shell, do "mkdir /inst ; mount /dev/sdb /inst -t iso9660"
> > 
> > Note that this last step only sometimes works. That is, only sometimes does
> > the install program see the mounted directory.
> 
> Are you confident that you are terminating the external scsi bus
> properly?  0.9.2 ISO used an older slower scsi driver that was possibly
> less susceptible to bad termination.
> 
> Richard
> 
>

I can't get any of the 715/50's to run stably with the newer
SCSI driver. And after testing I can almost pinpoint with 95%
accuracy tha it's the new driver.

I have yet to go about running the latest kernel with the sim700
driver. Though if I get some time this afternoon I will.
(Just spent some time adding diskless 715/50's to our cluster)

Has anyone been able to get SCSI disks that are not from HP
to work on the 715's? (New terminator? Different terminator?)

c. 
