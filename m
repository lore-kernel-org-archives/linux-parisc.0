Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA15174
	for <parisc-linux@puffin.external.hp.com>; Mon, 27 Mar 2000 15:40:33 -0700
From: willy@thepuffingroup.com
Date: Mon, 27 Mar 2000 18:40:25 -0500
To: Mike Brancato <funnyguy@digitalsmackdown.net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] build errors, recipe still not up to date?
Message-ID: <20000327184025.C31396@thepuffingroup.com>
References: <Pine.LNX.4.10.10003271628390.18589-100000@morph.net> <Pine.LNX.4.10.10003271704100.18835-100000@morph.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.10.10003271704100.18835-100000@morph.net>; from Mike Brancato on Mon, Mar 27, 2000 at 05:07:03PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Mar 27, 2000 at 05:07:03PM -0500, Mike Brancato wrote:
> ok, I guess I forgot to ask my real question, how would I create the
> ramdisk image?

Easy: Download one from puffin.external.hp.com/pub/parisc/ramdisks/
Hard: create a non-sparse file, using dd.  create an ext2 filesystem on it.
Mount it via loopback.  copy whatever you want onto it.

> also, say I want nfs, I have two hpux 11.0 machines I could mount from.
> machine A has a raid array (/users/) attached to it, and machine B mounts
> that same array in /users/ via nfs.  can i have the root for the parisc
> linux in /opt/linuxroot/ or something, and have the parisc machine mount
> that thru nfs?  i'm new to nfs.

Linux NFS Root looks for /tftpboot/<ip-address> by default.  I think
there's a way to change it, but I forget how.
