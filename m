Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA30139
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 10:25:27 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id 9EFC6498
	for <parisc-linux@thepuffingroup.com>; Wed, 22 Nov 2000 09:27:09 -0800 (PST)
Message-Id: <200011221727.JAA21644@milano.cup.hp.com>
To: "CLAPPER,MIKE \(HP-USA,ex1\)" <mike_clapper@hp.com>
Cc: "'parisc-linux@thepuffingroup.com'" <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] B132L boot hang 
In-reply-to: Your message of "Wed, 22 Nov 2000 07:54:24 PST."
             <ED34C7F701D5D31196260090278CAFDA01981A60@xatl04.atl.hp.com>
Date: Wed, 22 Nov 2000 09:27:20 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"CLAPPER,MIKE (HP-USA,ex1)" wrote:
> 
> 
> Hello Everyone,
> 
> I download the cross-compilers and  build a lifimage on Redhat 6.1.  I set
> up nfsroot on a S712 running hpux 10.20.  With this I am able to boot a
> B132L running pdc 6.1 - 
> almost.  I get a hang right after -
> 
> VFS: Mounted root (nfs filesystem) readonly
> Warning: unable to open an initial console

I think I need more output. Based on ioscan output, the B132L
has two serial ports:
8/16/4 - off of LASI
8/20/2 - of WAX (EISA Bus Adapter)

(GSCtoPCI is at 8/0)

I don't think the one off of WAX is supported right now.

Are you using the default .config produced by "make oldconfig"?

It's also possible the LASI support is broken on B132L and I would
expect some console output indicating what's wrong.

> I have a 700/96 on serial port 1 as the console.  I have hpux on a disc in
> the unit I'm trying to boot - from HPUX I have verified I can nfs mount the
> filesys I'm using for NFSROOT.

NFS root mounted fine. Console is the problem.

...
> Is there a way to keyword search the developers archive?  I vaguely recall
> seeing the 'initial console' warning, but couldn't find it browsing the
> developers archive

Yes - http://puffin.external.hp.com/cgi-bin/mailgrep

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
