From: Xianjie Zhang <xzhang@cup.hp.com>
Subject: [parisc-linux] J7000: Problem to Install Kernel and Driver Modules
Date: Fri, 16 Jul 2004 22:42:50 -0700
Message-ID: <40F8BC5A.9040208@cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi, there,

I am trying to install Linux on a HP J-7000 machine.
I burned the Debian 3.0 R1 CD 1 and 2, boot the system to the following 
screen:
===========================================
   Debian GNU/Linux Installation Main Menu
 You've mounted your root filesystem.  You may initialize and
 mount additional filesystems, or you may go on to install  
  the operating system kernel and the modules.         
  Next      : Install Kernel and Driver Modules    
 Alternate : Initialize a Linux Partition             
 Alternate1: Mount a Previously-Initialized Partition  
 Configure the Keyboard                                x    x             
x x Partition a Hard Disk                                 x    
x              
x x Initialize and Activate a Swap Partition              x    
x              
x x Activate a Previously-Initialized Swap Partition      x    
x             
 x x Do Without a Swap Partition                           x    
x              
x x Initialize a Linux Partition                          x    
x             
x x Mount a Previously-Initialized Partition              x    
x             
 x x Unmount a Partition                                   x    
x               x
===========================================

So I selected to " Install Kernel and Driver Modules ". For the next 
screen, I selected cdrom. Then I got the following:

"Please place the first Debian CD-ROM in the CD-ROM drive. "

Since the CD is already in place, I select continue. Now the screen says:
=================
             Mount failed
The CD-ROM was not mounted successfully.      
                        <Continue>                         
================

I tried to eject the CD and insert it again, NO success.
I also tried to insert the number 2 CD, still the same failure.

Did anyone see this before?  (The mail archive is huge, I did a cursory 
search, but failed to find an answer.)
Since the system can boot from the CD, I suppose it should not have any 
problem to mount it. What is wrong with it?

(Is it because that the CD-ROM has already been mounted? and nobody 
umount it?)

Thanks and regards,

Xianjie



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
