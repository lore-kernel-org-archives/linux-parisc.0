Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel9.hp.com (atlrel9.hp.com [156.153.255.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id A06B64829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 14 Aug 2002 23:45:41 -0600 (MDT)
To: =?ISO-8859-1?Q?R=FCdiger_Scholz?= <rscholz@hrzpub.tu-darmstadt.de>
Cc: parisc-linux@lists.parisc-linux.org, taggart@carmen.fc.hp.com
Subject: Re: [parisc-linux] CD-ROM Audio Output 
In-Reply-To: Your message of "Wed, 14 Aug 2002 08:36:43 +0200."
             <3D59FA7B.4050500@hrzpub.tu-darmstadt.de>
References: <3D59FA7B.4050500@hrzpub.tu-darmstadt.de> 
Date: Wed, 14 Aug 2002 23:45:38 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20020815054538.0F65937D00@carmen.fc.hp.com>
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

=?ISO-8859-1?Q?R=FCdiger_Scholz?= writes...

> I want to install a CD-Drive in my 715/100. Is it possible to use the 
> internal audio output of the CD-ROM in the same way it used in a PC? 
> Which type of cable do I have to use?

The problem is where to connect it. There's no way to plug it in to the
built-in audio. One alternative might be to use an EISA or ISA soundcard
that has the right connector for a cdrom cable, but I'm not sure if
anyone's tried that yet. If anyone does, please post notes to the list.

If you want to listen to audio cd's you could just plug directly into the
cdrom output and then control the drive via scsi. That's what I used to
do with hpux and I don't see any reason why it shouldn't work. But then
you don't get the mixing with other sources that the sound card provides.

-- 
Matt Taggart
taggart@fc.hp.com
