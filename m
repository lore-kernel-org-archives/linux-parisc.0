Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 26E9B4A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Mar 2001 04:54:31 -0700 (MST)
Date: Thu, 22 Mar 2001 12:54:29 +0000
Subject: Re: [parisc-linux] Problem with FS of ESIEE on 720 !
MIME-Version: 1.0
From: marteau <marteaut@esiee.fr>
To: Christoph Plattner <christoph.plattner@alcatel.at>
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <3AB9D629.DA9A14FC@alcatel.at>
Cc: parisc-linux@lists.parisc-linux.org
Message-Id: <20010322115429.50240D15F5@mail.esiee.fr>
List-ID: <linux-parisc.vger.kernel.org>

Hi Christoph and PA-RISCers !                                         
                                                                      
>I have tried the current and the last ESIEE file system,             
>but I have problems with both. I used my own kernel,                 
The kernels you will find are designed for 712 but it seems to work   
many others boxes!                                                    
vmlinux.mou is a kernel that integrate the low level mouse driver!    
(you can check via /proc/interrupts)                                  
                                                                      
>running with the palinux-0.5, but the ESIEE always hangs.            
>If I do not change the /dev/console, I get the warning...            
>(of course, I have not compiled in the STI). So tried                
>to set the `mknod console c 5 1' and I also tried the                
>"hack" doing a link to `ttyS0'. In both cases `init'                 
I read what Matthew wrote. We goona look at it in order to be         
automatic                                                             
                                                                      
>gives no welcome message (version, etc...) and the machine           
>hangs !                                                              
Our inittab file is specific for dual screen (if you use STI console  
and Serial terminal!)                                                 
I do not know how it reacts if the kernel expect a console with the   
serail port :( Any idea?                                              
                                                                      
Also you can refer to this mail:                                      
http://lists.parisc-linux.org/pipermail/parisc-linux/2001-March/011997
.html                                                                 
                                                                      
>Now I will instrument the kernel with `printk's to see,              
>if he can start something,.....                                      
You can but once init is launched the dmesg is less usefull.          
                                                                      
>What's the topic with the TERM variable ??                           
TERM=LINUX is not operational                                         
TERM=vt100 or pcansi are working!                                     
                                                                      
>Have I set it to a special value ???                                 
>Can that be the reason ???                                           
Don't think so                                                        
                                                                      
Bye, Thomas                                                           
