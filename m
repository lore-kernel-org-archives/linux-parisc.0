Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailer.berkom.de (mailer.berkom.de [141.39.13.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id CF11C4864
	for <parisc-linux@lists.parisc-linux.org>; Sun, 27 Oct 2002 03:23:45 -0700 (MST)
From: "N.Leymann" <leymann@berkom.de>
Message-Id: <200210271020.g9RAK03q006456@mailer.berkom.de>
Subject: Re: [parisc-linux] Branch Prediction
To: grundler@dsl2.external.hp.com (Grant Grundler)
Date: Sun, 27 Oct 2002 11:20:00 +0100 (MET)
Cc: parisc-linux@lists.parisc-linux.org, dave@hiauly1.hia.nrc.ca
In-Reply-To: <20021027012303.7B576484E@dsl2.external.hp.com> from "Grant Grundler" at Oct 26, 2002 07:23:03 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Hi,

Sunday, October 27, 2002, 2:23:03 AM, you wrote:

> "John David Anglin" wrote:
>> I wonder if the PA-8700 in the rp2470 has it?
> gsyprf11 is a 650Mhz PA8700. please try it.

It's quite a while ago that I worked on assembly level with HPPA so I
might be wrong. But as far as I know most of the HPPA (at least 8200 and
8700) implement static and dynamic branch prediction. Which scheme is
used is controlled on a per page basis with the P-Bit in the ITLB.

With the HP c/c++ compilers you can control this behaviour using the
+O[no]static_prediction flags.

> Think so?
> After reading the description I had the impression BTS has to be on chip
> and integrated in order to get the speed. But I'm just a SW engineer...
Yep. If it's implemented it has to be on chip.

> yes.  IIRC, branches forward tend to not be taken and branches backwards
> tend to be loops. Or something along that line. But with PBO, the
> static hints are better. And HPUX has a very cool "driver" called
> "flipper" that will flip to static hints to match performance path
> at run time.
 
>> I don't know how the dynamic prediction hardware
>> works but I would think it wouldn't be there if it didn't
>> improve branch prediction.
In this case a branch history table is used which records the results of the
last branches. HPPA uses a three bit shift register (256 entries).
The fetch unit checks this register and predicts the branch according to the
content. eg. if the branch was taken two times before it is predicted that it
will be taken again.

If you are interested in more details I can check tomorrow when I'm back to
office. I should have a paper somewhere which compares static and dynamic
branch prediction on PA2.0.

  hope that helps

     Nic
