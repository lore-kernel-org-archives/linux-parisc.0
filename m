Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 818BA4845
	for <parisc-linux@lists.parisc-linux.org>; Sun, 28 Sep 2003 10:56:40 -0600 (MDT)
Message-ID: <3F7712C2.2000902@tiscali.be>
Date: Sun, 28 Sep 2003 16:56:34 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Jacek Chmielewski <jchmiel@kti.ae.poznan.pl>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PALO do not start!
References: <881138831633.20030923163001@kti.ae.poznan.pl>
In-Reply-To: <881138831633.20030923163001@kti.ae.poznan.pl>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Jacek Chmielewski wrote:

>Hi
>
>I managed to install Debian on my HP 9000/J200 box (I used DHCP server and
>netinstall lifimage). The installation procedure passed without problems. I
>created three partitions:
>/dev/sda1  *  1    4    16461  f0  Linux/PA-RISC boot
>/dev/sda2     5   34   123690  82  Linux swap
>/dev/sda3  * 35  277  1001889  83  Linux
>
it seems that sda3 stand well into the first 2gb of your disk?
Do you have severall disk on your system and so do boot on the right disk?
if your system 'autoboot', interupt it with [Esc]; the main menu would 
show you something like:
   Primary boot path:    core.FWSCSI.6.0
   Alternate boot path:  
core.FWSCSI.5.0                                                                     


>
>After the reboot I get the following result:
>
>Booting...
>Boot IO Dependent Code (IODC) revision 1
>HARD Booted.
>
>... and everything nothing happens. I assume that I should see PALO
>starting from the /dev/sda1 partition,
>
yes

> but it don't want to start.
>
>What could be possibly wrong?
>
>Is there any solution or workaround for this problem?
>
Try to restart your netinstall, in the second menu you should be able to 
go into a small shell.
There create first /mnt/BD in your ramdisk and so mount /dev/sda3 /mnt/DB.
verify first the contents of /mnt/DB/etc/palo.conf.

hth,
    Joel
