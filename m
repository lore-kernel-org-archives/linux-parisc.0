Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-msg-core-3.cisco.com (sj-msg-core-3.cisco.com [171.70.157.152])
	by dsl2.external.hp.com (Postfix) with ESMTP id 20D52482D
	for <parisc-linux@lists.parisc-linux.org>; Fri,  3 Jan 2003 00:10:19 -0700 (MST)
Date: Thu, 2 Jan 2003 23:10:11 -0800
From: Christian Suder <csuder@cisco.com>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C180 appears to hang booting current kernels
Message-Id: <20030102231011.67f0cc36.csuder@cisco.com>
In-Reply-To: <1041577311.20551.10.camel@beavis>
References: <20030102220703.7ce63215.csuder@cisco.com>
	<20030103064606.GL1053@maybe.net>
	<1041577311.20551.10.camel@beavis>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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


Thanks Ryan !

I'll stay tuned..... 

	Christian 


On 03 Jan 2003 00:01:51 -0700
Ryan Bradetich <rbradetich@uswest.net> wrote:

> This looks like my bad.
> 
> Willy and I worked on a solution for this problem, and I committed the
> fix to the linux-2.5 tree.  I have this change also in my local 
> linux 2.4 tree, but it does not appear that I committed it to CVS.
> 
> I appologize for this and will try to find time to update my local tree,
> verify it still works, and then commit this change over the weekend!
> 
> Thanks,
> 
> - Ryan
> 
> 
> 
> 
> On Thu, 2003-01-02 at 23:46, Chris Jantzen wrote:
> > On Thu, Jan 02, 2003 at 10:07:03PM -0800, Christian Suder wrote:
> > > I have a C180 running 2.4.19-pa9 just fine. However recent 2.4
> > > kernels hang, or appear to hang (I'm not the patient type...;-)
> > > after the"branching to kernel entry...." The heartbeat LED slowly
> > > blinks two times every 10 seconds or so, I've been waiting maybe 5
> > > minutes. 
> > > 
> > > I found some discussion on this back in November, it's not quite
> > > clear if the discussed changes were ever made. 
> > > 
> > > Any hope ?
> > 
> > Just be patient. It takes as long as 30 minutes to work it's way
> > through some tests. There is a fix for this, but it may take a while
> > to trickle down to testing and stable users. I'm sure others can
> > answers this in more depth. I was worried for my C180 for a while,
> > too.
> > 
> > -- 
> > chris jantzen kb7rnl =->         __O
> > Insert witty comment here.     _`\<,_
> > http://www.maybe.net/         (*)/ (*)
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> > 
> 
> 
