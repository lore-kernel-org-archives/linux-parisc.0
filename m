Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7CA814872
	for <parisc-linux@lists.parisc-linux.org>; Wed, 27 Nov 2002 06:09:14 -0700 (MST)
Date: Wed, 27 Nov 2002 14:08:37 +0100
Message-ID: <3DA3C54C000078BE@ocpmta5.be.tiscali.com>
From: jsoe0708@tiscali.be
Subject: Re: FW: RE: [parisc-linux] 2.4.20-rc1-pa7 boot problem on b180
To: "Grant Grundler" <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hi grant,
>
>>
>>jsoe0708@tiscali.be wrote:
>>> Hi Grant,
>>>
>>> Could it be related to your patch in msg:
>>> http://lists.parisc-linux.org/pipermail/parisc-linux/2002-November/018418.htm
>>>   l
>>>
>>> If yes can you re-forward it to me (I lost it sorry)?
>>
>>hmm....I doubt it. I'd expect the box to crash if it were.
>>
>You have right it doesn't matter.
>
>But I do some progress:
>Partition Check locks on the b180 at :
>....
>    res=check_part[i](hd, bdev, first_sector, first_part_minor);
>....
>in check_partition(...)
>
>in the very first check_part[0]
>
>Now how may I determine (with printk) which actual function is called?
>
Well stopping gcc at preprocessing stage, I reach to figure out that only
msdos_partition is configured.

I continue (i will check first transmitted parameter values)

Joel


********************************************************************************
Controlez mieux votre consommation Internet...surfez Tiscali Complete...http://tiscali.complete.be
