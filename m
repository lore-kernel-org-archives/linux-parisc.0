Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id C57204829
	for <parisc-linux@lists.parisc-linux.org>; Fri,  3 Jan 2003 00:01:57 -0700 (MST)
Subject: Re: [parisc-linux] C180 appears to hang booting current kernels
From: Ryan Bradetich <rbradetich@uswest.net>
To: Chris Jantzen <chris-parisc@maybe.net>
Cc: Christian Suder <csuder@cisco.com>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030103064606.GL1053@maybe.net>
References: <20030102220703.7ce63215.csuder@cisco.com>
	<20030103064606.GL1053@maybe.net>
Content-Type: text/plain
Date: 03 Jan 2003 00:01:51 -0700
Message-Id: <1041577311.20551.10.camel@beavis>
Mime-Version: 1.0
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

This looks like my bad.

Willy and I worked on a solution for this problem, and I committed the
fix to the linux-2.5 tree.  I have this change also in my local 
linux 2.4 tree, but it does not appear that I committed it to CVS.

I appologize for this and will try to find time to update my local tree,
verify it still works, and then commit this change over the weekend!

Thanks,

- Ryan




On Thu, 2003-01-02 at 23:46, Chris Jantzen wrote:
> On Thu, Jan 02, 2003 at 10:07:03PM -0800, Christian Suder wrote:
> > I have a C180 running 2.4.19-pa9 just fine. However recent 2.4 kernels
> > hang, or appear to hang (I'm not the patient type...;-) after the
> > "branching to kernel entry...." The heartbeat LED slowly blinks two times
> > every 10 seconds or so, I've been waiting maybe 5 minutes. 
> > 
> > I found some discussion on this back in November, it's not quite clear if
> > the discussed changes were ever made. 
> > 
> > Any hope ?
> 
> Just be patient. It takes as long as 30 minutes to work it's way through
> some tests. There is a fix for this, but it may take a while to trickle
> down to testing and stable users. I'm sure others can answers this in
> more depth. I was worried for my C180 for a while, too.
> 
> -- 
> chris jantzen kb7rnl =->         __O
> Insert witty comment here.     _`\<,_
> http://www.maybe.net/         (*)/ (*)
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
