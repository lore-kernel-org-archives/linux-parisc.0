Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA24494
	for <parisc-linux@puffin.external.hp.com>; Wed, 9 Jun 1999 16:08:10 -0600
Received: (from tor@localhost)
	by pallas.spacetec.no (8.9.1a/8.9.1) id AAA02367
	for parisc-linux@thepuffingroup.com; Thu, 10 Jun 1999 00:06:50 +0200
Message-Id: <199906092206.AAA02367@pallas.spacetec.no>
From: tor@spacetec.no (Tor Arntsen)
Date: Thu, 10 Jun 1999 00:06:47 +0200
In-Reply-To: Alex deVries <adevries@thepuffingroup.com>
       "Re: [parisc-linux] build success" (Jun  9, 23:02)
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] build success
List-ID: <linux-parisc.vger.kernel.org>

On Jun 9, 23:02, Alex deVries wrote:
>Ack.  I'm having problems hitting 'reply all'.
>
>> -#!/bin/bash
>> +#!/usr/bin/env bash
>
>I've changed this to /bin/sh, and that's committed now.

I assumed there was something bash specific in that script (but I didn't 
look).

make clean; make bootable worked fine with your update (1.5 minutes
build time on an Octane.. ahh, I'll start compiling my i386 kernel 
there I guess :-)

-Tor
