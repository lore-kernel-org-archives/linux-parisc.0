Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Michael Madden <madden@maddentechnologies.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] XFree86 on B132L using Debian 3.0 
In-Reply-To: Message from Michael Madden <madden@maddentechnologies.com>
   of "Mon, 22 Jul 2002 18:40:21 CDT." <20020722234020.GA16294@maddentechnologies.com>
References: <20020722234020.GA16294@maddentechnologies.com> 
Date: Mon, 22 Jul 2002 19:02:59 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020723010259.D36CC482C@dsl2.external.hp.com>
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

Michael Madden wrote:
> Has anyone gotten X to work with the recently released Debian 3.0 on 
> a PA-RISC machine?  I have a B132L+ that I've installed Debian 3.0 on,
> but I cannot get X setup correctly.

	ftp://ftp.parisc-linux.org/kernels/b180

Has one XF86Config-4 (.joel) and will get another from my b180
if it's any different.

Oh, and you've got too many bit depths listed in your XF86Config-4.
I don't know why, but the X11 server can only tolerated one.
Use what "fbset -i" output provides.

grant
