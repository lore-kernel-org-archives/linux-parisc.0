Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 755F181EE
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Mar 2001 02:38:32 -0700 (MST)
Received: from esiee.fr (mail.esiee.fr [147.215.1.3])
	by mail.esiee.fr (Postfix) with ESMTP id B3C9BD1588
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Mar 2001 10:38:30 +0100 (CET)
Date: Mon, 05 Mar 2001 10:38:30 +0000
MIME-Version: 1.0
From: Bruno IGLESIAS <iglesiab@esiee.fr>
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=iso-8859-1
Message-Id: <20010305093830.B3C9BD1588@mail.esiee.fr>
Subject: [parisc-linux] Problems on 715/50
List-ID: <linux-parisc.vger.kernel.org>

Hi !                                                                  
                                                                      
  I'm working on a 715/50 with the ESIEE TEAM. /proc/cpuinfo reports  
0.50 Bogomips instead of the 50 reported during the boot of the kernel
of the 1st March . More over, the kernel is booting well with the     
nfsroot of the puffin but don't execute INIT with ESIEE root          
Filesystem ( freezing after mounting Root partition) .Replacing Init  
by /bin/sh didn't change anything. If anyone could explain these      
differences ??                                                        
                                                                      
I'm currently porting the SETI@home client for PaLinux :o)            
                                                                      
   Bye Bruno                                                          
