Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailserver1.hrz.tu-darmstadt.de (mailserver1.hrz.tu-darmstadt.de [130.83.126.41])
	by dsl2.external.hp.com (Postfix) with ESMTP id 334A74829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Aug 2002 02:42:40 -0600 (MDT)
Message-ID: <3D5B64C5.6020303@hrzpub.tu-darmstadt.de>
Date: Thu, 15 Aug 2002 10:22:29 +0200
From: =?ISO-8859-15?Q?R=FCdiger_Scholz?= <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: Matt Taggart <taggart@carmen.fc.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] CD-ROM Audio Output
References: <3D59FA7B.4050500@hrzpub.tu-darmstadt.de> <20020815054538.0F65937D00@carmen.fc.hp.com>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
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

That's bad. Cause my my 715 has no EISA/ISA-Slot. When I opened the 
machine, I recognized a 3-Pin-Connector (labeled J19) near the hinges 
and the power connector. So I thought this could be an audio connector...
Well, so let's do it the other way...

By the way: is it possible to get some documentation for my machine?

Matt Taggart wrote:

>The problem is where to connect it. There's no way to plug it in to the
>built-in audio. One alternative might be to use an EISA or ISA soundcard
>that has the right connector for a cdrom cable, but I'm not sure if
>anyone's tried that yet. If anyone does, please post notes to the list.
>
>If you want to listen to audio cd's you could just plug directly into the
>cdrom output and then control the drive via scsi. That's what I used to
>do with hpux and I don't see any reason why it shouldn't work. But then
>you don't get the mixing with other sources that the sound card provides.
>
>  
>
