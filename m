Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [156.153.255.205])
	by dsl2.external.hp.com (Postfix) with ESMTP id 37F374887
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Mar 2002 11:31:12 -0700 (MST)
To: jeronimo@curtarsa.com.ar
Cc: parisc-linux@lists.parisc-linux.org, taggart@carmen.fc.hp.com
Subject: Re: [parisc-linux] I'm using HP-UX 
In-Reply-To: Your message of "Fri, 15 Mar 2002 15:08:30 -0300."
             <000101c1cc4c$6b4a5960$190101c0@onnainty>
References: <000101c1cc4c$6b4a5960$190101c0@onnainty> 
Date: Fri, 15 Mar 2002 11:31:06 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20020315183106.5CB9E39573@carmen.fc.hp.com>
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

=?Windows-1252?Q?Onnainty_Jer=F3nimo?= writes...

> Tengo instalado el DTCMANAGER en un HP-UX, en el PA-Linux existe este
> producto?

Not currently. I think this would require both support for the DTC
devices and porting the DTCMANAGER software.

Do you just want to be able to access the devices? This might be possible
if someone wrote the right drivers.

Or do you want to use the DTCMANAGER software too? I don't think the HP
people in charge of this product plan to port it. You could ask
them though. One possiblity is to try and run it under PA-Linux using
the HP-UX binary support. I suspect you'll need the yet-to-be-implemented
signals stuff though, a bunch of HP-UX Libraries, as well as
the hardware support mentioned above(and maybe some sort of conversion
layer depending on how it wants to access the devices).

Short answer: while possible, I don't think it will ever happen. Don't
let that stop you from working on it though :)

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
