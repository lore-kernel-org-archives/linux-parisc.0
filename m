Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA01770
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 13:08:30 -0700
Message-Id: <200011152010.MAA13760@milano.cup.hp.com>
To: Jack Perdue <j-perdue@tamu.edu>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] nfsroot - 712/60 - RPC - help 
In-reply-to: Your message of "Wed, 15 Nov 2000 13:53:03 PST."
             <4.3.0.20001115132700.00cc91b0@clavin.cs.tamu.edu>
Date: Wed, 15 Nov 2000 12:10:36 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Jack Perdue wrote:

Two changes:

> a) I've tried NFSROOT=192.168.1.11  and NFSROOT=192.168.1.11/tftpboot/vmlinux
>     in palo/Makefile and the results are the same (both suggestions were
>     made to this list at some point)

Try NFSROOT=192.168.1.11/tftpboot/pancho


> ========== blacktower:/etc/bootptab ==========
> pancho:\
>          :hd=/tftpboot:\
>          :bf=vmlinux:\
>          :ht=ether:\
>          :ha=08000993DA02:\
>          :sm=255.255.255.0:\
>          :hn:\
>          :ip=192.168.1.13:\
>          :vm=rfc1048:

This is just a nit:
  bf= might be better named ":bf=lifimage\"

(and you only need one colon between entry's :^)
Copy <sourcedir>/palo/lifimage to /tftpboot/lifimage.

There must be something wrong but I don't see it.

grant


> kmem_create: Forcing size word alignment - nfs_fh
> Looking up port of RPC 100003/2 on 192.68.1.11
> RPC: sendmsg returned error 229
> portmap: RPC call returned error 229

I don't see these types of errors on my config.
Could be related to the misdirected NFSROOT.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
