Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from xo.hp.is (xo.hp.is [194.105.242.199])
	by dsl2.external.hp.com (Postfix) with ESMTP id DE6B0482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Sep 2001 07:53:36 -0600 (MDT)
Received: (from ra@localhost)
	by xo.hp.is (8.11.6/RA-8.11.6) id f8LDrZM12790
	for parisc-linux@lists.parisc-linux.org; Fri, 21 Sep 2001 13:53:35 GMT
Date: Fri, 21 Sep 2001 13:53:35 +0000
From: Richard Allen <ra@hp.is>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010921135335.E11577@hp.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] C360 install fails
List-ID: <linux-parisc.vger.kernel.org>

Im using the 0.9.2 CD.  I have a C360 (512Meg RAM, 9 Gig hard drive) and
I removed the Graphics card from it and hooked it to a serial console.

The machine boots just fine into the installer.  I created that f0 partition,
a small /boot, a swap partition and the remaining disk as /

After that it makes me select a distro (I select sid as the documentation says)
then this hits:

         +컴컴컴컴컴컴컴컴컴컴컴+ Please Wait +컴컴컴컴컴컴컴컴컴컴컴�+         
         |                                                            |         
         | Installing Drivers from                                    |         
         | /instmnt/debian/dists/sid/main/disks-hppa/current/64/drive |         
         | rs.tgz...                                                  |         
         |                                                            |         
                                                                                
         ioctl: LOOP_CLR_FD: No such device or address                          
    YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI                                            
PSW: 00000000000001001111111100001100                                           
r0-3     00000000 101fc000 101a5134 2fe06b60                                    
r4-7     00000000 00000000 10337010 10318684m Installation                      
r8-11    10318010 10318010 1030c010 1030c468                                    
r12-15   10337010 ffffffff 000000fd f0100000                                    
r16-19   10300580 f0000154 f000014c 0000000e                                    
r20-23   0000001f 000003e7 101a5c14 00000000                                    
r24-27   00000000 00000005 ffd05805 1028a010
r28-31   10335810 00000592 10300a80 101213f8
sr0-3    00000000 00000065 00000000 00000000
sr4-7    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 101fc2bc 101fc2c0
 IIR: 0f40001c    ISR: a607ffff  IOR: 41505805
 ORIG_R28: 00000000


Any hints ?
-- 
Rikki.         --  HP Technical Support, RHCE, RHCX, HP-UX Certified Admin.
               --  Solaris 7 Certified Systems and Network Administrator.
Bell Labs Unix --  Reach out and grep someone.
Those who do not understand Unix are condemned to reinvent it, poorly.
