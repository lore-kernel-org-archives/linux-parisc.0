Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA24375
	for <parisc-linux@puffin.external.hp.com>; Mon, 27 Nov 2000 10:09:16 -0700
From: marteau <marteaut@esiee.fr>
To: grundler@cup.hp.com
Content-Type: text/plain; charset=iso-8859-1
Date: Mon, 27 Nov 2000 18:11:36 +0000
MIME-Version: 1.0
Cc: parisc-linux@thepuffingroup.com
Message-Id: <20001127171136.B02CFD15BD@mail.esiee.fr>
Subject: [parisc-linux] 
List-ID: <linux-parisc.vger.kernel.org>

Hi all,                                                               
                                                                      
	We have tried to compile the new linux source today and vmlinux      
always needs pci.o to link. It works if you delete pci.o from the     
objects list in the kernel Makefile. But, we don't know why it was    
needed because we did not ask for in our "make config"...             
                                                                      
We appreciate any help!                                               
                                                                      
THX,                                                                  
ESIEE Team                                                            
