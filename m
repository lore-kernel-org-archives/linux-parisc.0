Return-Path: <paul@techcenter3000.com>
Received: from TECHCENTER3000.COM (cpe-24-221-227-115.tx.sprintbbd.net
	[24.221.227.115])
	by dsl2.external.hp.com (Postfix) with ESMTP id B22BB4A57
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 29 Apr 2004 11:54:08 -0600 (MDT)
Received: from betsy (cs2416712-202.houston.rr.com [24.167.12.202])
	by TECHCENTER3000.COM (Postfix) with SMTP id E55568001C
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 29 Apr 2004 12:52:52 -0500 (CDT)
Message-ID: <000301c42e13$0c4b8a30$0702a8c0@tfam.org>
From: "Paul" <paul@techcenter3000.com>
To: <parisc-linux@lists.parisc-linux.org>
Date: Thu, 29 Apr 2004 12:54:40 -0500
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Subject: [parisc-linux] gcc hang on alsa-lib
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

I know my machine isn't the fastest around, but should this take 10+ hrs 
(and counting)?

This is from alsa-libs-1.0.4.

make:
<snip>
if /bin/sh ../../libtool --mode=compile 
gcc -DHAVE_CONFIG_H -I. -I. -I../../include -I../../include    -g -O2 -MT 
pcm_para
ms.lo -MD -MP -MF ".deps/pcm_params.Tpo" \
  -c -o pcm_params.lo `test -f 'pcm_params.c' || echo './'`pcm_params.c; \
then mv -f ".deps/pcm_params.Tpo" ".deps/pcm_params.Plo"; \
else rm -f ".deps/pcm_params.Tpo"; exit 1; \
fi
gcc -DHAVE_CONFIG_H -I. -I. -I../../include -I../../include -g -O2 -MT 
pcm_params.lo -MD -MP -MF .deps/pcm_params.Tpo -c p
cm_params.c  -fPIC -DPIC -o pcm_params.lo

Top:
18630 root      25   0 11576 9936 4532 R 89.2  2.7 628:01.26 cc1
