Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.iinet.net.au (symphony-01.iinet.net.au [203.59.24.16])
	by dsl2.external.hp.com (Postfix) with SMTP id 87A82482A
	for <parisc-linux@parisc-linux.org>; Fri,  1 Jun 2001 12:03:19 -0600 (MDT)
Date: Sat, 2 Jun 2001 02:03:02 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] Version 0.9 of PA-RISC Linux Released
Message-ID: <20010602020300.A20205@neep.com.au>
References: <20010601030203.EE8B937EF8@carmen.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010601030203.EE8B937EF8@carmen.fc.hp.com>; from taggart@carmen.fc.hp.com on Thu, May 31, 2001 at 09:02:03PM -0600
List-ID: <linux-parisc.vger.kernel.org>

Congratulations, team, on making the release!

I had a quick look the files which I found here:

  http://puffin.external.hp.com/pub/parisc/cd-images/

A couple of questions arose:

- what's the 142MB "gg" file dated "01-Jun-2001 10:23"?  I mean, I know
  who gg is (hi grant) but as this file is of around the same vintage as
  all the 0.9 compressed ISOs I thought I'd see if it was related

- are all the 0.9 ISOs identical except for which kernel is booted by
  default?  eg does the 0.9-32bit-STI CD image also contain the kernels
  for the 32bit-serial and 64bit-serial installs?

Oh, hang on, I see my second question is already answered by the footer
of the above HTTP directory listing, but I'll leave it in for the
archives I guess.  Answer is:


  You can change one 0.9 ISO into another by replacing the first 512
  bytes.  For example, to change the 32serial into the 64serial, do

  dd bs=512 conv=notrunc if=palinux-0.9-64serial.iso.sector0 \
  of=palinux-0.9-32serial.iso

  You probably want to rename the file too...


I see the same information is provided in a more brief form at the
bottom of the 0.9 README.  Oh well, pardon my ramblings.  ;)

Andrew.

--
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
