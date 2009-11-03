From: Marek Denis <marek@octogan.net>
Subject: hanging kernel - HPMC problem
Date: Tue, 03 Nov 2009 11:07:09 +0100
Message-ID: <4AF000CD.1010007@octogan.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello all,

I am encountering probably quite typical problem with my PA-RISC server. 
Unfortunately, I couldn't find any solution on google.
I am trying to configure kernel on HPPA machine with old PA8000 (with 
300MHz clock) processor.
I managed to install Debian lenny on that machine, configured most of 
the services, owever while trying to recompile the kernel I alwas get 
HPMC bus timeout during the boot. Generic kernel works perfectly, would 
you give me any hints where should I look for a mistake?
I suppose this is only kernel configuration issue.
Here is the .config file that didn't work:
http://pastebin.com/f45530dd7

I would appreciate any help

Marek Denis
