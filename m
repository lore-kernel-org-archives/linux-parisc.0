Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA09700
	for <parisc-linux@puffin.external.hp.com>; Fri, 18 Aug 2000 06:09:40 -0600
Received: from ppp-1-219.cvx3.telinco.net (HELO rhirst.linuxcare.com) (@212.1.144.219)
  by mailserv2.iuinc.com with SMTP; 18 Aug 2000 12:09:25 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id C21E1B005; Fri, 18 Aug 2000 13:08:35 +0100 (BST)
Date: Fri, 18 Aug 2000 13:08:35 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] test6 merge
Message-ID: <20000818130835.B13870@linuxcare.com>
References: <20000815160510.C7757@vodka.thepuffingroup.com> <20000818124944.A13870@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000818124944.A13870@linuxcare.com>; from rhirst@linuxcare.com on Fri, Aug 18, 2000 at 12:49:44PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Aug 18, 2000 at 12:49:44PM +0100, Richard Hirst wrote:
> I just commented out the 'goto err_out_free_netdev' in tulip_core.c
> and it now claims to mount nfs root, but cannot find init.

In fact, it gets as far as reading the first block of init,
doesn't like it, then goes and tries to read /bin/sh, finds it is
a link to busybox, reads in the first block of that, and doesn't
like it either:

13:06:01.601816 10.1.1.42.3529076739 > thinkpad.nfs: 104 getattr fh Unknown/1 (DF)
13:06:01.602198 thinkpad.nfs > 10.1.1.42.3529076739: reply ok 96 getattr DIR 40755 ids 0/0 sz 4096 
13:06:01.602930 10.1.1.42.3529076740 > thinkpad.nfs: 104 statfs fh Unknown/1 (DF)
13:06:01.603217 thinkpad.nfs > 10.1.1.42.3529076740: reply ok 48 statfs tsize 8192 bsize 4096 blocks 1795208 bfree 1036107 bavail 944915
13:06:01.654497 10.1.1.42.3529076741 > thinkpad.nfs: 112 lookup fh Unknown/1 "dev" (DF)
13:06:01.654939 thinkpad.nfs > 10.1.1.42.3529076741: reply ok 128 lookup fh Unknown/1
13:06:01.655678 10.1.1.42.3529076742 > thinkpad.nfs: 116 lookup fh Unknown/1 "console" (DF)
13:06:01.656096 thinkpad.nfs > 10.1.1.42.3529076742: reply ok 128 lookup fh Unknown/1
13:06:01.746812 10.1.1.42.3529076743 > thinkpad.nfs: 112 lookup fh Unknown/1 "sbin" (DF)
13:06:01.747229 thinkpad.nfs > 10.1.1.42.3529076743: reply ok 128 lookup fh Unknown/1
13:06:01.748070 10.1.1.42.3529076744 > thinkpad.nfs: 112 lookup fh Unknown/1 "init" (DF)
13:06:01.748482 thinkpad.nfs > 10.1.1.42.3529076744: reply ok 128 lookup fh Unknown/1
13:06:01.752611 10.1.1.42.3529076745 > thinkpad.nfs: 116 read fh Unknown/1 4096 bytes @ 0 (DF)
13:06:01.755048 thinkpad > 10.1.1.42: (frag 29180:1244@2960)
13:06:01.756395 thinkpad > 10.1.1.42: (frag 29180:1480@1480+)
13:06:01.757625 thinkpad.nfs > 10.1.1.42.3529076745: reply ok 1472 read (frag 29180:1480@0+)
13:06:01.801136 10.1.1.42.3529076746 > thinkpad.nfs: 112 lookup fh Unknown/1 "etc" (DF)
13:06:01.801363 thinkpad.nfs > 10.1.1.42.3529076746: reply ok 28 lookup ERROR: No such file or directory
13:06:01.841690 10.1.1.42.3529076747 > thinkpad.nfs: 112 lookup fh Unknown/1 "bin" (DF)
13:06:01.842115 thinkpad.nfs > 10.1.1.42.3529076747: reply ok 128 lookup fh Unknown/1
13:06:01.842839 10.1.1.42.3529076748 > thinkpad.nfs: 112 lookup fh Unknown/1 "init" (DF)
13:06:01.843059 thinkpad.nfs > 10.1.1.42.3529076748: reply ok 28 lookup ERROR: No such file or directory
13:06:01.881209 10.1.1.42.3529076749 > thinkpad.nfs: 112 lookup fh Unknown/1 "sh" (DF)
13:06:01.881792 thinkpad.nfs > 10.1.1.42.3529076749: reply ok 128 lookup fh Unknown/1
13:06:01.882522 10.1.1.42.3529076750 > thinkpad.nfs: 104 readlink fh Unknown/1 (DF)
13:06:01.882761 thinkpad.nfs > 10.1.1.42.3529076750: reply ok 44 readlink "/bin/busybox"
13:06:01.883512 10.1.1.42.3529076751 > thinkpad.nfs: 116 lookup fh Unknown/1 "busybox" (DF)
13:06:01.883917 thinkpad.nfs > 10.1.1.42.3529076751: reply ok 128 lookup fh Unknown/1
13:06:01.887998 10.1.1.42.3529076752 > thinkpad.nfs: 116 read fh Unknown/1 4096 bytes @ 0 (DF)
13:06:01.890360 thinkpad > 10.1.1.42: (frag 29187:1244@2960)
13:06:01.891710 thinkpad > 10.1.1.42: (frag 29187:1480@1480+)
13:06:01.892955 thinkpad.nfs > 10.1.1.42.3529076752: reply ok 1472 read (frag 29187:1480@0+)

I guess it doesn't recognise the file format for some reason..

Richard.
