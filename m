Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc3-hems4-0-cust105.bre.cable.ntl.com [213.107.179.105])
	by dsl2.external.hp.com (Postfix) with ESMTP id 81519482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Dec 2001 13:52:02 -0700 (MST)
Date: Sat, 29 Dec 2001 20:54:11 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Hinrich Aue <H_Aue@t-online.de>,
	parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] DSL on a 715/80 with rp-pppoe
Message-ID: <20011229205411.GA11344@sleepie.demon.co.uk>
References: <16JhbT-1jD9EmC@fwd05.sul.t-online.com> <20011228054723.01E59482B@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011228054723.01E59482B@dsl2.external.hp.com>
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

IIRC, when I first got ppp working on hppa, it would only work if
I created a dummy /sbin/hotplug, see

<http://lists.parisc-linux.org/hypermail/parisc-linux/6527.html>

Richard


On Thu, Dec 27, 2001 at 10:47:22PM -0700, Grant Grundler wrote:
> Hinrich Aue wrote:
> > I tried to install rp-pppoe on my 715/80, and it worked until one point, when
> > I try to start the pppd and the box crashes instantly.
> 
> I was running ppp over a regular 28.8Kbps dialup modem on the c3k.
> Haven't tried it recently.
> Can you tell me which kernel version (uname -a) you are using?
> offhand, I'd suggesting trying the latest available from
> 	ftp://ftp.parisc-linux.org/kernels/32
> 
> grant
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
