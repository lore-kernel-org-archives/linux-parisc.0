Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id A7BF0482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Jan 2002 03:56:13 -0700 (MST)
Date: Fri, 11 Jan 2002 10:46:12 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthieu Delahaye <delahaym@esiee.fr>
Cc: Nicholas Leippe <nick@byu.edu>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] video capabilities?
Message-ID: <20020111104612.GH31308@sleepie.demon.co.uk>
References: <02011019595101.17281@nick> <3C3EBD2F.3040905@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3C3EBD2F.3040905@esiee.fr>
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

On Fri, Jan 11, 2002 at 11:23:43AM +0100, Matthieu Delahaye wrote:
> >
> >
> >Also, for some reason I can't get any sound out of
> >it.  I can get garbled clicks out of the speaker,
> >but mpg123 doesn't play recognizably and artsd
> >fails to start with an error.
> >
> 
> I bet you used the 0.9.3, which is good.
> Unfortunaly, the Harmony (audio chipset) bug
> has only been corrected after. 2 solution:
> 1) Download the kernel sources from a CVS snapshot:
>    ftp://ftp.parisc-linux.org/cvs
>    and compile a new kernel.
> 2) Ask me to put a kernel in a download place. But please
>   remember this will not be an official kernel.

Just  grab the latest kernel from ftp.parisc-linux.org/kernels/32
(iirc); that should work.

Richard
