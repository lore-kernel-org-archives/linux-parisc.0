From: =?ISO-8859-1?Q?Thibaut_VAR=C8NE?= <T-Bone@parisc-linux.org>
Subject: Weird sys readings during ghc run
Date: Thu, 6 May 2010 23:49:02 +0200
Message-ID: <00E6F5C7-BD87-4BD0-8E6F-C80D8E427DAA@parisc-linux.org>
References: <w2p7d01f9f01005060541jca558889j5e9ef1e4eccf675a@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi pa-ckers

Sometimes a few graphs tell a lot more than words, here's what has
been recently observed on lafayette.d.o, one of the hppa Debian
autobuilders.

http://imagebin.ca/view/uhqcMQ.html
http://imagebin.ca/view/kGT08zc.html
http://imagebin.ca/view/r61bGE0X.html

The beginning of the (seemingly) abnormal sys usage, and very high IPI
rate coincides with:

PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
14042 buildd    20   0  337m 311m  20m R   99  7.7 138:46.37 ghc

It looks like (but maybe I'm just paranoid) ghc is doing some nasty  
things...

Lafayette is running 2.6.32-3-parisc64-smp, and this apparently
happened during the build of haskell-src-exts_1.8.2-3

The build got eventually killed with ghc still running, see:
https://buildd.debian.org/fetch.cgi?&pkg=haskell-src-exts&ver=1.8.2-3&arch=hppa&stamp=1273149256&file=log

HTH

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/

