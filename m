Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dsl2.external.hp.com (localhost [127.0.0.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6162B482B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 26 Aug 2002 10:10:49 -0600 (MDT)
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SCSI Disks on a K580 Help Required 
In-Reply-To: Message from Grant Grundler <grundler@dsl2.external.hp.com>
   of "Mon, 26 Aug 2002 09:38:40 MDT." <20020826153840.905F0482B@dsl2.external.hp.com>
References: <49AA3A3C863E5B4C911320AEF99E5DA3010CCCC4@wing-ep.tip.csiro.au>  <20020826153840.905F0482B@dsl2.external.hp.com> 
Date: Mon, 26 Aug 2002 10:10:49 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020826161049.6162B482B@dsl2.external.hp.com>
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

Grant Grundler wrote:
> HP tested that. The NCR 53cxxx chips "tristate" the bus when
> the wrong signaling is used. You can smoke devices by adding/removing
> termination will the bus is active (ie disconnect a cable).

s/will/while/

grant
