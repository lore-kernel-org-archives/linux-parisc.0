Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 13101482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 May 2001 11:57:25 -0600 (MDT)
Date: Thu, 17 May 2001 17:45:26 +0000
Subject: Re: [parisc-linux] Booting from SCSI disk.
MIME-Version: 1.0
In-Reply-To: <9EB1F7B63758D411A78D00A0C9D84789B16BED@UKCRN03>
From: Xavier Debacker <debackex@esiee.fr>
To: "Bright, Stephen" <Stephen.Bright@thales-esecurity.com>
Content-Type: text/plain; charset=iso-8859-1
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Message-Id: <20010517154527.04341D15AC@mail.esiee.fr>
List-ID: <linux-parisc.vger.kernel.org>

> Hi,                                                                 
>                                                                     
> I have a newly acquired 712/80 which I have booting happily via NFS.
 I                                                                    
> would like to set it up to boot from the SCSI hard drive.  However, 
reading                                                               
> the instructions on the website states that you need to use an i386 
machine                                                               
> to fdisk and run palo on the hdd.  Unfortunately I don't own a SCSI 
card for                                                              
> my i386 boxes.                                                      
                                                                      
Hi Stephen,                                                           
                                                                      
Maybe you can use the cdrom iso (think about the easy sys-install and 
net-install scripts)                                                  
If you don't have any external scsi cdrom drive, you can still use the
contents as a nfsroot with a few changes (keeping your current /etc   
directory should be enough)                                           
                                                                      
http://mkhppa1.esiee.fr/en/download.html for latest iso               
                                                                      
good luck                                                             
Xavier.                                                               
