Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA03700
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 13:56:49 -0700
Received: from manz-3e3645ce.pool.mediaways.net (HELO trinity.johannes-zahn.de) (root@[62.54.69.206]) (envelope-sender <ich@johannes-zahn.de>)
          by twister.domainfactory.de (qmail-ldap-1.03) with SMTP
          for <parisc-linux@thepuffingroup.com>; 15 Nov 2000 20:58:49 -0000
Received: from trinity (joe@trinity [192.168.1.1])
	by trinity (8.9.3/8.9.3/SuSE Linux 8.9.3-0.1) with SMTP id VAA20482
	for <parisc-linux@thepuffingroup.com>; Wed, 15 Nov 2000 21:49:31 +0100
From: johannes zahn <ich@johannes-zahn.de>
Reply-To: ich@johannes-zahn.de
Date: Wed, 15 Nov 2000 21:49:31 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Message-Id: <00111521493100.20428@trinity>
Subject: [parisc-linux] init dies on apollo 720
List-ID: <linux-parisc.vger.kernel.org>

Hi!

I'm trying to get a 720/50 to boot from nfs, but as soon as the nfs 
mound happened init dies. This is all i get on the serial console 
(pasted from minicom):


kmem_create: Forcing size word alignment - nfs_fh    
Looking up port of RPC 100003/2 on 192.168.1.1       
Looking up port of RPC 100005/2 on 192.168.1.1
VFS: Mounted root (nfs filesystem) readonly.

handle_interruption() pid=1 command='init'

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111011100001011
r0-3     00000000 4001ad3c 400057a3 00001f58
r4-7     4001967c 00000000 4001ada0 00001f58
r8-11    00000000 000023cc 00000001 00000000
r12-15   00001034 00000006 40019622 2001ff18
r16-19   c1fdc000 c027b60c 00000000 4001967c                            
r20-23   0000a090 0000a090 00009d8c 00001f58                            
r24-27   00000001 00000081 4001ada0 c01492b0                            
r28-31   00000000 0000000b 20020790 400032d7                            
sr0-4    00000001 00000001 00000000 00000001                            
sr4-8    00000001 00000001 00000001 00000001                            
        
IASQ: 00000001 00000001 IAOQ: 4000d237 4000d23b                         
 IIR: 0ed51280    ISR: 00000001  IOR: 00009d8c                          
ORIG_R28: 4001b208                                                      
        
handle_interruption() pid=1 command='init'                              
        
     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI                   

[...]

I tried the cvs-latest kernel and palo from 2000-11-10 and 2000-11-14 
with the crosscompiler from 2000-10-31. Buildhost is i386 linux.

nfsroot was from 2000-10-09 or base.tgz from the 0.5 beta CD.

I also tried the ramdisk images with sercon and sticon, but the kernel 
only says "cannot mount root FS on 01:00".

The kernel from the 0.5 beta CD seems to have the parport stuff, and 
that does not work on this machine.

Any ideas? Or a working .config?


johannes
