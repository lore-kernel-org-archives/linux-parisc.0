Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7AC21482D
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Aug 2003 16:41:00 -0600 (MDT)
From: Bjorn Helgaas <bjorn.helgaas@hp.com>
To: Grant Grundler <grundler@parisc-linux.org>,
	Joel Soete <joel.soete@tiscali.be>
Subject: Re: [parisc-linux] Re: Debian on rp 7400
Date: Fri, 8 Aug 2003 16:40:52 -0600
Cc: "Conan C. Albrecht" <conan_albrecht@byu.edu>,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
References: <25EEF58E-C82D-11D7-8F19-00039398B282@byu.edu> <3F336914.5020305@tiscali.be> <20030808163744.GA29158@dsl2.external.hp.com>
In-Reply-To: <20030808163744.GA29158@dsl2.external.hp.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200308081640.52355.bjorn.helgaas@hp.com>
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

On Friday 08 August 2003 10:37 am, Grant Grundler wrote:
> google search for
> 	equivalent mapped [parisc-linux site:lists.parisc-linux.org]
> 
> yielded the original thread from Jerry Huck:
> 
> http://lists.parisc-linux.org/pipermail/parisc-linux/1999-December/008101.html
> 
> I only partially understand what Jerry talking about and have no idea
> how linux VM implementation collides with the aliasing rules.
> 
> 
> Bjorn Helgaas posted a another thread two years later that might
> be more helpful since it's specific to superdome (AFAIK same problems
> as with N-class and L3000):
> 
> http://lists.parisc-linux.org/pipermail/parisc-linux/2001-April/012388.html

For archive crawlers, here's a link to Willy's idea for using kmap to
deal with this problem:

http://lists.parisc-linux.org/pipermail/parisc-linux/2002-March/015826.html
