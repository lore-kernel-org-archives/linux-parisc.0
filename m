Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA28762
	for <parisc-linux@puffin.external.hp.com>; Fri, 27 Oct 2000 14:39:44 -0600
Message-Id: <5.0.0.25.0.20001027131913.00a57090@mail.webcash.com>
Date: Fri, 27 Oct 2000 13:37:49 -0700
To: Matt Taggart <taggart@carmen.fc.hp.com>
From: Kailashnath V Rampure <kailasr@webcash.com>
Subject: Re: [parisc-linux] glibc problem 
Cc: deller@gmx.de, parisc-linux@thepuffingroup.com
In-Reply-To: <20001027004731.F142D38137@carmen.fc.hp.com>
References: <Your message of "Thu, 26 Oct 2000 14:37:20 PDT." <5.0.0.25.0.20001026142948.00a3deb0@mail.webcash.com>
 <Message from Kailashnath V Rampure <kailasr@webcash.com>
 <5.0.0.25.0.20001026125217.00a43eb0@mail.webcash.com>
 <5.0.0.25.0.20001025173830.00a64a30@mail.webcash.com>
 <5.0.0.25.0.20001026125217.00a43eb0@mail.webcash.com>
 <5.0.0.25.0.20001026142948.00a3deb0@mail.webcash.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="=====================_94006934==_.ALT"
List-ID: <linux-parisc.vger.kernel.org>

--=====================_94006934==_.ALT
Content-Type: text/plain; charset="us-ascii"; format=flowed

Hi Matt,

I could run as you told but had problems so i did what helge had (you need 
to go to /palo/ipl and do "hppa-linux-ranlib ipl.a". Then go back to /linux 
and do a "make palo" again.) then lif image was created.

But when I type bo lan at HP server Iget the following error
-------------------------
Booting...
Cannot find ENTRY_TEST.

Fail to initialize.

ENTRY_INT
Status=-7
----------------------------------
My config files are as follows:

I have /etc/bootptab file as follows:
-------------------------
linux:\
         hn:\
         sm=255.255.248.0:\
         vm=rfc1048:\
         ht=ether:\
         hd=/tftpboot:\
         bf=vmlinux:\
         ha=0010830339e0:\
         ip=192.168.1.237
--------------------------------

and my exports file reads as :
--------------------------------------------------
/tftpboot/linux linux(rw,no_root_squash)
-------------------------------------------------------

I had changed the NFSROOT line in Makefile in palo  to
NFSROOT = 192.168.1.236:/tftpboot/linux



At 06:47 PM 10/26/00 -0600, Matt Taggart wrote:

>Kailashnath V Rampure writes...
>
> > Thanks Matt,
> >
> > I have downloaded prebuilt cross-compiler but can you direct me to any
> > documentation how to use this cross compiler. I want to do a NFS boot. I
>
>Untar it in /, it will live in /opt/palinux.
>Add /opt/palinux/bin to your path
>Edit palo/Makefile and set it up for nfsroot, mine has the following line,
>
>NFSROOT = 15.1.51.72:/tftpboot/geordi
>
>That's the location of my nfsroot. Make sure you export it. My /etc/exports
>contains,
>
>/tftpboot/geordi                15.1.51.73(rw,no_root_squash)
>
>Then in the linux directory do,
>
>make oldconfig (maybe answer questions)
>make dep;make clean
>make palo
>
>Setup your bootp server to point to the lifimage generated. My /etc/bootptab
>contains,
>
>geordi:\
>         hn:\
>         sm=255.255.248.0:\
>         vm=rfc1048:\
>         ht=ether:\
>         hd=/tftpboot:\
>         bf=lif-geordi:\
>         ha=0800097891EB:\
>         ip=15.1.51.73
>
>and /tftpboot/lif-geordi is a symlink to palo/lifimage
>
>Hopefully that's enough information to get you going. If you have problems
>please let me know how far you get.
>
>Thanks,
>
>--
>Matt Taggart
>taggart@fc.hp.com

--=====================_94006934==_.ALT
Content-Type: text/html; charset="us-ascii"

<html>
Hi Matt,<br>
<br>
I could run as you told but had problems so i did what helge had (you
need to go to /palo/ipl and do &quot;hppa-linux-ranlib ipl.a&quot;. Then
go back to /linux and do a &quot;make palo&quot; again.) then lif image
was created. <br>
<br>
But when I type bo lan at HP server Iget the following error<br>
-------------------------<br>
Booting...<br>
Cannot find ENTRY_TEST.<br>
<br>
Fail to initialize.<br>
<br>
ENTRY_INT<br>
Status=-7<br>
----------------------------------<br>
My config files are as follows:<br>
<br>
I have /etc/bootptab file as follows:<br>
-------------------------<br>
linux:\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hn:\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sm=255.255.248.0:\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vm=rfc1048:\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ht=ether:\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hd=/tftpboot:\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bf=vmlinux:\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ha=0010830339e0:\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ip=192.168.1.237<br>
--------------------------------<br>
<br>
and my exports file reads as :<br>
--------------------------------------------------<br>
/tftpboot/linux linux(rw,no_root_squash)<br>
-------------------------------------------------------<br>
<br>
I had changed the NFSROOT line in Makefile in palo&nbsp; to <br>
NFSROOT = 192.168.1.236:/tftpboot/linux<br>
<br>
<br>
<br>
At 06:47 PM 10/26/00 -0600, Matt Taggart wrote:<br>
<br>
<blockquote type=cite class=cite cite>Kailashnath V Rampure
writes...<br>
<br>
&gt; Thanks Matt,<br>
&gt; <br>
&gt; I have downloaded prebuilt cross-compiler but can you direct me to
any <br>
&gt; documentation how to use this cross compiler. I want to do a NFS
boot. I <br>
<br>
Untar it in /, it will live in /opt/palinux.<br>
Add /opt/palinux/bin to your path<br>
Edit palo/Makefile and set it up for nfsroot, mine has the following
line,<br>
<br>
NFSROOT = 15.1.51.72:/tftpboot/geordi<br>
<br>
That's the location of my nfsroot. Make sure you export it. My
/etc/exports <br>
contains,<br>
<br>
/tftpboot/geordi<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab>15.1.51.73(rw,no_root_squash)<br>
<br>
Then in the linux directory do,<br>
<br>
make oldconfig (maybe answer questions)<br>
make dep;make clean<br>
make palo<br>
<br>
Setup your bootp server to point to the lifimage generated. My
/etc/bootptab <br>
contains,<br>
<br>
geordi:\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hn:\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sm=255.255.248.0:\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vm=rfc1048:\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ht=ether:\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hd=/tftpboot:\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bf=lif-geordi:\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ha=0800097891EB:\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ip=15.1.51.73<br>
<br>
and /tftpboot/lif-geordi is a symlink to palo/lifimage<br>
<br>
Hopefully that's enough information to get you going. If you have
problems <br>
please let me know how far you get.<br>
<br>
Thanks,<br>
<br>
-- <br>
Matt Taggart<br>
taggart@fc.hp.com</blockquote></html>

--=====================_94006934==_.ALT--
