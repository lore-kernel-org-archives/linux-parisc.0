Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9AE6C482B
	for <parisc-linux@lists.parisc-linux.org>; Sat,  1 Jun 2002 00:35:02 -0600 (MDT)
Date: Fri, 31 May 2002 23:34:59 -0700 (PDT)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.18 SMP instability 
In-Reply-To: <20020529063552.B14D8482A@dsl2.external.hp.com>
Message-ID: <Pine.LNX.4.44.0205312326280.11012-100000@garibaldi.apptechsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Wed, 29 May 2002, Grant Grundler wrote:

> Jeremy Drake wrote:
> > tried to bend the pins so that they didn't short 
> > anything, and one broke off.  Both onboard USB ports haven't worked since.  
> 
> Ok. So broken physically but not eletrically.
> Not sure that should cause any problems.
I pulled the drive and plugged it into an identical (but not broken) 
J5000.  The box HPMC'd when doing an apt-get update.  Since this box was 
on graphics console, I got a large amount of hex numbers spewed to the 
screen.  So, at least we can rule out any damage to the box as the cause 
of this. 

-- 
Here I am, fifty-eight, and I still don't know what I want to be when
I grow up.
		-- Peter Drucker
