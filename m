Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1C4EA482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Sep 2001 22:10:34 -0600 (MDT)
Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA24261
	for <parisc-linux@puffin.external.hp.com>; Mon, 3 Sep 2001 22:08:22 -0600
Message-ID: <3B9453BC.60607@videotron.ca>
Date: Tue, 04 Sep 2001 00:08:28 -0400
From: James Waterhouse <james.waterhouse@videotron.ca>
MIME-Version: 1.0
To: Richard Hirst <rhirst@linuxcare.com>
Cc: "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>,
	"debian-hppa@lists.debian.org" <debian-hppa@lists.debian.org>
References: <3B8FB5EF.3020301@videotron.ca> <20010902101556.W11744@linuxcare.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] Re: booting problems
List-ID: <linux-parisc.vger.kernel.org>

Hello Richard,

Richard Hirst wrote:

> On Fri, Aug 31, 2001 at 12:06:07PM -0400, James Waterhouse wrote:
> 
>>Hello everyone,
>>	I'm seem to be having trouble booting into linux on my 712/60. I hope 
>>someone can help. I have built a new kernel (from cvs) and also set up 
>>an nfs root. When I try to boot the linux boots up to the point where it 
>>says "Cleaning: /tmp/ /var/lock /var/run" and then it just hangs. Any 
>>idea what is cause it to hang? Could there be a problem with the nfsroot?
>>
> 
> Possible.  What are you using for your nfsroot?


For an nfsroot I'm using the debian base from
ftp://puffin.external.hp.com/pub/parisc/binaries/debian/basetars/base-20010404.tar.gz

> Does it still respond to pings?


Yes it still responds to pings.

> What console are you using?


I don't know... (do you mean sti or serial? if so then I think it is sti 
... whatever is default the config)

> Do you get a prompt if you boot with 'init=/bin/sh'?


How do I do that?

James


> 
> Richard
> 
> 
> 
