Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id A711C4A19
	for <parisc-linux@parisc-linux.org>; Thu,  8 Mar 2001 07:16:55 -0700 (MST)
Date: Thu, 08 Mar 2001 15:16:48 +0000
MIME-Version: 1.0
From: Bruno IGLESIAS <iglesiab@esiee.fr>
To: submit@bugs.parisc-linux.org
Content-Type: text/plain; charset=iso-8859-1
Cc: parisc-linux@parisc-linux.org
Message-Id: <20010308141648.B672CD15EA@mail.esiee.fr>
Subject: [parisc-linux] Problem on floating calculation
List-ID: <linux-parisc.vger.kernel.org>

	When I execute Seti@home client (32 Bits executable) on a 64 Bit     
architecture ( HP900A500-A5X i.e ESIEE's A500) ,the expression :      
                                                                      
   "exp(-(0.693 * SQUARE((float)(i) - (float)(ul_TOffset))) /         
(float)(f_SigmaSq))"                                                  
                                                                      
doesn't work with some specific value. For example exp(-89.790901)    
result in an illegal instruction message.                             
                                                                      
I'm using the current xc ( 0307 ) and a quite recent cvs update of the
kernel ( running in a monoprocessor version.                          
                                                                      
	Bruno IGLESIAS                                                       
