Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id CB6E3482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Feb 2002 06:47:40 -0700 (MST)
Date: Thu, 7 Feb 2002 13:35:44 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: "Kurc, Marcin A." <makurc@cooperstandard.com>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] C240 64-bit kernel
Message-ID: <20020207133544.GI5609@sleepie.demon.co.uk>
References: <426B4FEBE684D411B0A60090273B1D24024855EB@aa0016.auburn.auto.cooperintra.ctb>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <426B4FEBE684D411B0A60090273B1D24024855EB@aa0016.auburn.auto.cooperintra.ctb>
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

On Thu, Feb 07, 2002 at 07:23:31AM -0500, Kurc, Marcin A. wrote:
> Hi,
> Did anybody got a C240 to boot off of 64-bit kernel?

I booted a c360 with 64 bit kernel, so it should work.  You have to
build your own kernel though, with CONFIG_PDC_NARROW=y.

Whether there is any point running a 64 bit kernel on a box that has
less that 4G of RAM is a different matter altogether.

Richard
