Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id CCE984837
	for <parisc-linux@lists.parisc-linux.org>; Sun, 14 Jul 2002 00:26:43 -0600 (MDT)
Date: Sat, 13 Jul 2002 23:26:42 -0700 (PDT)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP (in)stability 
In-Reply-To: <20020710053647.D282F4853@dsl2.external.hp.com>
Message-ID: <Pine.LNX.4.44.0207132314190.24206-100000@garibaldi.apptechsys.com>
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

On Tue, 9 Jul 2002, Grant Grundler wrote:

> The -pa52 kernel built 100+ kernels/modules successively until
> I stopped it on the a500-44. The same kernel on a500-6X (PA8700)
> crashes after 12 or so hours of building gcc bits. 

I tested -pa53 on smp on J5k building kernels (make -j4), built 115,
here's a sample start/stop time. 
Start: Sat Jul 13 19:23:25 PDT 2002 
End: Sat Jul 13 19:26:56 PDT 2002

It is just apt-get update and samba (so far) that kill it.  Just did a cvs
update, worked fine.  I wonder what it is about apt-get that kills it.  
Can someone else with a J5k test this?  Running a current 2.4.18 smp
kernel and running apt-get update.  

-- 
Why am I so soft in the middle when the rest of my life is so hard?
		-- Paul Simon
