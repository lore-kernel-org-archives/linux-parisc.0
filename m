Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sisko.scot.redhat.com (pc-62-31-66-30-ed.blueyonder.co.uk [62.31.66.30])
	by dsl2.external.hp.com (Postfix) with ESMTP id 68A6A482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Sep 2001 09:39:48 -0600 (MDT)
Date: Mon, 10 Sep 2001 16:39:34 +0100
From: "Stephen C. Tweedie" <sct@redhat.com>
To: Timothy Ball <timball@tux.org>
Cc: parics Linux Mailing List <parisc-linux@lists.parisc-linux.org>,
	Ext3 Users ml <Ext3-users@redhat.com>
Message-ID: <20010910163934.D8056@redhat.com>
References: <20010908174914.O29708@gwyn.tux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010908174914.O29708@gwyn.tux.org>; from timball@tux.org on Sat, Sep 08, 2001 at 05:49:14PM -0400
Subject: [parisc-linux] Re: ext3+parisc kernel
List-ID: <linux-parisc.vger.kernel.org>

Hi,

On Sat, Sep 08, 2001 at 05:49:14PM -0400, Timothy Ball wrote:

> I got ext3 from the cvs, and the parisc 2.4.9-pa17 kernel and I've
> patched the parisc kernel w/ the add-to-kernel.sh script. after a bit of
> fighting I got the kernel to compile. ...
> 
> Now when I boot. /proc is not mounted at boot, and when I mount it all
> the files in /proc appear to be directories.

Odd --- did you do a make clean before rebuilding?

--Stephen
