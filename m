Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 17623482E
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Sep 2003 15:21:54 -0600 (MDT)
Message-ID: <3F5CF2F6.3040101@tiscali.be>
Date: Mon, 08 Sep 2003 21:21:58 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: "Thaddeus A. Wilson" <tawilson@utmem.edu>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] problems installing debian on a c180
References: <3F5CE605.327AD964@utmem.edu>
In-Reply-To: <3F5CE605.327AD964@utmem.edu>
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

Thaddeus A. Wilson wrote:

>i had previously done some messing around with a c180 and at one time
>figured
>out how to install but have since lost my notes.
>
>i have a c180 with an hp A4071B graphics card installed in GSC slot 3
>and
>recognized as HPA4071B_LZ
>
>i know i previously had to enter "video=stifb:off" in the palo:
>
>default when i choose to interact with ipl on boot as parameters to
>kernal in
>palo are:
>
>1. 0/vmlinux
>2. ramdisk_size=8192
>3. initrd=0/ramdisk
>4. console=tty0
>
There should the place where you would probaly insert "video=stifb:off" 
(just for remind: select 4 then at the end of line insert a space 
followed by video=stifb:off)

>5. sti=1/0/0
>6. sti_font=VGA8x16
>7. TERM=linux
>
>if i accept default it gets past that message indicating a problem with
>console
>but the screen goes black although it looks as if the monitor is still
>active
>i.e. green light not a yellow one.
>
>i am using the debian 3.0r1 disk as my boot disk.
>
>i recall the last time i got the install to work i got a penguin in the
>corner
>but graphic install never worked and i had some difficulty with the x
>server
>starting.  any help on reinstallation would be appreciated i.e.
>necessary mods
>to the parameters on boot to get back to installing.
>  
>
hmm the most simple way would be first to re-try the install from a 
serial console (or an actual conole in vt100 emulation or a minicom 
session from another system). (the tips is to unplug ps/2 kbd/mouse so 
the pdc will switch automatically console to serial port 1 at reboot time)

Once your system is ready you may be first update it (with apt-get for 
example) and install a more recent kernel (iirc 2.4.21 should be already 
pkged or a 2.4 cvs)  to be sure that pb was not already solved since 3.0 
cds.
If you still experiment pb into 
<http://parisc-linux.org/mailing-lists/index.html> you could try to 
search (with google engine) "c180" related mail in this ml

Another  solution could be to try a netinstall from a recent lifimage 
available near <http://pateam.esiee.fr/cd-images/testing>.

hth,
    Joel
