Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 34E7F482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Feb 2002 10:26:08 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16ZEmk-0000bw-00; Fri, 08 Feb 2002 17:26:06 +0000
Date: Fri, 8 Feb 2002 17:26:06 +0000
From: Matthew Wilcox <willy@debian.org>
To: Paul Telford <paul_telford@hp.com>
Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] apache weirdness
Message-ID: <20020208172606.C22440@parcelfarce.linux.theplanet.co.uk>
References: <200202071910.g17JAxv11007@ros-saab.rose.hp.com> <20020208074213.7F177482A@dsl2.external.hp.com> <200202081715.g18HFqq03560@ros-saab.rose.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200202081715.g18HFqq03560@ros-saab.rose.hp.com>; from paul_telford@hp.com on Fri, Feb 08, 2002 at 09:15:52AM -0800
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

On Fri, Feb 08, 2002 at 09:15:52AM -0800, Paul Telford wrote:
> On Thursday 07 February 2002 11:42 pm, Grant Grundler wrote:
> > I think the workaround was to use a different method
> > of displaying the files. We weren't able to reproduce
> > the bug on a different machine.
> 
> 
> I can reproduce it reliably.  What (if anything) can I do to help debug the 
> problem further?  

<puts on apache maintainer's cap>
In the apache-dev package, there's /usr/sbin/apache.dbg which is an
unstripped binary you can use to debug problems like this.

-- 
Revolutions do not require corporate support.
