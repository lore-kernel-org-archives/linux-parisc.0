Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hadron.dyndns.org (ma-amesbury1e-100.mrrmnh.adelphia.net [68.168.107.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id 20ACE4847
	for <parisc-linux@lists.parisc-linux.org>; Sun,  2 Feb 2003 22:33:46 -0700 (MST)
Date: Mon, 3 Feb 2003 00:33:36 -0500
From: "Aaron St. Pierre" <asp@ungod.com>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel compile
Message-ID: <20030203053336.GC1046@hadron>
References: <20030203020247.GB1046@hadron> <20030203041122.GB29454@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030203041122.GB29454@dsl2.external.hp.com>
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

First, thanks for the response, I really appreciate it. 

I setup a page with all of the information from the "basics" section
of the faq. That page is : http://hadron.dyndns.org/parisc/

Grant, I did as you said, and the same thing happened. What disturbs me
is when it stopped at the brancing message and I waited about 15 minutes
then pressed the toc button there was still nothing in the pim ( I
cleared it prior to boot) I hope this doesn't mean the kernel isn't even
loading and it has something to do with palo. 

Maybe I am once again making this too complicated. If I left anything 
out let me know and I will add it. 

Thanks again for your help. :) 
In another life Grant Grundler wrote:

> On Sun, Feb 02, 2003 at 09:02:47PM -0500, Aaron St. Pierre wrote:
> > I took the config from 2.4.18-32
> > and used that as my starting point for 2.4.20-pa23 
> 
> Can you:
> # mv .config ../config-orig
> # yes "" | make oldconfig
>  (or something like that)
> 
> The default kernel should work on j2240.
> 
> grant
> 
> ps. FAQ has a link to "how to report kernel bugs"
> 	http://www.parisc-linux.org/faq/index.html#kernelbugreport

-- 
Aaron St. Pierre			tel: 978.828.6177
asp@ungod.com

 A day without sunshine is like a day without orange juice.
