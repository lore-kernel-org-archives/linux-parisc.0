From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Cannot access '/dev/pts/143862': Value too large for defined data type
Date: Tue, 13 Jul 2004 12:21:35 -0700
Message-ID: <20040713192135.GJ546@tausq.org>
References: <200407132035.08844.deller@gmx.de>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <randolph@tausq.org>
In-Reply-To: <200407132035.08844.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

> d036493@hw1306:~ > screen
> Cannot access '/dev/pts/143862': Value too large for defined data type
> 
> What's the problem ?
> Can screen not cope with the "high" (>16bit) pid/uid values ?
> If yes, does screen needs to rebuild and could someone ask to rebuild it ?

I don't know, but I see this with ssh too...

pippin[12:20] ~% ssh legolas
Linux legolas 2.6.7-pa13 #78 Sun Jul 11 17:02:38 PDT 2004 parisc GNU/Linux
You have new mail.
fstat: Value too large for defined data type

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
