Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 19E064856
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Dec 2001 03:03:01 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16JXNH-0008K2-00; Thu, 27 Dec 2001 10:02:55 +0000
Date: Thu, 27 Dec 2001 10:02:55 +0000
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: James Mcclain <jmccla3@gl.umbc.edu>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 64-bit pa20, pa24 fail to boot on my c200
Message-ID: <20011227100255.D30605@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.31L.02.0112261221590.5356-100000@linux1.gl.umbc.edu> <jmccla3@gl.umbc.edu> <20011226182102.52C76483F@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011226182102.52C76483F@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Wed, Dec 26, 2001 at 11:21:01AM -0700
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

On Wed, Dec 26, 2001 at 11:21:01AM -0700, Grant Grundler wrote:
> James Mcclain wrote:
> > my machine fails to boot with a 64-bit kernel (either downloaded
> > from the website or built by me).
> 
> See the mail archives at http://lists.parisc-linux.org.
> Search for C200, CONFIG_PDC_NARROW, or 64-bit.
> 
> Short anwser is you need to define CONFIG_PDC_NARROW for 64-bit.

and the really short answer is that there's no point in booting a 64-bit
kernel on a c200.  stick to a 32-bit kernel.

-- 
Revolutions do not require corporate support.
