Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from spoolm1.tiscalinet.be (spoolm1.tiscalinet.be [212.35.2.50])
	by dsl2.external.hp.com (Postfix) with ESMTP id ABD70482A
	for <parisc-linux@parisc-linux.org>; Sat,  1 Jun 2002 13:10:31 -0600 (MDT)
Message-ID: <3CF91C48.5000008@freebel.net>
Date: Sat, 01 Jun 2002 19:11:04 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] gcc-cvs problem
References: <200205311715.g4VHF4Pu006500@hiauly1.hia.nrc.ca>
Content-Type: text/plain; charset=us-ascii; format=flowed
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


John David Anglin wrote:
>>It seems to be well comited in last cvs update this morming I got in
>>src/gcc/gcc/fixinc/inclhack.def:
>>...
>>/*
>> * __thread is now a keyword.
>> */
> 
> 
>>But do not seems to be applied as I got the same error?
>>
>>What do I wrong or forget to do?
> 
> 
> You should see the following in your build output:
> 
> Applying thread_keyword           to pthread.h
> Fixed:  pthread.h
> 
> A fixed pthread.h should appear in the {build}/gcc/include directory.
> This seems to work ok for me in a native hppa-linux build.  However,
> it appears that you are trying to do a cross build.

AFAIK gcc bootstrap does not work for hppa?

> If the header
> is not being fixed, you will need to examine your build log carefully
> to determine why the fix isn't being done or doesn't work.
> 

I will have a detailed look but as newbee in gcc stuff it will take a time.

Thank again for attention and help,
	Joel
