Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [156.153.255.205])
	by dsl2.external.hp.com (Postfix) with ESMTP id 788304840
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Jun 2002 14:38:18 -0600 (MDT)
To: s-clarob@st-aidans.cumbria.sch.uk
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] pppconfig & 24bit colour 
In-Reply-To: Message from s-clarob@st-aidans.cumbria.sch.uk
   of "Mon, 10 Jun 2002 08:51:27 BST." <5.1.0.14.0.20020610084610.026cfc70@10.106.16.2>
References: <5.1.0.14.0.20020610084610.026cfc70@10.106.16.2> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 10 Jun 2002 14:38:15 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20020610203815.8349B380D5@carmen.fc.hp.com>
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

s-clarob@st-aidans.cumbria.sch.uk writes...

> 2 Quick questions,
> 
> 1. Is it possible to get the 24bit colour recovery to work with 
> PARISC-Linux on a 715/100 ?

The Color Recovery extension is only available in the HP-UX Xserver. No one 
has been able to run the HP-UX Xserver on palinux yet.

> 2. when running pppconfig, the said 715/100 tries to detect the modem and 
> then hangs. It's heartbeat goes out and it dumps some output top the sti ( 
> not had a chance to write it down yet ). is there any known issues with 
> either pppconfig or the serial drivers in relation to the 715?

I seem to remember a problem with PPP, check the list archive. Updating 
your kernel is probably a good idea too.

-- 
Matt Taggart
taggart@fc.hp.com
