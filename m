Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1A1934846
	for <parisc-linux@parisc-linux.org>; Mon,  7 Jan 2002 05:50:28 -0700 (MST)
Date: Mon, 7 Jan 2002 12:40:29 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Helge Deller <helge.deller@sap.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: Fwd: Re: [parisc-linux] mpg321 on 715/64?
Message-ID: <20020107124029.GF25927@sleepie.demon.co.uk>
References: <E16NYI1-0003EK-00@linuxlab.wdf.sap-ag.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E16NYI1-0003EK-00@linuxlab.wdf.sap-ag.de>
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

On Mon, Jan 07, 2002 at 12:49:52PM +0100, Helge Deller wrote:
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
> 
> You need to build it yourself. You may download a daily kernel source
> snapshot as tarball from ftp://ftp.parisc-linux.org:21/cvs/ (though,
>  2.4.17-pa5 isn't  there yet since I committed it yesterday night and this
>  directory will be only updated once a day. Wait til' later today or
>  tomorrow.), or
> check out the sources from CVS (http://cvs.parisc-linux.org).

Or look in <ftp://ftp.parisc-linux.org/kernels/32/> in a day or two.
Should find fresh kernel builds there on a daily basis, I think.

Richard
