Return-Path: <r.scholz@bluehash.de>
Received: from mail.medianet-world.de (mail.medianet-world.de [213.157.0.167])
	by dsl2.external.hp.com (Postfix) with SMTP id 451A048B6
	for <parisc-linux@lists.parisc-linux.org>;
	Thu,  8 Apr 2004 02:03:50 -0600 (MDT)
Message-ID: <407507A5.2090302@bluehash.de>
Date: Thu, 08 Apr 2004 10:04:53 +0200
From: =?ISO-8859-1?Q?R=FCdiger_Scholz?= <r.scholz@bluehash.de>
MIME-Version: 1.0
To: JKonrad@linotype.com, parisc-linux@lists.parisc-linux.org
Subject: Re: Antwort: Re: [parisc-linux] problems installing on k 200
References: <OF394C6696.D015ED94-ONC1256E70.002B26AF@fonts.de>
In-Reply-To: <OF394C6696.D015ED94-ONC1256E70.002B26AF@fonts.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hello,

you can check the major and minor number for /dev/ttyB0 by changing to 
/dev and typing "ls -l ttyB0". The fifth column of the output is the 
major and minor number of the device.
If it's the wrong major number, delete /dev/ttyB0 and create a new 
device file via mknod. I think "mknod /dev/ttyB0 b XX" should do the 
job. Replace XX with the major number you need.

Greetings,
    Ruediger

JKonrad@linotype.com schrieb:

>Hello Ryan,
>
>sorry for being a newbie, but:
>
>how do I check the major number of this driver?
>how do I change this number?
>where is this number to be found?
>
>Yours
>
>Jay
>
>  
>
