Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [156.153.255.205])
	by dsl2.external.hp.com (Postfix) with ESMTP id 112CB482A
	for <parisc-linux@parisc-linux.org>; Mon,  7 Jan 2002 12:55:34 -0700 (MST)
To: Helge Deller <helge.deller@sap.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: Fwd: Re: [parisc-linux] mpg321 on 715/64? 
In-Reply-To: Message from Helge Deller <helge.deller@sap.com>
   of "Mon, 07 Jan 2002 12:49:52 +0100." <E16NYI1-0003EK-00@linuxlab.wdf.sap-ag.de>
References: <E16NYI1-0003EK-00@linuxlab.wdf.sap-ag.de> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 07 Jan 2002 12:55:33 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20020107195533.463BE37CB8@carmen.fc.hp.com>
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

Helge Deller writes...

> CC'ed to to the list too:
> 
> ----------  Forwarded Message  ----------
> 
> Subject: Re: [parisc-linux] mpg321 on 715/64?
> Date: Mon, 7 Jan 2002 12:49:00 +0100
> From: Helge Deller <helge.deller@sap.com>
> To: "Peter Lavender" <plaven@bigpond.net.au>
> 
> > > Get yourself the latest kernel (>= 2.4.17-pa5) and update to the latest
> > > mpg321 and it will work perfectly on your machine.
> > > I tested it myself on my 715/64.
> >
> > OK..
> >
> > Now to be a total annoying slacker newbie.. can I apt-get install the
> > kernel?
> 
> No.

That's not quite right. You can't always apt-get the latest, bleeding edge 
kernel, but there are fairly new, stable kernel-image-* packages for hppa in 
the Debian archive. You can apt-get those and it works as expected.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
