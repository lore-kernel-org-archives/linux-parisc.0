Received: from cosrel1.hp.com (cosrel1.hp.com [156.153.255.170])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id PAA21993
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Mar 2000 15:27:26 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by cosrel1.hp.com (Postfix) with ESMTP id 7F97E104
	for <parisc-linux@puffin.external.hp.com>; Wed,  1 Mar 2000 14:28:46 -0700 (MST)
Message-Id: <200003012128.NAA09977@milano.cup.hp.com>
To: "Martin K. Petersen" <mkp@mkp.net>
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] nfsroot howto 
In-reply-to: Your message of "14 Feb 2000 23:34:26 PST."
             <yq1itzr9zwt.fsf@leyland.socsci.auc.dk>
Date: Wed, 01 Mar 2000 13:28:42 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


One more update for HP-UX impaired folks (like me)

"Martin K. Petersen" wrote:
...
> Unpack the nfsroot tarball in /tftpboot and rename the unpacked
> directory (mybox) to the hostname of your box.

[ Just a reminder to find my previous update regarding HP-UX
  vs linux mknod. I still don't know for sure what I posted
  is correct. ]

...
> Make sure both bootps and tftp are enabled in /etc/inetd.conf.
> 
> Edit your /etc/exports to contain a line like this:
> 
> 	/tftpboot/mybox		mybox(rw,no_root_squash)
> 
> Again, replace mybox with your hostname.
> 
> Restart inetd and nfs services if you made any modifications.

Here's the /etc/exports contents on my HP-UX NFS server:
/tftpboot/turin         -rw=turin,root=turin

where "turin" is the nfsroot client. turin has an entry in /etc/hosts.

Then as root, "exportfs -av" will actually export those file systems.
When rebooting the nfs server, this will automatically be done.

and when I booted the parisc-linux workstation (turin=15.8.80.75):

...
Sending BOOTP requests.... OK
IP-Config: Got BOOTP answer from 15.8.80.76, my address is 15.8.80.7515.8.80.75
...

One problem less.

later,
grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
