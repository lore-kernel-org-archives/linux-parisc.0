Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7A5B04855
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 25 Mar 2004 21:40:09 -0700 (MST)
Date: Thu, 25 Mar 2004 21:40:08 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Prakash Shenoy <mpshenoy@vsnl.com>
Subject: Re: [parisc-linux] HP 9000 Visualize C180 Workstation display does
	not appear.
Message-ID: <20040326044008.GA28525@colo.lackof.org>
References: <OFEELBIMFFDMJBJFHICCAEIICEAA.mpshenoy@vsnl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <OFEELBIMFFDMJBJFHICCAEIICEAA.mpshenoy@vsnl.com>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, Mar 25, 2004 at 10:06:35PM -0500, Prakash Shenoy wrote:
> Hi!
> 
> I recently bought a HP 9000 Visualize C180 workstation from a vendor on eBay
> and EVC to VGA Video Adapter Cable from another vendor. Both claim that Non
> DOA on arrival.
> 
> The workstation appears to boot properly but no display appears. Has any one
> come across this situation.

Have you tried hitting <tab> key at power up?
That should let you cycle through the various supported
graphics modes.

Have you tried with a serial console?
disconnect the keyboard before doing this.

This is a FAQ but it's not in the parisc-linux FAQ.
If someone has a moment to submit a patch against
cvs.parisc-linux.org's web/src/faq/index.x I'll be
happy to edit/submit it.

thanks,
grant
