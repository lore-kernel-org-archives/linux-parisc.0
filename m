Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id C6BF54A19
	for <parisc-linux@parisc-linux.org>; Fri,  9 Mar 2001 09:44:46 -0700 (MST)
Received: from esiee.fr (mail.esiee.fr [147.215.1.3])
	by mail.esiee.fr (Postfix) with ESMTP id 93224D15C5
	for <parisc-linux@parisc-linux.org>; Fri,  9 Mar 2001 17:43:48 +0100 (CET)
Date: Fri, 09 Mar 2001 17:43:48 +0000
MIME-Version: 1.0
From: Bruno IGLESIAS <iglesiab@esiee.fr>
To: parisc-linux@parisc-linux.org
Content-Type: text/plain; charset=iso-8859-1
Message-Id: <20010309164348.93224D15C5@mail.esiee.fr>
Subject: [parisc-linux] Bug 72 ( Floating point problems )
List-ID: <linux-parisc.vger.kernel.org>

Hi all,                                                               
                                                                      
	The test of the Seti@client reveals lots of problems. When the       
calculation doesn't result in an illegal instruction (cf A500), the   
results are false. The kernel running was compiled on a B132L and the 
xc seems to be an old one. We now try with an newer kernel and xc.    
                                                                      
	The calculation time for the test is 56 hours. Under HPUX, it is     
about 30 hours.                                                       
                                                                      
	A link is available in our page                                      
(http://mkhppa1.esiee.fr/en/result.html) showing the comparison       
between the client and the official results.                          
                                                                      
Bye                                                                   
	Bruno IGLESIAS                                                       
