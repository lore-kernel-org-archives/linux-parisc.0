Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust100.bre.cable.ntl.com [213.107.176.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id 354D2482A
	for <parisc-linux@parisc-linux.org>; Fri, 14 Dec 2001 00:07:15 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id A220BB00C; Fri, 14 Dec 2001 07:06:38 +0000 (GMT)
Date: Fri, 14 Dec 2001 07:06:38 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Peter Lavender <plaven@bigpond.net.au>
Cc: parisc <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] dumb question.. :(
Message-ID: <20011214070638.E25715@linuxcare.com>
References: <000701c18468$ecfca4d0$090ba8c0@winnie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <000701c18468$ecfca4d0$090ba8c0@winnie>; from plaven@bigpond.net.au on Fri, Dec 14, 2001 at 05:31:12PM +1100
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

On Fri, Dec 14, 2001 at 05:31:12PM +1100, Peter Lavender wrote:
> Hi Everyone,
> 
> I just d/led and burnt 0.9.3 iso and in my excitement I've stuck the CD in
> booted and it's worked!
> 
> Problem is now that I'm being asked were the install files are on the
> cdrom.. but I have no idea...

Generally speaking, just hit return to most of those confusing
questions when doing a CD install.  The exception is that on
one screen you'll be offered two choices of kernel/modules, one for
32 bit and one for 64.  Make sure you pick the right one.  If you
are not sure which was booted, you could scroll down to 'execute a
shell' on the menu and do 'uname -a' (or Alt-F2 if on graphics console).
You may also get asked about installing woody or sid; choose woody,
which is the first option, so again <return> does the right thing.

I've just heard that adding 'cdrom' as a boot option makes some of
this confusion go away, but I havn't investigated yet.

Richard
