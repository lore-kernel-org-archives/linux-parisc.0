Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA32638
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 13:03:34 -0700
Received: from omgw1.boi.hp.com (omgw1.boi.hp.com [15.56.8.101])
	by palrel3.hp.com (Postfix) with ESMTP id 87DCD6C2
	for <parisc-linux@thepuffingroup.com>; Wed, 22 Nov 2000 12:05:38 -0800 (PST)
Message-ID: <ED34C7F701D5D31196260090278CAFDA01981A69@xatl04.atl.hp.com>
From: "CLAPPER,MIKE \(HP-USA,ex1\)" <mike_clapper@hp.com>
To: "'Grant Grundler'" <grundler@cup.hp.com>,
        "CLAPPER,MIKE \(HP-USA,ex1\)" <mike_clapper@hp.com>
Cc: "'parisc-linux@thepuffingroup.com'" <parisc-linux@thepuffingroup.com>
Subject: RE: [parisc-linux] B132L boot hang 
Date: Wed, 22 Nov 2000 12:05:23 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Thanks Grant,

I verified the console is off 8/16/4.0 and that it is the LASI port.  I also
downloaded the newest cross-compiler and source code.  After rebuilding the
palo lifimage I get the same hang in the same place.  Since I was cabled to
a dumb terminal I was not able to capture the boot output.  I will find the
right cable to hook up to my pc so I can capture the output and send it to
you - perhaps an error occurred earlier in the boot that I overlooked.

Thanks for the help.

Mike


-----Original Message-----
From: Grant Grundler [mailto:grundler@cup.hp.com]
Sent: Wednesday, November 22, 2000 11:27 AM
To: CLAPPER,MIKE (HP-USA,ex1)
Cc: 'parisc-linux@thepuffingroup.com'
Subject: Re: [parisc-linux] B132L boot hang 


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
> the unit I'm trying to boot - from HPUX I have verified I can nfs mount
the
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

---------------------------------------------------------------------------
To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.
