From: Dirk Van Hertem <dirk.vanhertem@ieee.org>
Subject: [parisc-linux] Debian sarge netinstall hangs after first boot on
	b132l
Date: Thu, 14 Jul 2005 18:07:41 +0200
Message-ID: <42D68DCD.3010403@ieee.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
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

Hello,

I got an hp b132l to play with :) and decided to put debian sarge on it, 
downloaded the latest netinstall cd from the web (debian site) and 
installed using serial console.

The install went ok, after making the initial ramdisk larger (64k 
instead of 16), and gave no errors, but after the copying of the files 
and doing the first reboot. My system hung. I wasn't able to do anything 
(even the power button didn't work).

The last message on my console was the following:

HP SDC: Spunking the self test register to force PUP on next firmware
reset. HP SDC MLC: Registering the System Domain Controller's HIL MLC.

Which is strange because there is no HIL stuff in this machine (this has 
something to do with the keyboard if I'm correct, but the b132l uses 
ps/2 interfaces for mouse and keyboard).

Another strange thing was that the kernel that was chosen during install 
was a smp kernel? (2.6.8...smp something, I didn't pay real attention at 
that time)

When I posted a message concerning this issue on a belgian linux 
newsgroup, there was someone who said he had experienced the same thing, 
and resolved this by booting from a gentoo cd and installing the latest 
kernel. Probably I'll attempt the same thing later on but I wanted to 
ask if there are other options or if I made some mistake?

Greetings,

Dirk

-- 
Dirk Van Hertem                       Dirk.VanHertem@esat.kuleuven.be
Electrical Engineering Department  http://www.esat.kuleuven.be/electa
Katholieke Universiteit Leuven, ESAT-ELECTA      tel: +32-16-32.18.95
10, Kasteelpark Arenberg, B-3001 Heverlee        fax: +32-16-32.19.85 

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
