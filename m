Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6B6424880
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Sep 2003 14:35:37 -0600 (MDT)
Message-ID: <3F57A22C.5050902@tiscali.be>
Date: Thu, 04 Sep 2003 20:35:56 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: Matthew Wilcox <willy@debian.org>
Cc: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel crash with 2.6.0-test4-pa8 on 715/100
References: <3F5728AB.3040501@hrzpub.tu-darmstadt.de> <20030904140615.GN18654@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20030904140615.GN18654@parcelfarce.linux.theplanet.co.uk>
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

Hi Willy,

Matthew Wilcox wrote:

>On Thu, Sep 04, 2003 at 01:57:31PM +0200, Ruediger Scholz wrote:
>  
>
>>I tried to boot 2.6.0-test4-pa8 on my HP 715/100, but it crashed right 
>>after the message "Freeing unused kernel memory...". I'm using debian 
>>testing with devfs and gcc-3.3.1.
>>I think the pb is devfs, so I will try to boot a kernel without it.
>>Bootlog is attached, Config, System.map is here: 
>>http://rscholz.bluehash.de/parisc
>>    
>>
>
>I'm seeing the same thing on my 712 without devfs.  Not sure what the
>problem is, and I'm having a hard time getting that box back up as it has
>a broken root filesystem (damn tar for being linked against libpthread!)
>  
>
Is that libpthread the cause of your broken fs?

Thanks in advance for advise,
    Joel
