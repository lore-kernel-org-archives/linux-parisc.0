Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA27913
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 08:52:13 -0700
Received: from amrelay1.boi.hp.com (amrelay1.boi.hp.com [15.56.8.24])
	by atlrel2.hp.com (Postfix) with ESMTP id 2155DA1
	for <parisc-linux@thepuffingroup.com>; Wed, 22 Nov 2000 10:54:28 -0500 (EST)
Received: from xrosebh3.rsvl.itc.hp.com (xrosebh3.rsvl.itc.hp.com [15.34.240.67])
	by amrelay1.boi.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.02) with ESMTP id IAA07658
	for <parisc-linux@thepuffingroup.com>; Wed, 22 Nov 2000 08:54:26 -0700 (MST)
Message-ID: <ED34C7F701D5D31196260090278CAFDA01981A60@xatl04.atl.hp.com>
From: "CLAPPER,MIKE \(HP-USA,ex1\)" <mike_clapper@hp.com>
To: "'parisc-linux@thepuffingroup.com'" <parisc-linux@thepuffingroup.com>
Date: Wed, 22 Nov 2000 07:54:24 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] B132L boot hang
List-ID: <linux-parisc.vger.kernel.org>



Hello Everyone,

I download the cross-compilers and  build a lifimage on Redhat 6.1.  I set
up nfsroot on a S712 running hpux 10.20.  With this I am able to boot a
B132L running pdc 6.1 - 
almost.  I get a hang right after -

VFS: Mounted root (nfs filesystem) readonly
Warning: unable to open an initial console


I have a 700/96 on serial port 1 as the console.  I have hpux on a disc in
the unit I'm trying to boot - from HPUX I have verified I can nfs mount the
filesys I'm using for NFSROOT.

With linux in this condition the machine will respond to ping.  I will also
react to a telnet - i get the telnet banner then "connection closed by
foreign host".  FTP gets "connection 
refused" - so it' partially alive.....

Is there a way to keyword search the developers archive?  I vaguely recall
seeing the 'initial console' warning, but couldn't find it browsing the
developers archive


Thanks,

Mike

**********************************************
Mike Clapper                                  
North American Crisis Management Team        
Hewlett Packard                       

(405) 948-4715
**********************************************
