Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from zeus.maddentechnologies.com (dsl-64-195-19-17.telocity.com [64.195.19.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3FB7D482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 23 Jul 2002 19:37:58 -0600 (MDT)
Received: from madden by zeus.maddentechnologies.com with local (Exim 3.35 #1 (Debian))
	id 17XB60-0002Dl-00
	for <parisc-linux@lists.parisc-linux.org>; Tue, 23 Jul 2002 20:37:44 -0500
Date: Tue, 23 Jul 2002 00:08:02 -0500
To: Grant Grundler <grundler@dsl2.external.hp.com>
Subject: Re: [parisc-linux] XFree86 on B132L using Debian 3.0
Message-ID: <20020723050802.GA1106@maddentechnologies.com>
References: <20020722234020.GA16294@maddentechnologies.com> <20020723010259.D36CC482C@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020723010259.D36CC482C@dsl2.external.hp.com>
Resent-Message-Id: <E17XB60-0002Dl-00@zeus.maddentechnologies.com>
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

Thank you very much for pointing me to the files.  Both the .joel and
.ggg files worked great!  Do you know if you can run X in 16 or 24 bpp?
8 bpp seems to work just fine, but it would be nice to have at least 16
bpp.

Thanks again,

Mike

On Mon, Jul 22, 2002 at 07:02:59PM -0600, Grant Grundler wrote:
> Michael Madden wrote:
> > Has anyone gotten X to work with the recently released Debian 3.0 on 
> > a PA-RISC machine?  I have a B132L+ that I've installed Debian 3.0 on,
> > but I cannot get X setup correctly.
> 
> 	ftp://ftp.parisc-linux.org/kernels/b180
> 
> Has one XF86Config-4 (.joel) and will get another from my b180
> if it's any different.
> 
> Oh, and you've got too many bit depths listed in your XF86Config-4.
> I don't know why, but the X11 server can only tolerated one.
> Use what "fbset -i" output provides.
> 
> grant
