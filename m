Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.xs4all.nl (smtp1.xs4all.nl [194.109.127.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0FBDE482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 16 Sep 2001 04:21:53 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp1.xs4all.nl (8.9.3/8.9.3) with ESMTP id MAA11487
	for <parisc-linux@lists.parisc-linux.org>; Sun, 16 Sep 2001 12:21:51 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Sun, 16 Sep 2001 11:55:18 +0200
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] linux and hp 735/125 fs corruption
Message-ID: <20010916115518.A1399@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
References: <Pine.LNX.4.33.0109160125430.22634-100000@lefou>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0109160125430.22634-100000@lefou>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Sep 16, 2001 at 01:45:53AM -0600, Sonny Cook wrote:
> 
> I am baffeled.  I haven't been able to find any information on this
> subject, other than to note that 2.4.0 has been blamed for fs corruption
> on some systems.
> 
I have seen lots of disk-corruption on my C200+, both with 2.4.0 and
with 2.4.9-pa{16|18|20} but it always seems to start with some
scsi-error. By the time the partition is remounted r/o, things like
complete linux-kernel source trees are crosslinked and corrupted. So
far, I've not lost anything really essential, but having all the links
in /etc/rc2.d/ removed wasn't that much fun.

Do you have any messages in the log-files?

Good luck,
Jurriaan
-- 
The unicorn stared unhappily at the dragon. "I don't suppose there's any
chance that thing is a vegetarian?" The dragon smiled. His pointed teeth
gleamed brightly in the sunlight.
	Simon R Green - Blue Moon Rising
GNU/Linux 2.4.9-ac10 SMP/ReiserFS 2x1402 bogomips load av: 0.00 0.09 0.06
