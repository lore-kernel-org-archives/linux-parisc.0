Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 51CF3482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Jul 2001 18:00:24 -0600 (MDT)
Received: from esiee.fr (mail.esiee.fr [147.215.1.3])
	by mail.esiee.fr (Postfix) with ESMTP id AA93CD15A6
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Jul 2001 02:00:09 +0200 (CEST)
Date: Tue, 17 Jul 2001 02:00:09 +0000
MIME-Version: 1.0
From: Clement MOYROUD <moyroudc@esiee.fr>
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=iso-8859-1
Message-Id: <20010717000009.AA93CD15A6@mail.esiee.fr>
Subject: [parisc-linux] 725/75 won't boot
List-ID: <linux-parisc.vger.kernel.org>

Hi all !                                                              
                                                                      
the ESIEE team just received a 725/75 from linuxcare, and when I tried
to make it boot palo issued a warning saying that the firmware doesn't
support PDC_MODEL_CAPABILITIES call. According to Paul Bame, this     
doesn't seem to be a palo issue, so i'm sending the TOC dump for you  
all hackers to see what's going on :                                  
                                                                      
General Registers:                                                    
                                                                      
00000000 00000000 1b1b1b1b 1b1b1b79 00020398 00200000 fffbf090        
00000089                                                              
fc4ff000 fc4ff000 00001000 001a5a59 001a5a59 000ff000 f000124c        
00000000                                                              
00000001 08000059 f0000694 00000000 00000000 00000001 00000000        
00006048                                                              
000b5a3c 000b5a44 00000000 00145008 000001b1 000000c0 000b46f0        
000b46f4                                                              
                                                                      
Control Registers:                                                    
                                                                      
00000000 00000000 00000000 00000000 00000000 00000000 00000000        
00000000                                                              
00000000 00000000 00000000 0000001e 00000000 00000000 000cc400        
00000000                                                              
38a073d5 00000000 1b1b1b1b 00000000 00000000 00000000 0000ff08        
80000000                                                              
00000800 f00000f0 ffffffcb ffffffff 0034183f 01234567 f0000694        
00067800                                                              
                                                                      
Space Registers:                                                      
                                                                      
00000000 00000000 00000000 00000000 00000000 00000000 00000000        
00000000                                                              
                                                                      
Instruction Address:                                                  
                                                                      
00000000 1b1b1b1b                                                     
                                                                      
        Check Type        = 0x20000000                                
        CPU State         = 0x9e000004                                
        Cache Check       = 0x00000000                                
        TLB Check         = 0x00000000                                
        Bus Check         = 0x00310007                                
        Assists Check     = 0x00000000                                
        Assist State      = 0x00000000                                
        System Responder Address = 0x1b1b1b18                         
        System Requestor Address = 0xfffbe000                         
        System Controller Status = 0x00000006                         
                                                                      
                                                                      
                                                                      
If you have a solution that would be great !                          
                                                                      
Clement Moyroud                                                       
Puffin ESIEE Team                                                     
