Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9AE29482C
	for <parisc-linux@parisc-linux.org>; Thu, 15 Nov 2001 22:05:20 -0700 (MST)
Message-Id: <200111160501.WAA18562@puffin.external.hp.com>
To: Thomas Marteau <marteaut@esiee.fr>
Cc: "parisc-linux@parisc-linux.org" <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] The A500 likes 2.4.14-pa3 
In-Reply-To: Message from Thomas Marteau <marteaut@esiee.fr>
   of "Thu, 15 Nov 2001 22:40:12 +0100." <3BF4363C.42B5F4AE@esiee.fr>
Date: Thu, 15 Nov 2001 22:01:09 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
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

Thomas Marteau wrote:
> 	A short mail to tell you that I succeed to boot my A500-5X with
> 2.4.14-pa3 as you will see below!

Excellent! (lots of good news tonight for a change :^)

> 	Then, I try with the SMP support. But a function is not implemented for
> parisc. cpu_online_map is in init/main.c and coming from the recent
> merge, afaik.

I've fixed that issue in my local tree but haven't had a chance to test it.
(had to fix sba HPMC issue first)

> I commented it. It was compilable. So I give it a shot: 

hehe...ok. I'll test out my fix and commit tonight if it works fine.

thanks!
grant
