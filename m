Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2B5D84829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 31 May 2003 11:56:58 -0600 (MDT)
Message-ID: <3ED8F031.5080903@tiscali.be>
Date: Sat, 31 May 2003 18:10:57 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: Siraj 'Sid' Rakhada <sid@mindless.co.uk>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Installation on a K370 with Debian 3.0r1 + RAID1
 boot.
References: <56739.194.131.108.2.1054389276.squirrel@ssl.mindless.co.uk>
In-Reply-To: <56739.194.131.108.2.1054389276.squirrel@ssl.mindless.co.uk>
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

Hello Sid,

First of all congratulation for your great job [I am not quiet sure to 
reach this result at my first atempt) and many thanks for your kind 
reports: very clear and fine appropriate details.

Siraj 'Sid' Rakhada wrote:

[...]

>cd /mnt
>tar -C / -clspf - . | tar -xlspvf -
>cd /mnt/usr
>tar -C /usr -clspf - . | tar -xlspvf -
>cd /mnt/boot
>tar -C /boot -clspf - . | tar -xlspvf -
>cd /mnt/home
>tar -C /home -clspf - . | tar -xlspvf -
>cd /mnt/var
>tar -C /var -clspf - . | tar -xlspvf -
>  
>
I also split my fs copy at this stage but normaly if you mount all your 
fs under "/mnt" then:
cd /mnt
tar -C / -cspf - . | tar -xspvf  # just remove 'l' (el) option and 
remove v option shlould be quicker

should work also in one step (as you have 4*9Gb disks, may be do you 
still have 2 free to test and confirm this; many thanks in advance)

>I hope this helps someone! The documentation out there was very useful -
>though the ttyB0 change of the major number really got me for a while (I
>only found out that this had changed through searching the mailing
>list)...
>
>This is also the first time I've ever really used a HP box, and they are
>... interesting :) e.g. is it normal that the machine will take about 10+
>minutes to boot up? (just to get to the boot ROM, nothing to do with linux
>- self tests are enabled, though disabilng them does not make too much of
>a difference).
>
hmm, I am not quiet sure but may be this pb is solved in 2.4.20-pa35...

>Also, anyone aware if SMP will work on this box? I have two CPU's, but I'm
>only using one, as I believe the netinstall CD only ces with a SMP
>disabled kernel, and I have not got the 2.4.20 kernel source available at
>the moment (The HP box is not connected to the Internet).
>
SMP kernel should work on your K. Afaik, as there few K's running linux, 
the best would be to experiment by your self (the tips is that your 
original kernel config file stand in /boot; so you copy it into your 
linux src tree as .config and use make menuconfig to change SMP config 
:-) ).

To grab the kernel src now? How do you grab the last net boot install?

My HP boches ( :-) ) are not more connected to Internet (well just a 
light weight firewall with a pstn connection at 33000 bauds and trust me 
it is not enough to download a full kernel src in a quick way: just 
enough for some cvs update (personnaly I am awaiting a subversion server 
...) ). So I grab src (tar.gz available on ftp.parisc-linux.org/cvs or 
just patch .gz or via cvs server) on my pc and just transfer this to my 
HP box via ftp or scp (you just have be sure to have a well configured 
NIC and a ftpd or sshd server installed either on your pc (if also a 
linux) or on your hp box)

Hope this help,
    Joel

>
>Anyway, great project. I'm glad it all works now :)
>
>  
>
Well come to the club :-)
